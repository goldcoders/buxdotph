import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:buxdotph/services/app_exceptions.dart';
import 'package:http/http.dart' as http;

class BuxClient {
  static const int TIMEOUT = 20;

  Future<dynamic> post(String baseUrl, String api, String payloadObject) async {
    final Uri uri = Uri.parse(baseUrl + api);
    final dynamic payload = json.decode(payloadObject);
    try {
      final http.Response response = await http
          .post(uri, body: payload)
          .timeout(const Duration(seconds: TIMEOUT));
      return _processResponse(response);
    } on SocketException {
      throw DefaultException('No Internet Connection', uri.toString());
    } on TimeoutException {
      throw RequestTookLongException(
          'Server Took Too Long to Respond', uri.toString());
    }
  }

  Future<dynamic> get(String baseUrl, String api) async {
    final Uri uri = Uri.parse(baseUrl + api);
    try {
      final http.Response response =
          await http.get(uri).timeout(const Duration(seconds: TIMEOUT));
      return _processResponse(response);
    } on SocketException {
      throw DefaultException('No Internet Connection', uri.toString());
    } on TimeoutException {
      throw RequestTookLongException(
          'Server Took Too Long to Respond', uri.toString());
    }
  }

  dynamic _processResponse(http.Response response) {
    switch (response.statusCode) {
      case 200:
        final String responseJson = utf8.decode(response.bodyBytes);
        return responseJson;
      case 400:
        throw BadRequestException(
            utf8.decode(response.bodyBytes), response.request!.url.toString());
      case 401:
        throw UnauthorizedException(
            utf8.decode(response.bodyBytes), response.request!.url.toString());
      case 403:
        throw ForbiddenRequestException(
            utf8.decode(response.bodyBytes), response.request!.url.toString());
      case 429:
        throw TooManyRequestException(
            utf8.decode(response.bodyBytes), response.request!.url.toString());
      case 500:
        throw ServerException(
            utf8.decode(response.bodyBytes), response.request!.url.toString());
      default:
        throw DefaultException(
            'Error Occured with code: ${response.statusCode}',
            response.request!.url.toString());
    }
  }
}
