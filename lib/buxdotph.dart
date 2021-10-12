import 'dart:async';

import 'package:buxdotph/models/api/channels.dart';
import 'package:buxdotph/models/api/direct_payload.dart';
import 'package:buxdotph/models/http/headers.dart';
import 'package:buxdotph/services/bux_client.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

class Bux {
  static Future<dynamic> checkout(DirectPayload checkout) async {
    final BuxClient buxClient = BuxClient();
    const String api_endpoint = '/open/checkout';
    final dynamic result = await buxClient.post(dotenv.env['BUX_BASE_URL']!,
        api_endpoint, checkout.toJson().toString());
    return result;
  }

  /// this is the same as checkout except that we pass here
  /// Channel Code From Channels
  /// WE need to Implement here Dynamic URL when using redirect_url
  ///
  static Future<dynamic> direct(String channel_code, List<dynamic> params,
      String notification_url, String redirect_url) async {
    return 'TO BE IMPLEMENTED';
  }

  static Future<dynamic> fetch(String req_id) async {
    return 'TO BE IMPLEMENTED';
  }

  static List<Channels> channels() {
    return Channels.all.toList();
  }

  static String apiCall({
    String method = 'GET',
    required Uri uri,
    List<String>? query,
    Headers? headers,
    DirectPayload? body,
  }) {
    return 'ok';
  }
}
