
import 'package:brain_dev_tools/dao/entities/properties/property.dart';

class SettingsProperty {
  static final Property id = Property(name: "id", columnName: "id");
  static final Property fcmKey = Property(name: "fcmKey", columnName: "fcmKey");
  static final Property privacyPolicy =
      Property(name: "privacyPolicy", columnName: "privacyPolicy");
  static final Property termsAndConditions =
      Property(name: "termsAndConditions", columnName: "termsAndConditions");
  static final Property isAutoApprove =
      Property(name: "isAutoApprove", columnName: "isAutoApprove");
}
