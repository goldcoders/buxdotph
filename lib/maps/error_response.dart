Map<int, Map<String, String>> buxApiErrorResponse = <int, Map<String, String>>{
  400: <String, String>{
    'status': 'MISSING_INPUT',
  },
  401: <String, String>{
    'status': 'INVALID_CREDENTIALS',
  },
  500: <String, String>{
    'status': 'API_UNAVAILABLE',
  },
};
