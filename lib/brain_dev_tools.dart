
import 'brain_dev_tools_platform_interface.dart';

class BrainDevTools {
  Future<String?> getPlatformVersion() {
    return BrainDevToolsPlatform.instance.getPlatformVersion();
  }
}
