import 'package:brain_dev_tools/dao/entities/properties/property.dart';

class PdlSubscriptionPlanProperty {
  static final Property id = Property( name: "id", columnName:"id");
  static final Property codeSubscription = Property( columnName:"codeSubscription");
  static final Property idUser = Property( name: "idUser", columnName:"idUser");
  static final Property createdByUser = Property( name: "createdByUser", columnName:"createdByUser");
  static final Property codeLecture = Property( name: "codeLecture", columnName:"codeLecture");
  static final Property codeCategorie = Property( name: "codeCategorie", columnName:"codeCategorie");
  static final Property isImageNetworkBg = Property( name: "isImageNetworkBg", columnName:"isImageNetworkBg");
  static final Property imageBg = Property( name: "imageBg", columnName:"imageBg");
  static final Property icon = Property( name: "icon", columnName:"icon");
  static final Property titre = Property( name: "titre", columnName:"titre");
  static final Property description = Property( name: "description", columnName:"description");
  static final Property nbrJours = Property( name: "nbrJours", columnName:"nbrJours");
  static final Property dateDebut = Property( name: "dateDebut", columnName:"dateDebut");
  static final Property dateFin = Property( name: "dateFin", columnName:"dateFin");
  static final Property nbrChapitre = Property( name: "nbrChapitre", columnName:"nbrChapitre");
  static final Property typePlan = Property( name: "typePlan", columnName:"typePlan");
  static final Property bookBegin = Property( name: "bookBegin", columnName:"bookBegin");
  static final Property chaptersBegin = Property( name: "chaptersBegin", columnName:"chaptersBegin");
  static final Property versetBegin = Property( name: "versetBegin", columnName:"versetBegin");
  static final Property bookEnd = Property( name: "bookEnd", columnName:"bookEnd");
  static final Property chaptersEnd = Property( name: "chaptersEnd", columnName:"chaptersEnd");
  static final Property versetEnd = Property( name: "versetEnd", columnName:"versetEnd");
  static final Property isPublic = Property( name: "isPublic", columnName:"isPublic");
  static final Property isSyncOnline = Property( name: "isSyncOnline", columnName:"isSyncOnline");
  static final Property isNotificationActive = Property( name: "isNotificationActive", columnName:"isNotificationActive");
  static final Property timeNotificationActive = Property( name: "timeNotificationActive", columnName:"timeNotificationActive");
  static final Property notificationId = Property( columnName:"notificationId");

  static final Property pdlSubscriptionChaptersReads = Property( columnName:"pdlSubscriptionChaptersReads");
  static final Property user = Property( columnName:"user");
  static final Property pdlPlanDeLecture = Property( columnName:"pdlPlanDeLecture");
  static final Property pdlBooks = Property( columnName:"pdlBooks");
  static final Property percentPlanRead = Property( columnName:"percentPlanRead");
  static final Property nbrChaptersRead = Property( columnName:"nbrChaptersRead");

  static final Property isCompleted = Property( columnName:"isCompleted");
  static final Property dateDebutStr = Property( columnName:"dateDebutStr");
  static final Property dateFinStr = Property( columnName:"dateFinStr");
}