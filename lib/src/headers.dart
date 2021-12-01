import 'package:dotenv/dotenv.dart' show env;

/// if you need to customize headers, you can use this class
class Headers {
  final Map<String, String> payload;

  Headers(this.payload);

  /// Set the Default Headers with the Bux API Key
  ///
  /// Set content type to application/json
  ///
  /// Set x-api-key to the one from the .env file
  static Map<String, String> setDefault({
    bool acceptJson = true,
    bool withApiKey = true,
    Map<String, String>? payload,
  }) {
    payload ??= <String, String>{};
    if (acceptJson == true) {
      final Map<String, String> accept = <String, String>{
        'Accept': 'application/json'
      };
      payload.addAll(accept);
    }

    if (withApiKey == true) {
      final Map<String, String> apiKey = <String, String>{
        'x-api-key': env['BUX_API_KEY'] ?? ''
      };
      payload.addAll(apiKey);
    }
    return payload;
  }
}
