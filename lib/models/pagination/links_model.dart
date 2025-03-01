import 'package:brain_dev_tools/dao/entities/properties/pager_property.dart';
import 'package:brain_dev_tools/tools/validation/type_safe_conversion.dart';

class LinksModel {
  final String? url;
  final dynamic label;
  final bool? active;

  LinksModel({
    this.url,
    this.label,
    this.active,
  });

  LinksModel.fromJson(Map<String, dynamic> json)
      : url = json[LinksProperty.url.columnName],
        label = json[LinksProperty.label.columnName],
        active = TypeSafeConversion.nullSafeBool(
            json[LinksProperty.active.columnName]);

  static List<LinksModel> fromJsonList(var data) {
    return data.map<LinksModel>((json) => LinksModel.fromJson(json)).toList();
  }

  Map<String, dynamic> toJson() => {
        LinksProperty.url.columnName: url,
        LinksProperty.label.columnName: label,
        LinksProperty.active.columnName: active
      };
}
