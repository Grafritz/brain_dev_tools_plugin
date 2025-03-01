import 'package:brain_dev_tools/dao/entities/properties/property.dart';

class QuizResultatDetailsProperty {
  static final Property idUser = Property( name:"idUser", columnName:"idUser", primaryKey:false);
  static final Property formCode = Property( name:"formCode", columnName:"formCode", primaryKey:false);
  static final Property questionCode = Property( name:"questionCode", columnName:"questionCode", primaryKey:false);
  static final Property reponseCode = Property( name:"reponseCode", columnName:"reponseCode", primaryKey:false);
  static final Property reponseEntree = Property( name:"reponseEntree", columnName:"reponseEntree", primaryKey:false);
  static final Property score = Property( name:"score", columnName:"score", primaryKey:false);
  static final Property isSyncOnline = Property( name:"isSyncOnline", columnName:"isSyncOnline", primaryKey:false);
}