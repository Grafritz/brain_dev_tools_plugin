import 'package:brain_dev_tools/dao/entities/properties/property.dart';

class ColorMarkersProperty {
  static final Property id = Property(ordinal:0, name: "id", columnName:"id", primaryKey:true);
  static final Property colorName = Property(ordinal:1,  name:"colorName", columnName:"colorName", primaryKey:false);
  static final Property colorHexStr = Property(ordinal:2,  name:"colorHexStr", columnName:"colorHexStr", primaryKey:false);
  static final Property colorHex = Property(ordinal:2,  name:"colorHex", columnName:"colorHex", primaryKey:false);
  static final Property isColorSystem = Property(ordinal:3,  name:"isColorSystem", columnName:"isColorSystem", primaryKey:false);
 }