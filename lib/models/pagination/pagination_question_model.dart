import 'package:brain_dev_tools/tools/validation/type_safe_conversion.dart';

class PaginationQuestionModel{
  int? currentPage;
  int? pageNumber;
  int ?nbrPage;
  int? nbrRecord;
  List<Object>? questionsList;

  PaginationQuestionModel({
    this.currentPage,
    this.pageNumber,
    this.nbrPage,
    this.nbrRecord,
    this.questionsList,
  });

  factory PaginationQuestionModel.fromJson(Map<String, dynamic> map) {
    PaginationQuestionModel obj= PaginationQuestionModel(
      currentPage : TypeSafeConversion.nullSafeInt(map['currentPage']),
      pageNumber : TypeSafeConversion.nullSafeInt(map['pageNumber']),
      nbrPage : TypeSafeConversion.nullSafeInt( map['nbrPage'] ),
      nbrRecord : TypeSafeConversion.nullSafeInt( map['nbrRecord']),
    );
    // if( map['questionsList'] != null ) {
    //   obj.questionsList = map['questionsList'].map<Object>((json) => Object.fromJson(json)).toList();
    // }
    return obj;
  }

  @override
  String toString() {
    return '''
    currentPage: $currentPage,
    pageNumber: $pageNumber,
    nbrPage: $nbrPage,
    nbrRecord: $nbrRecord''';
  }
}