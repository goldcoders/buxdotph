import 'package:buxdotph/const/env.dart';
import 'package:buxdotph/maps/bux.dart';
import 'package:buxdotph/maps/error_response.dart';
import 'package:buxdotph/models/http/headers.dart';
import 'package:buxdotph/models/http/methods.dart';
import 'package:equatable/equatable.dart';

class CancelEntity extends Equatable {
  final String req_id;
  final String client_id;
  final String reason;
  final Headers headers;
  final HttpMethod method;
  final Map<int, Map<String, String>> errorResponse;

  const CancelEntity(
    this.client_id,
    this.headers,
    this.method,
    this.errorResponse, {
    required this.req_id,
    required this.reason,
  });

  @override
  List<Object?> get props =>
      <Object?>[req_id, client_id, reason, headers, method, errorResponse];
}

/// Bux Cancel API is used to cancel a generated payment link
///
/// [Bux Cancel API](https://developers.bux.ph/#tag/Cancel-Transaction)
///
// ignore: lines_longer_than_80_chars
/// - [req_id] is the Reference ID from you (Unique ID, will be used for postback)
///
/// > Request ID is usually , Product ID, Order ID or Transaction ID
///
/// - [reason] create UI or Form to enter reason for cancellation
class Cancel extends CancelEntity {
  Cancel(
    String? client_id, {
    required String req_id,
    required String reason,
  })  : assert(buxEnv[BUX_CLIENT_ID] != null),
        super(
          client_id ?? buxEnv[BUX_CLIENT_ID]!,
          Headers.setDefault(),
          HttpMethod.POST, // get value HttpMethod.POST.value
          buxApiErrorResponse,
          req_id: req_id,
          reason: reason,
        );
}
