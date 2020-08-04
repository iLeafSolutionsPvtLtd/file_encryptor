import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class Fileencryptor {
  static const MethodChannel _channel =
      const MethodChannel('fileencryptor');

  static Future<String> encrypt({
    @required String inputPath,
    @required String outputPath,
  }) =>
      _channel.invokeMethod<String>(
        'encrypt',
        <String, String>{
          'inFileName': inputPath,
          'outFileName': outputPath,
        },
      );

  static Future<void> decrypt({
    @required String key,
    @required String encryptedFileName,
    @required String outputPath,
  }) =>
      _channel.invokeMethod<void>(
        'decrypt',
        <String, String>{
          'key': key,
          'inFileName': encryptedFileName,
          'outFileName': outputPath,
        },
      );

  static Future<String> get platformVersion async {
    final String version = await _channel.invokeMethod('getPlatformVersion');
    return version;
  }
}
