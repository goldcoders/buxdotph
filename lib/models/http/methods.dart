class HttpMethod {
  final String? value;
  const HttpMethod._(this.value);

  static const HttpMethod DELETE = HttpMethod._('DELETE');
  static const HttpMethod PUT = HttpMethod._('PUT');
  static const HttpMethod POST = HttpMethod._('POST');
  static const HttpMethod PATCH = HttpMethod._('PATCH');
  static const HttpMethod GET = HttpMethod._('GET');
  static const HttpMethod EMPTY = HttpMethod._(null);

  static const List<HttpMethod> values = <HttpMethod>[
    DELETE,
    PUT,
    POST,
    PATCH,
    GET,
  ];

  static HttpMethod parse(String value) {
    switch (value) {
      case 'DELETE':
        return HttpMethod.DELETE;
      case 'PUT':
        return HttpMethod.PUT;
      case 'POST':
        return HttpMethod.POST;
      case 'PATCH':
        return HttpMethod.PATCH;
      case 'GET':
        return HttpMethod.GET;
      default:
        return HttpMethod.EMPTY;
    }
  }

  @override
  String toString() {
    return 'HttpMethod.$value';
  }
}
