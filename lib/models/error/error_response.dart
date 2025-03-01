import 'package:brain_dev_tools/tools/validation/type_safe_conversion.dart';
import 'package:get/get.dart';

class ValidationError {
  final String field;
  final List<String> messages;

  ValidationError(this.field, this.messages);

  factory ValidationError.fromJson(Map<String, dynamic> json) {
    return ValidationError(
      json['field'] as String,
      (json['messages'] as List).map((e) => e as String).toList(),
    );
  }
}

class ErrorResponseModel {
  final Map<String, List<String>>? errors;
  final String type;
  final String title;
  final int status;
  final String traceId;

  ErrorResponseModel({
    required this.errors,
    required this.type,
    required this.title,
    required this.status,
    required this.traceId,
  });

  factory ErrorResponseModel.fromJson(Map<String, dynamic> json) {
    return ErrorResponseModel(
      type: TypeSafeConversion.nullSafeString( json['type'] ),
      title: TypeSafeConversion.nullSafeString( json['title'] ),
      status: TypeSafeConversion.nullSafeInt( json['status'] ),
      traceId: TypeSafeConversion.nullSafeString( json['traceId']),
      errors: (json['errors']==null)?null:(json['errors'] as Map<String, dynamic>).map(
            (key, value) => MapEntry(
          key,
          (value as List).map((e) => e as String).toList(),
        ),
      ),
    );
  }

  static String messages({ ErrorResponseModel? errorResponse}){
    String msg ='';
    if( errorResponse != null ) {
      msg = errorResponse.title.tr;
      if( errorResponse.errors!=null && errorResponse.errors!.isNotEmpty) {
        errorResponse.errors!.forEach((field, messages) {
          msg += '\n\n\t - $field:';
          if( messages.isNotEmpty) {
            for (var message in messages) {
              msg += '\n\t\t    $message';
            }
          }
        });
      }
    }
    return msg;
  }

}


/*
Map<String, dynamic> jsonMap = json.decode(jsonString);
  ErrorResponse errorResponse = ErrorResponse.fromJson(jsonMap);

  print('Type: ${errorResponse.type}');
  print('Title: ${errorResponse.title}');
  print('Status: ${errorResponse.status}');
  print('TraceId: ${errorResponse.traceId}');

  print('Errors:');
  errorResponse.errors.forEach((field, messages) {
    print('  $field:');
    messages.forEach((message) {
      print('    $message');
    });
  });
*/
/*
{
  "errors": {
    "UserName": [
      "The UserName field is required."
    ],
    "NomComplet": [
      "The NomComplet field is required."
    ]
  },
  "type": "https://tools.ietf.org/html/rfc7231#section-6.5.1",
  "title": "One or more validation errors occurred.",
  "status": 400,
  "traceId": ""
}
*/