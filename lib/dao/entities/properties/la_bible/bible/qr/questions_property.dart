
import 'package:brain_dev_tools/dao/entities/properties/property.dart';

class QuestionsProperty {
  static final Property id = Property( name: "id", columnName:"id", primaryKey:true);
  static final Property codeQuestion = Property( name:"codeQuestion", columnName:"codeQuestion", primaryKey:false);
  static final Property groupeATNT = Property( name:"groupeATNT", columnName:"groupeATNT", primaryKey:false);
  static final Property idCategorieBook = Property( name:"idCategorieBook", columnName:"idCategorieBook", primaryKey:false);
  static final Property bookOsis = Property( name:"bookOsis", columnName:"bookOsis", primaryKey:false);
  static final Property chapter = Property( name:"chapter", columnName:"chapter", primaryKey:false);
  static final Property frLibelleQuestion = Property( name:"fr_LibelleQuestion", columnName:"fr_LibelleQuestion", primaryKey:false);
  static final Property htLibelleQuestion = Property( name:"ht_LibelleQuestion", columnName:"ht_LibelleQuestion", primaryKey:false);
  static final Property enLibelleQuestion = Property( name:"en_LibelleQuestion", columnName:"en_LibelleQuestion", primaryKey:false);
  static final Property esLibelleQuestion = Property( name:"es_LibelleQuestion", columnName:"es_LibelleQuestion", primaryKey:false);
  static final Property frExplicationReponse = Property( name:"fr_ExplicationReponse", columnName:"fr_ExplicationReponse", primaryKey:false);
  static final Property htExplicationReponse = Property( name:"ht_ExplicationReponse", columnName:"ht_ExplicationReponse", primaryKey:false);
  static final Property enExplicationReponse = Property( name:"en_ExplicationReponse", columnName:"en_ExplicationReponse", primaryKey:false);
  static final Property esExplicationReponse = Property( name:"es_ExplicationReponse", columnName:"es_ExplicationReponse", primaryKey:false);
  static final Property referenceExplication = Property( name:"referenceExplication", columnName:"referenceExplication", primaryKey:false);
  static final Property typeQuestion = Property( name:"typeQuestion", columnName:"typeQuestion", primaryKey:false);
  static final Property level = Property( name:"level", columnName:"level", primaryKey:false);
  static final Property niveauDeDifficulte = Property( name:"niveauDeDifficulte", columnName:"niveauDeDifficulte", primaryKey:false);
  static final Property caractereAccepte = Property( name:"caractereAccepte", columnName:"caractereAccepte", primaryKey:false);
  static final Property nbreValeurMinimal = Property( name:"nbreValeurMinimal", columnName:"nbreValeurMinimal", primaryKey:false);
  static final Property nbreCaractereMaximal = Property( name:"nbreCaractereMaximal", columnName:"nbreCaractereMaximal", primaryKey:false);
  static final Property dateCreated = Property( name:"dateCreated", columnName:"dateCreated", primaryKey:false);
  static final Property activeYN = Property( name:"activeYN", columnName:"activeYN", primaryKey:false);

  static final Property nbrOfQuestions = Property( name:"nbrOfQuestions", columnName:"nbrOfQuestions");
  static final Property difficulty = Property( name:"difficulty", columnName:"difficulty");

  static final Property dbname = Property( columnName:"dbname");
  static final Property langues = Property( columnName:"langues");
  static final Property bibCategoryBook = Property( columnName:"bibCategoryBook");

  static final Property bibReponses = Property( columnName:"bibReponses");
  static final Property questionId = Property( columnName:"questionId");
  static final Property libelleQuestion = Property( columnName:"libelleQuestion");
  static final Property explicationReponse = Property( columnName:"explicationReponse");
  static final Property languageCode = Property( columnName:"languageCode");
}