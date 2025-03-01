import 'package:brain_dev_tools/dao/entities/properties/property.dart';

class ChaptersReadProperty {
  static final Property id = Property(ordinal:0, name: "id", columnName:"id", primaryKey:true);
  static final Property bookOsis = Property(ordinal:1,  name:"bookOsis", columnName:"bookOsis", primaryKey:false);
  static final Property chapitre = Property(ordinal:2,  name:"chapitre", columnName:"chapitre", primaryKey:false);
  static final Property groupeId = Property(ordinal:2,  name:"groupeId", columnName:"groupeId", primaryKey:false);

  static final Property idUser = Property( columnName:"idUser");
  static final Property chaptersReads = Property( columnName:"chaptersReads");
}