import 'package:flutter/material.dart';

class TabControlModel{
  List<Tab> tabsHeaderList;
  List<Widget> widgetsContentTab;
  int indexTabSelected=0;
  int nbrChapitreARattrapper=0;
  int nbrJourARattrapper=0;

  TabControlModel({
    required this.tabsHeaderList,
    required this.widgetsContentTab,
    required this.indexTabSelected,
    this.nbrChapitreARattrapper=0,
    this.nbrJourARattrapper=0,
});
}