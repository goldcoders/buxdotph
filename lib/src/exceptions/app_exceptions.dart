class AppException implements Exception {
  final String? message;
  final String? url;
  final String? prefix;

  AppException(this.message, this.url, [this.prefix]);
}

class BadRequestException extends AppException {
  BadRequestException(String? message, String url)
      : super((message != null) ? message : 'Bad Request', url);
}

class DefaultException extends AppException {
  DefaultException(String? message, String url)
      : super((message != null) ? message : 'Unable to Process Request', url);
}

class RequestTookLongException extends AppException {
  RequestTookLongException(String? message, String url)
      : super((message != null) ? message : 'Server Not Responding', url);
}

class UnauthorizedException extends AppException {
  UnauthorizedException(String? message, String url)
      : super((message != null) ? message : 'Unauthorized Request', url);
}

class ForbiddenRequestException extends AppException {
  ForbiddenRequestException(String? message, String url)
      : super((message != null) ? message : 'Forbidden Request', url);
}

class TooManyRequestException extends AppException {
  TooManyRequestException(String? message, String url)
      : super((message != null) ? message : 'You Exceed Request Limit', url);
}

class ServerException extends AppException {
  ServerException(String? message, String url)
      : super((message != null) ? message : 'Server Error', url);
}
