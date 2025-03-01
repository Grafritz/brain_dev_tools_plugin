import 'package:brain_dev_tools/dao/entities/properties/property.dart';

class ReponsesProperty {
  static final Property id = Property( name: "id", columnName:"id", primaryKey:true);
  static final Property questionId = Property( name:"questionId", columnName:"questionId", primaryKey:false);
  static final Property frLibelleReponse = Property( name:"fr_LibelleReponse", columnName:"fr_LibelleReponse", primaryKey:false);
  static final Property htLibelleReponse = Property( name:"ht_LibelleReponse", columnName:"ht_LibelleReponse", primaryKey:false);
  static final Property enLibelleReponse = Property( name:"en_LibelleReponse", columnName:"en_LibelleReponse", primaryKey:false);
  static final Property esLibelleReponse = Property( name:"es_LibelleReponse", columnName:"es_LibelleReponse", primaryKey:false);
  static final Property isCorrect = Property( name:"isCorrect", columnName:"isCorrect", primaryKey:false);
}