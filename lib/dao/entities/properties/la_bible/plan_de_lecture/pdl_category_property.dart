import 'package:brain_dev_tools/dao/entities/properties/property.dart';

class PdlCategoryProperty {
  static final Property id = Property( name: "id", columnName:"id");
  static final Property codeCategorie = Property( name: "codeCategorie", columnName:"codeCategorie");
  static final Property nameFr = Property( name: "name_fr", columnName:"name_fr");
  static final Property nameEn = Property( name: "name_en", columnName:"name_en");
  static final Property nameHt = Property( name: "name_ht", columnName:"name_ht");
  static final Property nameEs = Property( name: "name_es", columnName:"name_es");
  static final Property descriptionsFr = Property( name: "descriptions_fr", columnName:"descriptions_fr");
  static final Property descriptionsEn = Property( name: "descriptions_en", columnName:"descriptions_en");
  static final Property descriptionsHt = Property( name: "descriptions_ht", columnName:"descriptions_ht");
  static final Property descriptionsEs = Property( name: "descriptions_es", columnName:"descriptions_es");
  static final Property rowIndex = Property( name: "rowIndex", columnName:"rowIndex");
  static final Property isImageNetworkBg = Property( name: "isImageNetworkBg", columnName:"isImageNetworkBg");
  static final Property imageBg = Property( name: "imageBg", columnName:"imageBg");
  static final Property icon = Property( name: "icon", columnName:"icon");
  static final Property isIconNetwork = Property( name: "isIconNetwork", columnName:"isIconNetwork");
  static final Property versionCode = Property( name: "versionCode", columnName:"versionCode");

  static final Property langues = Property(  columnName:"langues");
  static final Property languageCode = Property(  columnName:"languageCode");
  static final Property pdlCategoryId = Property(  columnName:"pdlCategoryId");
  static final Property name = Property(  columnName:"name");
  static final Property descriptions = Property(  columnName:"descriptions");
}