import 'package:brain_dev_tools/tools/wave_clippers.dart';
import 'package:flutter/material.dart';

class ClipPathDesign extends StatelessWidget {
  const ClipPathDesign({
    super.key,
    this.height1 = 80,
    this.height2 = 96,
    this.height3 = 93,
  });

  final double height1, height2, height3;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        ClipPath(
          clipper: WaveClipper2(),
          child: Container(
            margin: const EdgeInsets.only(top: 0.0),
            width: double.infinity,
            height: height1,
            decoration: BoxDecoration(
                //borderRadius: BorderRadius.circular(10.0),
                gradient: LinearGradient(
                    //colors: [Colors.yellow[100], Colors.orange[100]]
                    colors: [Theme.of(context).primaryColor, Colors.white24])),
            child: const Column(),
          ),
        ),
        ClipPath(
          clipper: WaveClipper3(),
          child: Container(
            margin: const EdgeInsets.only(top: 0.0),
            width: double.infinity,
            height: height2,
            decoration: BoxDecoration(
                //borderRadius: BorderRadius.circular(10.0),
                gradient: LinearGradient(
                    //colors: [ Colors.orange[100], Colors.orange[200] ]
                    colors: [
                  Theme.of(context).primaryColor,
                  Theme.of(context).primaryColorLight
                ])),
            child: const Column(),
          ),
        ),
        ClipPath(
          clipper: WaveClipper1(),
          child: Container(
            margin: const EdgeInsets.only(top: 0.0),
            width: double.infinity,
            height: height3,
            decoration: BoxDecoration(
                //borderRadius: BorderRadius.circular(10.0),
                gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    stops: const [
                  0.02,
                  0.4
                ],
                    colors: [
                  Theme.of(context).primaryColor,
                  Theme.of(context).primaryColorDark
                ])),
          ),
        ),
      ],
    );
  }
}

class ClipPathDesignRoundCornerTop extends StatelessWidget {
  const ClipPathDesignRoundCornerTop({
    super.key,
    this.height1 = 80,
    this.height2 = 96,
    this.height3 = 93,
  });

  final double height1, height2, height3;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        ClipPath(
          clipper: WaveClipper2(),
          child: Container(
            margin: const EdgeInsets.only(top: 70.0),
            width: double.infinity,
            height: height1,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10.0),
                gradient: LinearGradient(
                    //colors: [Colors.yellow[100], Colors.orange[100]]
                    colors: [Theme.of(context).primaryColor, Colors.white24])),
            child: const Column(),
          ),
        ),
        ClipPath(
          clipper: WaveClipper3(),
          child: Container(
            margin: const EdgeInsets.only(top: 70.0),
            width: double.infinity,
            height: height2,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10.0),
                gradient: LinearGradient(
                    //colors: [ Colors.orange[100], Colors.orange[200] ]
                    colors: [
                      Theme.of(context).primaryColor,
                      Theme.of(context).primaryColorLight
                    ])),
            child: const Column(),
          ),
        ),
        ClipPath(
          clipper: WaveClipper1(),
          child: Container(
            margin: const EdgeInsets.only(top: 69.0),
            width: double.infinity,
            height: height3,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10.0),
                gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    stops: const [
                      0.02,
                      0.4
                    ],
                    colors: [
                      Theme.of(context).primaryColor,
                      Theme.of(context).primaryColorDark
                    ])),
          ),
        ),
      ],
    );
  }
}
