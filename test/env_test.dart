import 'dart:io';

import 'package:dotenv/dotenv.dart' show load, env;
import 'package:test/test.dart';

extension BoolParsing on String {
  bool parseBool() {
    if (toLowerCase() == 'true') {
      return true;
    } else if (toLowerCase() == 'false') {
      return false;
    }

    throw Exception('Could not parse bool from $this');
  }
}

void main() {
  setUpAll(() async {
    load('.env.example');
  });

  group('Load test ENV', () {
    setUp(() {
      print(Directory.current.toString());
    });
    test('able to load .env', () {
      final String sandbox = env['BUX_SANDBOX']!;
      final bool isSandBox = sandbox.parseBool();
      expect(isSandBox, true);
      expect(env['BUX_API_KEY'], 'api_key');
      expect(env['BUX_CLIENT_ID'], '0000000001');
      expect(env['BUX_API_SECRET'], 'secret');
    });
  });
}
