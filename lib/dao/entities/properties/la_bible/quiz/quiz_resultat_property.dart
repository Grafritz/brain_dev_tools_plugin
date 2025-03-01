import 'package:brain_dev_tools/dao/entities/properties/property.dart';

class QuizResultatProperty {
  static final Property idUser = Property( name: "idUser", columnName:"idUser");
  static final Property formCode = Property( name:"formCode", columnName:"formCode");
  static final Property scoreResult = Property( name:"scoreResult", columnName:"scoreResult");
  static final Property scoreTotalForm = Property( name:"scoreTotalForm", columnName:"scoreTotalForm");
  static final Property mention = Property( name:"mention", columnName:"mention");
  static final Property isSyncOnline = Property( name:"isSyncOnline", columnName:"isSyncOnline");
  static final Property isPass = Property( name:"isPass", columnName:"isPass");

  static final Property photoPath = Property( name:"photoPath", columnName:"photoPath");
  static final Property userName = Property( name:"userName", columnName:"userName");
  static final Property nomComplet = Property( name:"nomComplet", columnName:"nomComplet");
  static final Property idFirebaseToken = Property( name:"idFirebaseToken", columnName:"idFirebaseToken");
}