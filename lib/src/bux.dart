import 'dart:async';
import 'dart:developer' as devlog;

import 'package:buxdotph/src/models/checkout_payload.dart';
import 'package:buxdotph/src/services/bux_client.dart';
import 'package:equatable/equatable.dart';

class BuxEntity extends Equatable {
  final String apiKey;
  final String? apiSecret;
  final bool sandbox;
  final String clientId;

  const BuxEntity({
    required this.apiKey,
    this.apiSecret,
    required this.sandbox,
    required this.clientId,
  });

  @override
  List<Object?> get props => <Object?>[apiKey, apiSecret, sandbox, clientId];
}

class Bux extends BuxEntity {
  static const String production_base_url = 'https://api.bux.ph/v1/api';
  static const String sandbox_url = 'https://api.bux.ph/v1/api/sandbox';

  /// Bux Credentials can be passed in via the constructor
  ///
  /// or via the environment variables
  ///
  /// as **BUX_API_KEY, BUX_API_SECRET, BUX_SANDBOX, BUX_CLIENT_ID**
  ///
  /// to be Used with dart package [envify](https://pub.dev/packages/envify) for secure environment variables
  const Bux({
    required String apiKey,
    String? apiSecret,
    required bool sandbox,
    required String clientId,
  }) : super(
          apiKey: apiKey,
          apiSecret: apiSecret,
          sandbox: sandbox,
          clientId: clientId,
        );

  /// Bux Checkout Api
  ///
  ///
  /// For more information on the Bux Checkout Api, please visit:
  ///
  /// https://developers.bux.ph/#tag/Generate-Checkout-URL
  Future<String?> checkout(CheckoutPayload payload) async {
    final BuxClient buxClient = BuxClient();
    const String api_endpoint = '/open/checkout';

    final Map<String, String> headers = _setHeaders();
    devlog.log(_baseUrl(), name: 'base_url');
    devlog.log(api_endpoint, name: 'base_url');
    devlog.log(payload.toString(), name: 'payload');
    devlog.log(headers.toString(), name: 'headers');

    return buxClient.post(
      _baseUrl(),
      api_endpoint,
      payload.toJson(),
      headers,
    );
  }

  String _baseUrl() {
    late final String base_url;

    if (sandbox == true) {
      base_url = sandbox_url;
    } else {
      base_url = production_base_url;
    }
    return base_url;
  }

  Map<String, String> _setHeaders({
    bool acceptJson = true,
    bool withApiKey = true,
    Map<String, String>? headers,
  }) {
    headers ??= <String, String>{};
    if (acceptJson == true) {
      final Map<String, String> accept = <String, String>{
        'Accept': 'application/json'
      };
      headers.addAll(accept);
    }

    if (withApiKey == true) {
      final Map<String, String> headerApiKey = <String, String>{
        'x-api-key': apiKey,
      };
      headers.addAll(headerApiKey);
    }
    return headers;
  }
}
