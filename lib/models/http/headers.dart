import 'package:equatable/equatable.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

class HeadersEntity extends Equatable {
  final Map<String, String> payload;

  const HeadersEntity(this.payload);

  @override
  List<Object?> get props => <Object?>[payload];
}

/// if you need to customize headers, you can use this class
class Headers extends HeadersEntity {
  const Headers(Map<String, String> payload) : super(payload);

  /// Set the Default Headers with the Bux API Key
  ///
  /// Set content type to application/json
  ///
  /// Set x-api-key to the one from the .env file
  factory Headers.setDefault({
    bool acceptJson = true,
    bool withApiKey = true,
    Map<String, String> payload = const <String, String>{},
  }) {
    if (acceptJson == true) {
      final Map<String, String> accept = <String, String>{
        'Accept': 'application/json'
      };
      payload.addAll(accept);
    }

    if (withApiKey == true) {
      final Map<String, String> apiKey = <String, String>{
        'x-api-key': dotenv.get('BUX_API_KEY', fallback: '')
      };
      payload.addAll(apiKey);
    }
    return Headers(payload);
  }
}
