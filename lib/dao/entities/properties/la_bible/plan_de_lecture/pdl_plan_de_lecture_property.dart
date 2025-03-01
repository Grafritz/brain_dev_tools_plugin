import 'package:brain_dev_tools/dao/entities/properties/property.dart';

class PdlPlanDeLectureProperty {
  static final Property id = Property( name: "id", columnName:"id");
  static final Property idUser = Property( name: "idUser", columnName:"idUser");
  static final Property createdByUser = Property( name: "createdByUser", columnName:"createdByUser");
  static final Property codeLecture = Property( name: "codeLecture", columnName:"codeLecture");
  static final Property codeCategorie = Property( name: "codeCategorie", columnName:"codeCategorie");
  static final Property isImageNetworkBg = Property( name: "isImageNetworkBg", columnName:"isImageNetworkBg");
  static final Property imageBg = Property( name: "imageBg", columnName:"imageBg");
  static final Property icon = Property( name: "icon", columnName:"icon");
  static final Property titreFr = Property( name: "titre_fr", columnName:"titre_fr");
  static final Property titreEn = Property( name: "titre_en", columnName:"titre_en");
  static final Property titreHt = Property( name: "titre_ht", columnName:"titre_ht");
  static final Property titreEs = Property( name: "titre_es", columnName:"titre_es");
  static final Property descriptionFr = Property( name: "description_fr", columnName:"description_fr");
  static final Property descriptionEn = Property( name: "description_en", columnName:"description_en");
  static final Property descriptionHt = Property( name: "description_ht", columnName:"description_ht");
  static final Property descriptionEs = Property( name: "description_es", columnName:"description_es");
  static final Property nbrJours = Property( name: "nbrJours", columnName:"nbrJours");
  static final Property nbrChapitre = Property( name: "nbrChapitre", columnName:"nbrChapitre");
  static final Property isDateRequired = Property( name: "isDateRequired", columnName:"isDateRequired");

  static final Property dateDebut = Property( name: "dateDebut", columnName:"dateDebut");
  static final Property dateFin = Property( name: "dateFin", columnName:"dateFin");

  static final Property typePlan = Property( name: "typePlan", columnName:"typePlan");
  static final Property bookBegin = Property( name: "bookBegin", columnName:"bookBegin");
  static final Property chaptersBegin = Property( name: "chaptersBegin", columnName:"chaptersBegin");
  static final Property versetBegin = Property( name: "versetBegin", columnName:"versetBegin");
  static final Property bookEnd = Property( name: "bookEnd", columnName:"bookEnd");
  static final Property chaptersEnd = Property( name: "chaptersEnd", columnName:"chaptersEnd");
  static final Property versetEnd = Property( name: "versetEnd", columnName:"versetEnd");
  static final Property isPublic = Property( name: "isPublic", columnName:"isPublic");
  static final Property isSyncOnline = Property( name: "isSyncOnline", columnName:"isSyncOnline");
  static final Property versionCode = Property( name: "versionCode", columnName:"versionCode");

  static final Property dateDebutStr = Property(columnName:"dateDebutStr");
  static final Property dateFinStr = Property(columnName:"dateFinStr");
  static final Property isSystemData = Property(columnName:"isSystemData");
  static final Property isDelete = Property(columnName:"isDelete");
  static final Property dateCreatedStr = Property(columnName:"dateCreatedStr");
  static final Property dateModifStr = Property(columnName:"dateModifStr");

  static final Property langues = Property(columnName:"langues");
  static final Property pdlCategory = Property(columnName:"pdlCategory");
  static final Property pdlBooks = Property(columnName:"pdlBooks");
  static final Property pdlSubscriptionPlan = Property(columnName:"pdlSubscriptionPlan");
  static final Property nbrSubscription = Property(columnName:"nbrSubscription");

  static final Property pdlPlanDeLectureId = Property(columnName:"pdlPlanDeLectureId");
  static final Property titre = Property(columnName:"titre");
  static final Property description = Property(columnName:"description");
  static final Property languageCode = Property(columnName:"languageCode");
  static final Property user = Property(columnName:"user");

}