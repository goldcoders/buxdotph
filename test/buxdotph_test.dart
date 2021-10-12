import 'dart:io';

import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  setUp(() {
    print(Directory.current.toString());
    dotenv.testLoad(fileInput: File('test/.env').readAsStringSync());
  });

  tearDown(() {
    //
  });

  test('able to load .env', () {
    expect(dotenv.env['BUX_BASE_URL'], 'https://api.bux.ph/v1/api/sandbox');
    expect(dotenv.env['BUX_API_KEY'], 'e0a7f06f2f606a54398316d0b91f1766');
  });
}
