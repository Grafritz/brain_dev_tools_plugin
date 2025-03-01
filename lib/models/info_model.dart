
import 'package:brain_dev_tools/dao/entities/properties/info_property.dart';
import 'package:brain_dev_tools/tools/validation/type_safe_conversion.dart';

class InfoModel
{
  String apiVersion = '';
  String roleCode = '';
  String permissions = '';
  String jwtToken = '';

  InfoModel({
    this.apiVersion = '',
    this.roleCode = '',
    this.jwtToken = '',
  });

  //region [ ConvertToJson]
  static convertToJsonList(List<InfoModel> data) =>
      data.map((e) => e.toJson()).toList();

  Map<String, dynamic> toJson() => {
    InfoProperty.apiVersion.columnName: apiVersion,
    InfoProperty.roleCode.columnName: roleCode,
    InfoProperty.jwtToken.columnName: jwtToken,
    InfoProperty.jwtToken.columnName: jwtToken,
  };
//endregion

//region [ ConvertFromJson ]
  static List<InfoModel> fromJsonList(var data) =>
      data.map<InfoModel>((json) => InfoModel.fromJson(json)).toList();

  factory InfoModel.fromJson(Map<String, dynamic> map) {
    InfoModel obj = InfoModel();
    obj.apiVersion = TypeSafeConversion.nullSafeString(map[InfoProperty.apiVersion.columnName]);
    obj.roleCode = TypeSafeConversion.nullSafeString(map[InfoProperty.roleCode.columnName]);
    obj.jwtToken = TypeSafeConversion.nullSafeString(map[InfoProperty.jwtToken.columnName]);
    obj.jwtToken = TypeSafeConversion.nullSafeString(map[InfoProperty.jwtToken.columnName]);
    return obj;
  }
//endregion
}