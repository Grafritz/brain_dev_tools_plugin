import 'dart:convert';

import 'package:brain_dev_tools/dao/entities/properties/pager_property.dart';
import 'package:brain_dev_tools/models/pagination/links_model.dart';
import 'package:brain_dev_tools/tools/validation/type_safe_conversion.dart';

class PaginationModel {
  int? currentPage;
  List/*<dynamic>*/ data = [];
  String? firstPageUrl;
  int? from;
  int? lastPage;
  String? lastPageUrl;
  List<LinksModel>? links;
  String? nextPageUrl;
  String? path;
  String? perPage;
  String? prevPageUrl;
  int? to;
  int total = 0;

  PaginationModel({
    this.currentPage,
    //this.data,
    this.firstPageUrl,
    this.from,
    this.lastPage,
    this.lastPageUrl,
    this.links,
    this.nextPageUrl,
    this.path,
    this.perPage,
    this.prevPageUrl,
    this.to,
    this.total = 0,
  });

  factory PaginationModel.fromJson(Map<String, dynamic> json, {required String classObject, required dynamic objData}) {
    PaginationModel obj = PaginationModel();
    obj.currentPage = TypeSafeConversion.nullSafeInt(json[PagerProperty.currentPage.columnName]);
    var dataList = fromJsonHelperList(json: json[PagerProperty.data.columnName], classObject: classObject, objData: objData);
    obj.data = dataList;
    obj.firstPageUrl = TypeSafeConversion.nullSafeString(json[PagerProperty.firstPageUrl.columnName]);
    obj.from =TypeSafeConversion.nullSafeInt(json[PagerProperty.from.columnName]);
    obj.lastPage =TypeSafeConversion.nullSafeInt(json[PagerProperty.lastPage.columnName]);
    obj.lastPageUrl = TypeSafeConversion.nullSafeString(json[PagerProperty.lastPageUrl.columnName]);
    obj.links = LinksModel.fromJsonList(json[PagerProperty.links.columnName]);
    obj.nextPageUrl = TypeSafeConversion.nullSafeString(json[PagerProperty.nextPageUrl.columnName]);
    obj.path =TypeSafeConversion.nullSafeString(json[PagerProperty.path.columnName]);
    obj.perPage = TypeSafeConversion.nullSafeString(json[PagerProperty.perPage.columnName]);
    obj.prevPageUrl = TypeSafeConversion.nullSafeString(json[PagerProperty.prevPageUrl.columnName]);
    obj.to = TypeSafeConversion.nullSafeInt(json[PagerProperty.to.columnName]);
    obj.total =TypeSafeConversion.nullSafeInt(json[PagerProperty.total.columnName]);
    return obj;
  }

  static fromJsonHelperList({required json, required String classObject, required dynamic objData})
  {
    //if (classObject == AlbumGroupeModel.name) {
      return objData.fromJsonList(json);
    //}
    // if (classObject == ChantDesperanceModel.name) {
    //   return ChantDesperanceModel.fromJsonList(json);
    // }
    // if (classObject == ChantFavorisModel.name) {
    //   return ChantFavorisModel.fromJsonList(json);
    // }
    //return [];
  }

  PaginationModel fromJson(String str, {required classObject, required objData}) =>
      PaginationModel.fromJson(json.decode(str), classObject: classObject, objData: objData);
//String pageToJson(PaginationModel data) => json.encode(data.toJson());
}
