import 'package:flutter_test/flutter_test.dart';
import 'package:brain_dev_tools/brain_dev_tools.dart';
import 'package:brain_dev_tools/brain_dev_tools_platform_interface.dart';
import 'package:brain_dev_tools/brain_dev_tools_method_channel.dart';
import 'package:plugin_platform_interface/plugin_platform_interface.dart';

class MockBrainDevToolsPlatform
    with MockPlatformInterfaceMixin
    implements BrainDevToolsPlatform {

  @override
  Future<String?> getPlatformVersion() => Future.value('42');
}

void main() {
  final BrainDevToolsPlatform initialPlatform = BrainDevToolsPlatform.instance;

  test('$MethodChannelBrainDevTools is the default instance', () {
    expect(initialPlatform, isInstanceOf<MethodChannelBrainDevTools>());
  });

  test('getPlatformVersion', () async {
    BrainDevTools brainDevToolsPlugin = BrainDevTools();
    MockBrainDevToolsPlatform fakePlatform = MockBrainDevToolsPlatform();
    BrainDevToolsPlatform.instance = fakePlatform;

    expect(await brainDevToolsPlugin.getPlatformVersion(), '42');
  });
}
