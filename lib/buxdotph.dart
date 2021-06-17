import 'dart:async';

import 'package:flutter/services.dart';

class Buxdotph {
  static const MethodChannel _channel = const MethodChannel('buxdotph');

  static Future<String?> get platformVersion async {
    final String? version = await _channel.invokeMethod('getPlatformVersion');
    return version;
  }
}
