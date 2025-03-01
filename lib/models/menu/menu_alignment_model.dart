import 'package:brain_dev_tools/tools/enum/enum.dart';
import 'package:brain_dev_tools/tools/constant.dart';
import 'package:flutter/material.dart';

class MenuAlignmentModel {
  String? title;
  String? subTitle;
  String? value;
  IconData? icon;
  ActionsMenuAlignment? actionsMenu;

  MenuAlignmentModel({
    this.title,
    this.subTitle,
    this.icon,
    this.value,
    this.actionsMenu,
  });

  getIconAlignment(String alignment) {
    switch (alignment) {
      case Constant.alignLeft:
        return Icons.format_align_left;

      case Constant.alignCenter:
        return Icons.format_align_center;

      case Constant.alignRight:
        return Icons.format_align_right;
      default:
        return Icons.format_align_left;
    }
  }

  List<MenuAlignmentModel> getIconAlignList = <MenuAlignmentModel>[
    MenuAlignmentModel(
        title: 'Align left',
        value: Constant.alignLeft,
        actionsMenu: ActionsMenuAlignment.left,
        icon: Icons.format_align_left),
    MenuAlignmentModel(
        title: 'Align center',
        value: Constant.alignCenter,
        actionsMenu: ActionsMenuAlignment.center,
        icon: Icons.format_align_center),
    MenuAlignmentModel(
        title: 'Align right',
        value: Constant.alignRight,
        actionsMenu: ActionsMenuAlignment.right,
        icon: Icons.format_align_right),
  ];
}
