import 'package:brain_dev_tools/dao/entities/properties/property.dart';

class QuizReponsesProperty {
  static final Property id = Property( name: "id", columnName:"id", primaryKey:true);
  static final Property idUser = Property( name: "idUser", columnName:"idUser");
  static final Property formCode = Property( name: "formCode", columnName:"formCode");
  static final Property questionCode = Property( name:"questionCode", columnName:"questionCode", primaryKey:false);
  static final Property codeReponse = Property( name:"codeReponse", columnName:"codeReponse", primaryKey:false);
  static final Property libelleReponse = Property( name:"libelleReponse", columnName:"libelleReponse", primaryKey:false);
  static final Property scoreTotal = Property( name:"scoreTotal", columnName:"scoreTotal", primaryKey:false);
  static final Property estEnfant = Property( name:"estEnfant", columnName:"estEnfant", primaryKey:false);
  static final Property avoirEnfant = Property( name:"avoirEnfant", columnName:"avoirEnfant", primaryKey:false);
  static final Property codeParent = Property( name:"codeParent", columnName:"codeParent", primaryKey:false);
  static final Property dateCreated = Property( name:"dateCreated", columnName:"dateCreated", primaryKey:false);
  static final Property isCorrect = Property( name:"isCorrect", columnName:"isCorrect", primaryKey:false);
}