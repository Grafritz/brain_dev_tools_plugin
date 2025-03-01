import 'package:brain_dev_tools/dao/entities/properties/property.dart';

class DeviceAppVersionProperty {
  static final Property packageName = Property(columnName: "packageName");
  static final Property appName = Property(columnName: "appName");
  static final Property applicationId = Property(columnName: "applicationId");
  static final Property versionName = Property(columnName: "versionName");
  static final Property versionCode = Property(columnName: "versionCode");
  static final Property buildNumber = Property(columnName: "buildNumber");
  static final Property isRequired = Property(columnName: "isRequired");

  static final Property versionInfo = Property(columnName: "versionInfo");
  static final Property linkAndroid = Property(columnName: "linkAndroid");
  static final Property linkApple = Property(columnName: "linkApple");
  static final Property linkWebSite = Property(columnName: "linkWebSite");
  static final Property dateCreated = Property(columnName: "dateCreated");
}
