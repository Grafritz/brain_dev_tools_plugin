
import 'package:brain_dev_tools/config/routes/route_helper.dart';
import 'package:brain_dev_tools/views/base/custom_image.dart';
import 'package:brain_dev_tools/tools/utils/image_icon_resources.dart';
import 'package:flutter/material.dart';

class ProfilImage extends StatelessWidget {
  const ProfilImage({
    super.key,
    this.addLink = true,
    required this.photoPath,
    required this.nomComplet,
    required this.width,
    required this.height,
    required this.userId,
    this.boxShape,
    this.isConnectedYN = false,
    this.isConnectedCheck = false,
    this.onTap,
  });

  final String photoPath, userId, nomComplet;
  final double width, height;
  final bool addLink, isConnectedYN, isConnectedCheck;
  final BoxShape? boxShape;
  final GestureTapCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (onTap != null)
          ? onTap
          : () {
            if( addLink ) {
              if( isConnectedCheck ){
                if( isConnectedYN ){
                  RouteHelperTools.navProfileScreen(userId: userId);
                }else{
                  //RouteHelper.navLoginPage();
                }
              }else{
                RouteHelperTools.navProfileScreen(userId: userId);
              }
            }
            },
      child: getImage(),
    );
  }

  getImage() {
    if (photoPath.isNotEmpty) {
      if (photoPath.contains('http') || photoPath.contains('https')) {
        return CustomImage(
            imageUrl: photoPath,
            width: width,
            height: height,
            boxShape: boxShape);
      }
    }
    return SizedBox(
      width: width,
      height: height,
      child: const CircleAvatar(
          radius: 40,
          backgroundColor: Colors.transparent,
          backgroundImage: AssetImage(ImageIconResources.logoUser)),
    );
  }
}
