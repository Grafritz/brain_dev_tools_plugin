import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';

import 'brain_dev_tools_platform_interface.dart';

/// An implementation of [BrainDevToolsPlatform] that uses method channels.
class MethodChannelBrainDevTools extends BrainDevToolsPlatform {
  /// The method channel used to interact with the native platform.
  @visibleForTesting
  final methodChannel = const MethodChannel('brain_dev_tools');

  @override
  Future<String?> getPlatformVersion() async {
    final version = await methodChannel.invokeMethod<String>('getPlatformVersion');
    return version;
  }
}
