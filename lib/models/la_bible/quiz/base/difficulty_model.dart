// ignore_for_file: constant_identifier_names

import 'dart:core';
import 'package:brain_dev_tools/tools/key_value_model.dart';
import 'package:get/get.dart';

class DifficultyModel {

  //region Quiz
  static const VeryEasy = "VeryEasy";
  static const Easy = "Easy";
  static const Medium = "Medium";
  static const Hard = "Hard";
//endregion

  static List<KeyValueModel> niveauDifficulteQuiz = [
    KeyValueModel( value: VeryEasy, key: 'label_Difficulty_VeryEasy'.tr),
    KeyValueModel( value: Easy, key: 'label_Difficulty_Easy'.tr),
    KeyValueModel( value: Medium, key: 'label_Difficulty_Medium'.tr),
    KeyValueModel( value: Hard, key: 'label_Difficulty_Hard'.tr),
  ];
  static List<KeyValueModel> list = [
    KeyValueModel( key: VeryEasy, value: VeryEasy ),
    KeyValueModel( key: Easy, value: Easy ),
    KeyValueModel( key: Medium, value: Medium ),
    KeyValueModel( key: Hard, value: Hard ),
  ];

  static List<KeyValueModel> nbrOfQuestionQuiz = [
    KeyValueModel( value: '10', key: '10'),// ${tr('label_Questions_par_Quiz')}'),
    KeyValueModel( value: '15', key: '15'),// ${tr('label_Questions_par_Quiz')}'),
    KeyValueModel( value: '20', key: '20'),// ${tr('label_Questions_par_Quiz')}'),
    KeyValueModel( value: '30', key: '30'),// ${tr('label_Questions_par_Quiz')}'),
    KeyValueModel( value: '40', key: '40'),// ${tr('label_Questions_par_Quiz')}'),
    KeyValueModel( value: '50', key: '50'),// ${tr('label_Questions_par_Quiz')}'),
  ];
}