import 'package:brain_dev_tools/dao/entities/properties/property.dart';

class QuizFormProperty {
  static final Property idLocal = Property( name: "idLocal", columnName:"idLocal");
  static final Property idOnline = Property( name:"id", columnName:"id");
  static final Property idUser = Property( name:"idUser", columnName:"idUser");
  static final Property codeForm = Property( name:"codeForm", columnName:"codeForm");
  static final Property formName = Property( name:"formName", columnName:"formName");
  static final Property resumeForm = Property( name:"resumeForm", columnName:"resumeForm");
  static final Property dureeEnSeconde = Property( name:"dureeEnSeconde", columnName:"dureeEnSeconde");
  static final Property minuteurActiveYN = Property( name:"minuteurActiveYN", columnName:"minuteurActiveYN");
  static final Property activePonderationYN = Property( name:"activePonderationYN", columnName:"activePonderationYN");
  static final Property activeYN = Property( name:"activeYN", columnName:"activeYN");
  static final Property isSyncOnline = Property( name:"isSyncOnline", columnName:"isSyncOnline");
  static final Property isCanSeeAnswerAfter = Property( name:"isCanSeeAnswerAfter", columnName:"isCanSeeAnswerAfter");
  static final Property dateCreated = Property( name:"dateCreated", columnName:"dateCreated");

  static final Property nbrQuestion = Property( name:"nbrQuestion", columnName:"nbrQuestion");
  static final Property scoreFinalForm = Property( name:"scoreFinalForm", columnName:"scoreFinalForm");

  static final Property nbrParticipant = Property( name:"nbrParticipant", columnName:"nbrParticipant");
}