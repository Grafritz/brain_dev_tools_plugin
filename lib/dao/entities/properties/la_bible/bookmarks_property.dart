import 'package:brain_dev_tools/dao/entities/properties/property.dart';

class BookmarksProperty {
  static final Property id = Property(ordinal:0, name: "id", columnName:"id", primaryKey:true);
  static final Property bookOsis = Property(ordinal:1,  name:"bookOsis", columnName:"bookOsis", primaryKey:false);
  static final Property verse = Property(ordinal:2,  name:"verse", columnName:"verse", primaryKey:false);
  static final Property colorMarkerId = Property(ordinal:3,  name:"colorMarkerId", columnName:"colorMarkerId", primaryKey:false);

  static final Property chapitreReal = Property(ordinal:4,  name:"chapitreReal", columnName:"chapitreReal", primaryKey:false);
  static final Property versetReal = Property(ordinal:5,  name:"versetReal", columnName:"versetReal", primaryKey:false);
}