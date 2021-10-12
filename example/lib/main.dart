import 'package:buxdotph/services/bux_client.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
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
                final response = await BuxClient()
                    .get('https://jsonplaceholder.typicode.com', '/todos/1');
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
