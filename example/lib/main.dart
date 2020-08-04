import 'dart:io';

import 'package:flutter/material.dart';
import 'dart:async';

import 'package:flutter/services.dart';
import 'package:fileencryptor/fileencryptor.dart';
import 'package:path_provider/path_provider.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  String _platformVersion = 'Unknown';

  @override
  void initState() {
    super.initState();
    initPlatformState();
  }

  // Platform messages are asynchronous, so we initialize in an async method.
  Future<void> initPlatformState() async {
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Plugin example app'),
        ),
        body: EncryptApp(),
      ),
    );
  }
}
String key;

class EncryptApp extends StatelessWidget {
  String path;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            RaisedButton.icon(
              onPressed: () async {
                String p = await _write("My name is Yadhu");
                final Directory directory = await getApplicationDocumentsDirectory();
                key = await Fileencryptor.encrypt(
                    inputPath: '${directory.path}/my_file.txt',
                    outputPath: '${directory.path}/enc.txt'
                );
                print('Encryption Ended$path');
              },
              icon: Icon(Icons.keyboard),
              color: Colors.amber,
              label: Text('Encrypt', style: TextStyle(color: Colors.black),),
            ),
            RaisedButton.icon(
              onPressed: () async {
                final Directory directory = await getApplicationDocumentsDirectory();
                String p = '${directory.path}/enc.txt';
                String o = '${directory.path}/n.txt';
                await Fileencryptor.decrypt(
                  key: key,
                  encryptedFileName: '$p',
                  outputPath: '$o',
                );
                _read();
              },
              icon: Icon(Icons.keyboard_hide),
              color: Colors.amber,
              label: Text('Decrypt', style: TextStyle(color: Colors.black),),
            ),
          ],
        ),
      ),
    );
  }

  Future<String>_write(String text) async {
    final Directory directory = await getApplicationDocumentsDirectory();
    final File file = File('${directory.path}/my_file.txt');
    await file.writeAsString(text);
    return file.path;
  }

  Future<String> _read() async {
    String text;
    try {
      final Directory directory = await getApplicationDocumentsDirectory();
      String o = '${directory.path}/n.txt';
      final File file = File(o);
      text = await file.readAsString();
      print(text);
    } catch (e) {
      print("Couldn't read file");
    }
    return text;
  }
}