import 'package:brain_dev_tools/dao/entities/properties/property.dart';

class QuizFormQuestionsProperty {
  static final Property idUser = Property( name: "idUser", columnName:"idUser");
  static final Property formCode = Property( name: "formCode", columnName:"formCode");
  static final Property questionCode = Property( name:"questionCode", columnName:"questionCode");
  static final Property ordreQuestion = Property( name:"ordreQuestion", columnName:"ordreQuestion");
  static final Property estDebutQuestion = Property( name:"estDebutQuestion", columnName:"estDebutQuestion");
}