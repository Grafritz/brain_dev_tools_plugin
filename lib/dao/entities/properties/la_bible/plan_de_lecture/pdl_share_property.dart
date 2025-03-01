// ignore_for_file: non_constant_identifier_names

import 'package:brain_dev_tools/dao/entities/properties/property.dart';

class PdlShareProperty {
  static final Property id = Property(columnName: "id", primaryKey: true);
  static final Property userId = Property(columnName: "userId");
  static final Property codeLecture = Property(columnName: "codeLecture");
  static final Property userIdDestination =
      Property(columnName: "userIdDestination");
  static final Property statusShared = Property(columnName: "statusShared");
  static final Property isCanUpdate = Property(columnName: "isCanUpdate");
  static final Property isCanShare = Property(columnName: "isCanShare");
  static final Property isVisualiserChant =
      Property(columnName: "isVisualiserChant");
  static final Property dateVisualiserChant =
      Property(columnName: "dateVisualiserChant");
  static final Property created_at = Property(columnName: "dateCreated");
  static final Property updated_at = Property(columnName: "dateUpdated");
  static final Property statutShared = Property(columnName: "statutShared");

  static final Property userDestination = Property(columnName: "userDestination");

  static final Property body = Property(columnName: "body");
  static final Property imageBase64 = Property(columnName: "imageBase64");
  static final Property linkWebPartial = Property(columnName: "linkWebPartial");

  static final Property myImageInfo = Property(columnName: "myImageInfo");
  static final Property pdlShares = Property(columnName: "pdlShares");
}