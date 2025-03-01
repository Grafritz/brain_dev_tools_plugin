import 'package:plugin_platform_interface/plugin_platform_interface.dart';

import 'brain_dev_tools_method_channel.dart';

abstract class BrainDevToolsPlatform extends PlatformInterface {
  /// Constructs a BrainDevToolsPlatform.
  BrainDevToolsPlatform() : super(token: _token);

  static final Object _token = Object();

  static BrainDevToolsPlatform _instance = MethodChannelBrainDevTools();

  /// The default instance of [BrainDevToolsPlatform] to use.
  ///
  /// Defaults to [MethodChannelBrainDevTools].
  static BrainDevToolsPlatform get instance => _instance;

  /// Platform-specific implementations should set this with their own
  /// platform-specific class that extends [BrainDevToolsPlatform] when
  /// they register themselves.
  static set instance(BrainDevToolsPlatform instance) {
    PlatformInterface.verifyToken(instance, _token);
    _instance = instance;
  }

  Future<String?> getPlatformVersion() {
    throw UnimplementedError('platformVersion() has not been implemented.');
  }
}
