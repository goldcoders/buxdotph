import 'dart:async';

import 'package:buxdotph/src/headers.dart';
import 'package:buxdotph/src/models/checkout_payload.dart';
import 'package:buxdotph/src/services/bux_client.dart';
import 'package:dotenv/dotenv.dart' show env;

extension BoolParsing on String {
  bool parseBool() {
    if (toLowerCase() == 'true') {
      return true;
    } else if (toLowerCase() == 'false') {
      return false;
    }
    throw Exception('Could not parse bool from $this');
  }
}

class Bux {
  static const String production_base_url = 'https://api.bux.ph/v1/api';
  static const String sandbox_url = 'https://api.bux.ph/v1/api/sandbox';

  /// Bux Checkout Api
  ///
  /// For more information on the Bux Checkout Api, please visit:
  ///
  /// https://developers.bux.ph/#tag/Generate-Checkout-URL
  static Future<String?> checkout(CheckoutPayload payload) async {
    final BuxClient buxClient = BuxClient();
    const String api_endpoint = '/open/checkout';

    return buxClient.post(
      _baseUrl(),
      api_endpoint,
      payload.toJson(),
      Headers.setDefault(),
    );
  }

  static String _baseUrl() {
    final String sandbox = env['BUX_SANDBOX']!;
    final bool isSandBox = sandbox.parseBool();
    late final String base_url;

    if (isSandBox) {
      base_url = sandbox_url;
    } else {
      base_url = production_base_url;
    }
    return base_url;
  }
}
