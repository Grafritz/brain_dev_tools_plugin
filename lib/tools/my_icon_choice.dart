import 'package:flutter/material.dart';

class MyIconChoice{
  MyIconChoice({
    this.id,
    required this.icon,
    required this.title,
    required this.imagePath
  });

  int? id;
  final String title;
  final IconData icon;
  String imagePath='';

}