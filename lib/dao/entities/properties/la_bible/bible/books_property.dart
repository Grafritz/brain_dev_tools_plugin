
import 'package:brain_dev_tools/dao/entities/properties/property.dart';

class BooksProperty {
  static final Property number = Property(ordinal:0, name: "Number", columnName:"number", primaryKey:true);
  static final Property osis = Property(ordinal:1,  name:"Osis", columnName:"osis", primaryKey:false);
  static final Property human = Property(ordinal:2,  name:"Human", columnName:"human", primaryKey:false);
  static final Property humanSearch = Property(ordinal:3,  name:"humanSearch", columnName:"humanSearch", primaryKey:false);
  static final Property chapters = Property(ordinal:4,  name:"Chapters", columnName:"chapters", primaryKey:false);

  static final Property humanClean = Property( columnName:"humanClean");
  static final Property chaptersSelected = Property( columnName:"chaptersSelected");
  static final Property versetSelected = Property( columnName:"versetSelected");
  static final Property isChapitrePlanRead = Property( columnName:"isChapitrePlanRead");
  static final Property categoryId = Property( columnName:"categoryId");
  static final Property isAT = Property( columnName:"isAT");
}