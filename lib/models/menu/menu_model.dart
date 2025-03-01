
import 'package:brain_dev_tools/tools/enum/enum.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MenuModel {
  String? title;
  String? subTitle;
  IconData? icon;
  ActionsMenu? actionsMenu;

  MenuModel({
    this.title,
    this.subTitle,
    this.icon,
    this.actionsMenu,
  });
}

get menuEdit => MenuModel(
    //0
    title: 'label_Modifier'.tr,
    actionsMenu: ActionsMenu.edit,
    icon: Icons.edit);

get menuDeleteLocal => MenuModel(
    //1
    title: 'label_Supprimer'.tr,
    actionsMenu: ActionsMenu.delete,
    icon: Icons.delete_outline);

get menuDeleteOnline => MenuModel(
    //2
    title: 'label_supprimer_on_the_cloud'.tr,
    actionsMenu: ActionsMenu.deleteOnline,
    icon: Icons.delete_forever);

get menuShare => MenuModel(
    //3
    title: 'label_Partager'.tr,
    actionsMenu: ActionsMenu.share,
    icon: Icons.supervisor_account_outlined);

get menuCopyLyricShare => MenuModel(
    //3
    title: 'label_copy_lyric_share'.tr,
    actionsMenu: ActionsMenu.copyLyricShare,
    icon: Icons.copy_all);

get menuUploadNewImage => MenuModel(//0
    title: 'upload_new_image'.tr,
    actionsMenu: ActionsMenu.edit,
    icon: Icons.camera_alt_outlined);

get menuDeleteImage => MenuModel(//1
    title: 'delete_image'.tr,
    actionsMenu: ActionsMenu.delete,
    icon: Icons.delete_outline);

List<PopupMenuItem<MenuModel>> popupMenuItemList(
        {bool checkIsSaveOnline = false,
        bool showShare = false,
        required bool isCanEdit,
        required bool isCanDelete}) =>
    <PopupMenuItem<MenuModel>>[
      if (isCanEdit)
        PopupMenuItem<MenuModel>(
            value: menuEdit,
            child: ListTile(
              contentPadding: const EdgeInsets.only(left: 0, right: 0),
              leading: Icon(menuEdit.icon),
              title: Text('${menuEdit.title}'),
            )),
      if (showShare)
        PopupMenuItem<MenuModel>(
            enabled: showShare,
            value: menuShare,
            child: ListTile(
              contentPadding: const EdgeInsets.only(left: 0, right: 0),
              leading: Icon(menuShare.icon),
              title: Text('${menuShare.title}'),
            )),
      if (showShare)
        PopupMenuItem<MenuModel>(
            enabled: showShare,
            value: menuCopyLyricShare,
            child: ListTile(
              contentPadding: const EdgeInsets.only(left: 0, right: 0),
              leading: Icon(menuCopyLyricShare.icon),
              title: Text('${menuCopyLyricShare.title}'),
            )),
      PopupMenuItem<MenuModel>(
          value: menuDeleteLocal,
          child: ListTile(
            selected: true,
            contentPadding: const EdgeInsets.only(left: 0, right: 0),
            leading: Icon(menuDeleteLocal.icon),
            title: Text('${menuDeleteLocal.title}'),
          )),
      if (checkIsSaveOnline && isCanDelete)
        PopupMenuItem<MenuModel>(
            enabled: checkIsSaveOnline,
            value: menuDeleteOnline,
            child: ListTile(
              selected: true,
              contentPadding: const EdgeInsets.only(left: 0, right: 0),
              leading: Icon(menuDeleteOnline.icon),
              title: Text('${menuDeleteOnline.title}'),
            )),
    ];

List<PopupMenuItem<MenuModel>> popupMenuItemBarList({bool showShare = false}) =>
    <PopupMenuItem<MenuModel>>[
      if (showShare)
        PopupMenuItem<MenuModel>(
            enabled: showShare,
            value: menuShare,
            child: ListTile(
              contentPadding: const EdgeInsets.only(left: 0, right: 0),
              leading: Icon(menuShare.icon),
              title: Text('${menuShare.title}'),
            )),
      if (showShare)
        PopupMenuItem<MenuModel>(
            enabled: showShare,
            value: menuCopyLyricShare,
            child: ListTile(
              contentPadding: const EdgeInsets.only(left: 0, right: 0),
              leading: Icon(menuCopyLyricShare.icon),
              title: Text('${menuCopyLyricShare.title}'),
            )),
    ];

List<PopupMenuItem<MenuModel>> popupMenuEditDeleteImageList() =>
    <PopupMenuItem<MenuModel>>[
      PopupMenuItem<MenuModel>(
          value: menuUploadNewImage,
          child: ListTile(
            contentPadding: const EdgeInsets.only(left: 0, right: 0),
            leading: Icon(menuUploadNewImage.icon),
            title: Text(menuUploadNewImage.title),
          )
      ),
      PopupMenuItem<MenuModel>(
          value: menuDeleteImage,
          child: ListTile(
            contentPadding: const EdgeInsets.only(left: 0, right: 0),
            leading: Icon(menuDeleteImage.icon),
            title: Text(menuDeleteImage.title),
          )
      ),
    ];