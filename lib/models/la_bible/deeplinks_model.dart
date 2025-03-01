class DeepLinksModel{
  Uri? initialUri;
  String? initialLink;
  Uri? latestUri;
  String latestLink = 'Unknown';
  String? latestUriPath;
  List<MapEntry<String, List<String>>>? queryParams;
  Object? objArguments;
  List<Object>? booksListArg1;
  List<Object>? pdlBooksListArg2;
  List<Object>? booksListFromdbArg3;

  DeepLinksModel({
    this.initialLink,
    this.latestLink = 'Unknown',
    this.initialUri,
    this.latestUriPath,
    this.latestUri,
    this.queryParams,
    this.objArguments,
    this.booksListArg1,
    this.pdlBooksListArg2,
    this.booksListFromdbArg3,
  });

//region [ JSON ]
  Map<String, dynamic> convertToJson() => {
    'initialLink': initialLink,
    'latestLink': latestLink,
    'initialUri': initialUri,
    'latestUriPath': latestUriPath,
    'latestUri': latestUri,
    'queryParams': queryParams,
    // 'objArguments': this.objArguments,
    // 'booksListArg1': this.booksListArg1,
    // 'pdlBooksListArg2': this.pdlBooksListArg2,
    // 'booksListFromdbArg3': this.booksListFromdbArg3
    // 'book': (this.book!=null)?this.book.convertToJson():[],
  };
  static toJsonList(List<DeepLinksModel> data){
    return data.map((e) => e.convertToJson()).toList();
  }
//endregion
}