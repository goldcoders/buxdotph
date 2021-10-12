import 'package:buxdotph/const/env.dart';
import 'package:buxdotph/maps/bux.dart';
import 'package:buxdotph/maps/error_response.dart';
import 'package:buxdotph/models/http/headers.dart';
import 'package:buxdotph/models/http/methods.dart';
import 'package:equatable/equatable.dart';

class CheckCodeQueryEntity extends Equatable {
  final HttpMethod method;
  final Headers headers;
  final String req_id;
  final String client_id;
  final String mode;
  final Map<int, Map<String, String>> errorResponse;

  const CheckCodeQueryEntity(
    this.method,
    this.headers,
    this.mode,
    this.client_id,
    this.errorResponse, {
    required this.req_id,
  });

  @override
  List<Object?> get props =>
      <Object?>[method, headers, req_id, client_id, mode];
}

// ignore: lines_longer_than_80_chars
/// Bux Fetch Details API allows you to view complete details (status, amount and channel) of the payment made by your customer to any of our available channels.
///
/// [Bux Fetch Details API](https://developers.bux.ph/#tag/Fetch-Details)
///
// ignore: lines_longer_than_80_chars
/// - [req_id] is the Reference ID from you (Unique ID, will be used for postback)
///
/// > Request ID is usually , Product ID, Order ID or Transaction ID
///
class CheckCodeQuery extends CheckCodeQueryEntity {
  CheckCodeQuery(
    String req_id,
  )   : assert(buxEnv[BUX_CLIENT_ID] != null),
        super(
          HttpMethod.GET,
          Headers.setDefault(acceptJson: false),
          'API',
          buxEnv[BUX_CLIENT_ID]!,
          buxApiErrorResponse,
          req_id: req_id,
        );
}
