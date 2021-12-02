import 'package:buxdotph/buxdotph.dart';
import 'package:flutter/material.dart';

import 'env/env.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final String clientId = Env.buxClientId;
  final String lbc = Channels.lbc_dragonpay.toString();
  final Bux bux = const Bux(
    apiKey: Env.buxApiKey,
    apiSecret: Env.buxApiSecret,
    clientId: Env.buxClientId,
    sandbox: Env.buxSandbox,
  );

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
                final CheckoutPayload payload = CheckoutPayload(
                  amount: 1000,
                  req_id: 'bux001',
                  client_id: clientId,
                  description: 'test',
                  notification_url: 'https://goldcoders.dev/notify',
                );
                final String? response = await bux.checkout(payload);
                print(response);
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
