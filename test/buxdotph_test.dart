import 'package:buxdotph/buxdotph.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  setUp(() {
    //
  });

  tearDown(() {
    //
  });

  test('Test Bux Checkout Api', () async {
    expect(await Bux.checkout, 'OK');
  });
}
