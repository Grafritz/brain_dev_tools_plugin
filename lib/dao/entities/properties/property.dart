class Property{
  int? ordinal;
  String? name;
  bool primaryKey;
  String columnName;
  dynamic type;

  Property( { this.name, this.ordinal, this.primaryKey=false, required this.columnName } );

}