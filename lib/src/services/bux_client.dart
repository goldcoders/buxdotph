import 'dart:async';
import 'dart:convert';
import 'dart:developer' as devlog;
import 'dart:io';

import 'package:buxdotph/src/exceptions/app_exceptions.dart';
import 'package:http/http.dart' as http;

class BuxClient {
  static const int TIMEOUT = 20;

  Future<String?> post(
    String baseUrl,
    String api,
    Map<String, String> payloadObject,
    Map<String, String> headers,
  ) async {
    final Uri uri = Uri.parse(baseUrl + api);
    String? result;
    http.Response? response;

    try {
      response = await http.post(
        uri,
        body: jsonEncode(payloadObject),
        headers: headers,
      );

      result = _processResponse(response);
    } on SocketException catch (e) {
      devlog.log(e.message, name: api);
      result = response?.body;
    } on TimeoutException catch (e) {
      devlog.log(e.message!, name: api);
      result = response?.body;
    } on UnauthorizedException catch (e) {
      devlog.log(e.message!, name: api);
      result = response?.body;
    } catch (e, stacktrace) {
      devlog.log(e.toString(), name: api);
      devlog.log(stacktrace.toString(), name: api);
    }
    return result;
  }

  String _processResponse(http.Response response) {
    switch (response.statusCode) {
      case 200:
        final String responseJson = utf8.decode(response.bodyBytes);
        return responseJson;
      case 400:
        throw BadRequestException(
          utf8.decode(response.bodyBytes),
          response.request!.url.toString(),
        );
      case 401:
        throw UnauthorizedException(
          utf8.decode(response.bodyBytes),
          response.request!.url.toString(),
        );
      case 403:
        throw ForbiddenRequestException(
          utf8.decode(response.bodyBytes),
          response.request!.url.toString(),
        );
      case 429:
        throw TooManyRequestException(
          utf8.decode(response.bodyBytes),
          response.request!.url.toString(),
        );
      case 500:
        throw ServerException(
          utf8.decode(response.bodyBytes),
          response.request!.url.toString(),
        );
      default:
        throw DefaultException(
          'Error Occured with code: ${response.statusCode}',
          response.request!.url.toString(),
        );
    }
  }
}
