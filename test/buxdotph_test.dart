import 'dart:io';

import 'package:buxdotph/models/api/channels.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  setUp(() {
    print(Directory.current.toString());
    dotenv.testLoad(fileInput: File('.env').readAsStringSync());
  });

  tearDown(() {
    //
  });

  test('able to load .env', () {
    expect(dotenv.env['BUX_BASE_URL'], 'https://api.bux.ph/v1/api/sandbox');
    expect(dotenv.env['BUX_API_KEY'], 'e0a7f06f2f606a54398316d0b91f1766');
    expect(dotenv.env['BUX_CLIENT_ID'], '0000018189');
    expect(dotenv.env['BUX_API_SECRET'], 'd47f3e582e59');
  });
  test('Fetch All Channels', () async {
    expect(Channels.otc_list.length, 30);
    expect(Channels.bank_list.length, 3);
    expect(Channels.ewallet_list.length, 2);
    expect(Channels.card_list.length, 1);
    expect(Channels.buy_now_pay_later_list.length, 1);
    expect(Channels.list_all.length, 37);
  });
}
