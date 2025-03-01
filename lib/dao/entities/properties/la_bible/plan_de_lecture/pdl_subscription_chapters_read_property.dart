import 'package:brain_dev_tools/dao/entities/properties/property.dart';

class PdlSubscriptionChaptersReadProperty {
  static final Property id = Property( name: "id", columnName:"id");
  static final Property codeLecture = Property( name: "codeLecture", columnName:"codeLecture");
  static final Property dateRead = Property( name: "dateRead", columnName:"dateRead");
  static final Property bookOsis = Property( name:"bookOsis", columnName:"bookOsis");
  static final Property chapitre = Property( name:"chapitre", columnName:"chapitre");

  // Not In DB
  static final Property idServer = Property( columnName:"idServer");
  static final Property codeSubscription = Property( name: "codeSubscription", columnName:"codeSubscription");
  static final Property idUser = Property( name: "idUser", columnName:"idUser");
}