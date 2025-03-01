import 'package:brain_dev_tools/config/app_config.dart';
import 'package:flutter/material.dart';

class Twid {

  bgImageSplashScreenLight() {
    String img = EnvironmentVariable.appImage.bgImageLight??'';
    return Stack(
        children: [
          Image.asset(
            img,
            width: double.infinity,
            height: double.infinity,
            fit: BoxFit.cover,
          ),
        ]
    );
  }
}
