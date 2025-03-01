import 'package:brain_dev_tools/dao/entities/properties/property.dart';

class VersesProperty {
  static final Property id = Property(ordinal:0, name: "id", columnName:"id", primaryKey:true);
  static final Property book = Property(ordinal:1,  name:"book", columnName:"book", primaryKey:false);
  static final Property verse = Property(ordinal:2,  name:"verse", columnName:"verse", primaryKey:false);
  static final Property unformatted = Property(ordinal:3,  name:"unformatted", columnName:"unformatted", primaryKey:false);
  static final Property unformattedSearch = Property(ordinal:4,  name:"unformattedSearch", columnName:"unformattedSearch", primaryKey:false);
  // For API
  static final Property chapitreReal = Property(ordinal:4,  name:"chapitreReal", columnName:"chapitreReal", primaryKey:false);
  static final Property versetReal = Property(ordinal:4,  name:"versetReal", columnName:"versetReal", primaryKey:false);

  static final Property books = Property( columnName:"books");
  static final Property bookData = Property( columnName:"bookData");
}