import 'property.dart';

class PagerProperty {
  static final Property currentPage = Property(columnName: "currentPage");
  static final Property data = Property(columnName: "data");
  static final Property firstPageUrl = Property(columnName: "firstPageUrl");
  static final Property from = Property(columnName: "from");
  static final Property lastPage = Property(columnName: "lastPage");
  static final Property lastPageUrl = Property(columnName: "lastPageUrl");
  static final Property links = Property(columnName: "links");
  static final Property nextPageUrl = Property(columnName: "nextPageUrl");
  static final Property path = Property(columnName: "path");
  static final Property perPage = Property(columnName: "perPage");
  static final Property prevPageUrl = Property(columnName: "prevPageUrl");
  static final Property to = Property(columnName: "to");
  static final Property total = Property(columnName: "total");
}

class LinksProperty {
  static final Property url = Property(columnName: "url");
  static final Property label = Property(columnName: "label");
  static final Property active = Property(columnName: "active");
}
