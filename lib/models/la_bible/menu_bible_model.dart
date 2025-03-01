import 'package:brain_dev_tools/I10n/localization_constants.dart';
import 'package:brain_dev_tools/models/menu/menu_model.dart';
import 'package:brain_dev_tools/tools/enum/enum.dart';
import 'package:flutter/material.dart';

getTitle({ required bool isSplitEnable, required MenuModel menu }){
  if( menu.actionsMenu == ActionsMenu.active2Version ){
    if( isSplitEnable ){
      return '${tr('label_desactive_2eme_version_bible')}';
    }
    return '${tr('label_active_2eme_version_bible')}';
  }
  return menu.title;
}

List<MenuModel> iconActionsMenuList =  <MenuModel>[
  MenuModel(title: '${tr('nav_Recherche')}', actionsMenu: ActionsMenu.recherche, icon: Icons.search_rounded),
  MenuModel(title: '${tr('label_active_2eme_version_bible')}', actionsMenu: ActionsMenu.active2Version, icon: Icons.horizontal_split),
  MenuModel(title: '${tr('label_Parametres_de_lecture')}', actionsMenu: ActionsMenu.parametreDeLecture, icon: Icons.settings_applications_rounded),
];