import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:buxdotph/services/app_exceptions.dart';
import 'package:http/http.dart' as http;

class BaseClient {
  static const int TIMEOUT = 20;

  Future<dynamic> post(
      String baseUrl, String api, dynamic payloadObject) async {
    Uri uri = Uri.parse(baseUrl + api);
    dynamic payload = json.decode(payloadObject);
    try {
      var response = await http
          .post(uri, body: payload)
          .timeout(Duration(seconds: TIMEOUT));
      return _processResponse(response);
    } on SocketException {
      throw DefaultException('No Internet Connection', uri.toString());
    } on TimeoutException {
      throw RequestTookLongException(
          'Server Took Too Long to Respond', uri.toString());
    }
  }

  Future<dynamic> get(String baseUrl, String api) async {
    Uri uri = Uri.parse(baseUrl + api);
    try {
      var response = await http.get(uri).timeout(Duration(seconds: TIMEOUT));
      return _processResponse(response);
    } on SocketException {
      throw DefaultException('No Internet Connection', uri.toString());
    } on TimeoutException {
      throw RequestTookLongException(
          'Server Took Too Long to Respond', uri.toString());
    }
  }

  dynamic _processResponse(dynamic response) {
    switch (response.statusCode) {
      case 200:
        var responseJson = utf8.decode(response.bodyBytes);
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
