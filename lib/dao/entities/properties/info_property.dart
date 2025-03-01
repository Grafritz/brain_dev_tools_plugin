
import 'package:brain_dev_tools/dao/entities/properties/property.dart';

class InfoProperty {
  static final Property apiVersion = Property(columnName: "apiVersion");
  static final Property roleCode = Property(columnName: "roleCode");
  static final Property permissions = Property(columnName: "permissions");
  static final Property jwtToken = Property(columnName: "jwtToken");
}
