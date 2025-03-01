import 'package:brain_dev_tools/dao/entities/properties/property.dart';

class StatisticQRProperty {
  static final Property idUser = Property( name: "idUser", columnName:"idUser");
  static final Property nbrQuestion = Property( name:"nbrQuestion", columnName:"nbrQuestion");
  static final Property nbrReponseCorrect = Property( name:"nbrReponseCorrect", columnName:"nbrReponseCorrect");
  static final Property nbrReponseInCorrect = Property( name:"nbrReponseInCorrect", columnName:"nbrReponseInCorrect");
  static final Property nbrAbstention = Property( name:"nbrAbstention", columnName:"nbrAbstention");
  static final Property isBackUpToServer = Property( name:"isBackUpToServer", columnName:"isBackUpToServer");
  static final Property dateLastBackUpToServer = Property( name:"dateLastBackUpToServer", columnName:"dateLastBackUpToServer");
}