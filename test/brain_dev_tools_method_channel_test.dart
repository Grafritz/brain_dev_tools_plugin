import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:brain_dev_tools/brain_dev_tools_method_channel.dart';

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  MethodChannelBrainDevTools platform = MethodChannelBrainDevTools();
  const MethodChannel channel = MethodChannel('brain_dev_tools');

  setUp(() {
    TestDefaultBinaryMessengerBinding.instance.defaultBinaryMessenger.setMockMethodCallHandler(
      channel,
      (MethodCall methodCall) async {
        return '42';
      },
    );
  });

  tearDown(() {
    TestDefaultBinaryMessengerBinding.instance.defaultBinaryMessenger.setMockMethodCallHandler(channel, null);
  });

  test('getPlatformVersion', () async {
    expect(await platform.getPlatformVersion(), '42');
  });
}
