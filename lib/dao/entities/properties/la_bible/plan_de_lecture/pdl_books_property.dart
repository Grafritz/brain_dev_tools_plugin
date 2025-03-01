import 'package:brain_dev_tools/dao/entities/properties/property.dart';

class PdlBooksProperty {
  static final Property id = Property( name: "id", columnName:"id");
  static final Property codeUnique = Property( name: "codeUnique", columnName:"codeUnique");
  static final Property idUser = Property( name: "idUser", columnName:"idUser");
  static final Property idPlanDeLecture = Property( name: "idPlanDeLecture", columnName:"idPlanDeLecture");
  static final Property rowIndex = Property( name: "rowIndex", columnName:"rowIndex");
  static final Property number = Property( name: "number", columnName:"number");
  static final Property osis = Property( name: "osis", columnName:"osis");
  static final Property chaptersBegin = Property( name: "chaptersBegin", columnName:"chaptersBegin");
  static final Property chaptersEnd = Property( name: "chaptersEnd", columnName:"chaptersEnd");
  static final Property versetBegin = Property( name: "versetBegin", columnName:"versetBegin");
  static final Property versetEnd = Property( name: "versetEnd", columnName:"versetEnd");
  static final Property versionCode = Property( name: "versionCode", columnName:"versionCode");
}