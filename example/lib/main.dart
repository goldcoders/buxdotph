import 'package:buxdotph/buxdotph.dart';
import 'package:buxdotph/models/api/checkout_payload.dart';
import 'package:flutter/material.dart';

import 'package:flutter_dotenv/flutter_dotenv.dart';

Future<void> main() async {
  await dotenv.load();
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

Future<String?> checkout() async {
  final CheckoutPayload payload = CheckoutPayload(
    amount: 1000,
    req_id: 'uuid_from_backend',
    client_id: dotenv.env['BUX_CLIENT_ID']!,
    description: 'subscription',
    notification_url: 'https://google.com',
    expiry: 2,
    email: 'dummy@gmail.com',
    contact: '09155555555',
    name: 'John Dela Cruz',
    redirect_url: 'https://goldcoders.dev',
    param1: 'username',
    param2: 'address',
  );
  return Bux.checkout(payload);
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Plugin example app'),
        ),
        body: Center(
          child: ElevatedButton(
              onPressed: () async {
                final String? response = await checkout();
                print('response $response');
              },
              child: const Text('test')),
        ),
      ),
    );
  }

  @override
  void initState() {
    super.initState();
  }
}
