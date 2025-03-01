import 'package:brain_dev_tools/dao/entities/properties/property.dart';

class NotesProperty {
  static final Property id = Property(ordinal:0, name: "id", columnName:"id", primaryKey:true);
  static final Property bookOsis = Property(ordinal:1,  name:"bookOsis", columnName:"bookOsis", primaryKey:false);
  static final Property verse = Property(ordinal:2,  name:"verse", columnName:"verse", primaryKey:false);
  static final Property noteUnformated = Property(ordinal:3,  name:"noteUnformated", columnName:"noteUnformated", primaryKey:false);
  static final Property colorMarkerId = Property(ordinal:4,  name:"colorMarkerId", columnName:"colorMarkerId", primaryKey:false);

  static final Property chapitreSelected = Property(ordinal:5,  name:"chapitreSelected", columnName:"chapitreSelected", primaryKey:false);
  static final Property versetBeginSelected = Property(ordinal:6,  name:"versetBeginSelected", columnName:"versetBeginSelected", primaryKey:false);
  static final Property versetEndSelected = Property(ordinal:7,  name:"versetEndSelected", columnName:"verset2Selected", primaryKey:false);
}