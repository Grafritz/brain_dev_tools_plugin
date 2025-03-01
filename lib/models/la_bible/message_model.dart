class MessageModel {
  int statusCode;
  String message;
  bool isSuccess = false;
  bool isRequiredToReLogin = false;
  Object? objectData;
  List<Object>? objectDataList;

  MessageModel({
    this.statusCode = 500,
    this.message = '',
    this.isSuccess = false,
    this.isRequiredToReLogin = false,
  });
}
