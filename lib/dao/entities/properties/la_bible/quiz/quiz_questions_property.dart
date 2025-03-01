import 'package:brain_dev_tools/dao/entities/properties/property.dart';

class QuizQuestionsProperty {
  static final Property id = Property( name: "id", columnName:"id", primaryKey:true);
  static final Property idUser = Property( name:"idUser", columnName:"idUser", primaryKey:false);
  static final Property formCode = Property( name:"formCode", columnName:"formCode", primaryKey:false);
  static final Property codeQuestion = Property( name:"codeQuestion", columnName:"codeQuestion", primaryKey:false);
  static final Property libelleQuestion = Property( name:"libelleQuestion", columnName:"libelleQuestion", primaryKey:false);
  static final Property detailsQuestion = Property( name:"detailsQuestion", columnName:"detailsQuestion", primaryKey:false);
  static final Property explicationReponse = Property( name:"explicationReponse", columnName:"explicationReponse", primaryKey:false);
  static final Property referenceExplication = Property( name:"referenceExplication", columnName:"referenceExplication", primaryKey:false);
  static final Property typeQuestion = Property( name:"typeQuestion", columnName:"typeQuestion", primaryKey:false);
  static final Property scoreTotal = Property( name:"scoreTotal", columnName:"scoreTotal", primaryKey:false);
  static final Property caractereAccepte = Property( name:"caractereAccepte", columnName:"caractereAccepte", primaryKey:false);
  static final Property nbreValeurMinimal = Property( name:"nbreValeurMinimal", columnName:"nbreValeurMinimal", primaryKey:false);
  static final Property nbreCaractereMaximal = Property( name:"nbreCaractereMaximal", columnName:"nbreCaractereMaximal", primaryKey:false);
  static final Property dateCreated = Property( name:"dateCreated", columnName:"dateCreated", primaryKey:false);
  static final Property activeYN = Property( name:"activeYN", columnName:"activeYN", primaryKey:false);

  static final Property nbrOfQuestions = Property( name:"nbrOfQuestions", columnName:"nbrOfQuestions");
  static final Property difficulty = Property( name:"difficulty", columnName:"difficulty");
}