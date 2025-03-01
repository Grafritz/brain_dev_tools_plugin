
import 'package:brain_dev_tools/dao/entities/properties/property.dart';

class DeviceInfoProperty {
  static final Property systemName = Property(columnName: "systemName");
  static final Property isPhysicalDevice = Property(columnName: "isPhysicalDevice");
  static final Property userName = Property(name: "userName", columnName: "userName");
  static final Property model = Property(columnName: "model");
  static final Property localizedModel = Property(columnName: "localizedModel");
  static final Property name = Property(columnName: "name");
  static final Property identifierForVendor = Property(columnName: "identifierForVendor");

  static final Property fcmOldToken = Property(columnName: "fcmOldToken");
  static final Property fcmNewToken = Property(columnName: "fcmNewToken");
  static final Property packageName = Property(columnName: "packageName");
  static final Property baseDeviceInfo = Property(columnName: "baseDeviceInfo");
  static final Property buildName = Property(columnName: "buildName");
  static final Property buildNumber = Property(columnName: "buildNumber");
}
