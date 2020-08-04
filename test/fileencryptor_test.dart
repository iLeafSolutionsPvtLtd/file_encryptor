import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:fileencryptor/fileencryptor.dart';

void main() {
  const MethodChannel channel = MethodChannel('fileencryptor');

  TestWidgetsFlutterBinding.ensureInitialized();

  setUp(() {
    channel.setMockMethodCallHandler((MethodCall methodCall) async {
      return '42';
    });
  });

  tearDown(() {
    channel.setMockMethodCallHandler(null);
  });

  test('getPlatformVersion', () async {
    expect(await Fileencryptor.platformVersion, '42');
  });
}
