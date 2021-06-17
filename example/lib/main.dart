import 'package:buxdotph/services/base_client.dart';
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
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Plugin example app'),
        ),
        body: Center(
          child: ElevatedButton(
              child: Text('test'),
              onPressed: () async {
                var response = await BaseClient()
                    .get('https://jsonplaceholder.typicode.com', '/todos/1');
                print(response);
              }),
        ),
      ),
    );
  }
}
