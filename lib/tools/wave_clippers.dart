import 'package:flutter/material.dart';

class WaveClipper1 extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    final path = Path();
    path.lineTo(0.0, size.height - 50);

    var firstEndPoint = Offset(size.width * 0.6, size.height - 29 - 50);
    var firstControlPoint = Offset(size.width * .25, size.height - 60 - 50);
    path.quadraticBezierTo(firstControlPoint.dx, firstControlPoint.dy,
        firstEndPoint.dx, firstEndPoint.dy);

    var secondEndPoint = Offset(size.width, size.height - 60);
    var secondControlPoint = Offset(size.width * 0.84, size.height - 50);
    path.quadraticBezierTo(secondControlPoint.dx, secondControlPoint.dy,
        secondEndPoint.dx, secondEndPoint.dy);
    path.lineTo(size.width, size.height);
    path.lineTo(size.width, 0);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) {
    return false;
  }
}

class WaveClipper3 extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    final path = Path();
    path.lineTo(0.0, size.height - 50);

    var firstEndPoint = Offset(size.width * 0.6, size.height - 15 - 50);
    var firstControlPoint = Offset(size.width * .25, size.height - 60 - 50);
    path.quadraticBezierTo(firstControlPoint.dx, firstControlPoint.dy,
        firstEndPoint.dx, firstEndPoint.dy);

    var secondEndPoint = Offset(size.width, size.height - 40);
    var secondControlPoint = Offset(size.width * 0.84, size.height - 30);
    path.quadraticBezierTo(secondControlPoint.dx, secondControlPoint.dy,
        secondEndPoint.dx, secondEndPoint.dy);
    path.lineTo(size.width, size.height);
    path.lineTo(size.width, 0);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) {
    return false;
  }
}

class WaveClipper2 extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    final path = Path();
    path.lineTo(0.0, size.height - 50);

    var firstEndPoint = Offset(size.width * .7, size.height - 40);
    var firstControlPoint = Offset(size.width * .25, size.height);
    path.quadraticBezierTo(firstControlPoint.dx, firstControlPoint.dy,
        firstEndPoint.dx, firstEndPoint.dy);

    var secondEndPoint = Offset(size.width, size.height - 45);
    var secondControlPoint = Offset(size.width * 0.84, size.height - 50);
    path.quadraticBezierTo(secondControlPoint.dx, secondControlPoint.dy,
        secondEndPoint.dx, secondEndPoint.dy);
    path.lineTo(size.width, size.height);
    path.lineTo(size.width, 0);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) {
    return false;
  }
}

class WaveClipper231 extends StatelessWidget {
  const WaveClipper231({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        ClipPath(
          clipper: WaveClipper2(),
          child: Container(
            margin: const EdgeInsets.only(top: 0.0),
            width: double.infinity,
            height: 120,
            decoration: BoxDecoration(
                //borderRadius: BorderRadius.circular(10.0),
                gradient: LinearGradient(
                    //colors: [Colors.yellow[100], Colors.orange[100]]
                    colors: [Theme.of(context).primaryColor, Colors.white24])),
            child: Column(),
          ),
        ),
        ClipPath(
          clipper: WaveClipper3(),
          child: Container(
            margin: const EdgeInsets.only(top: 0.0),
            width: double.infinity,
            height: 136,
            decoration: BoxDecoration(
                //borderRadius: BorderRadius.circular(10.0),
                gradient: LinearGradient(
                    //colors: [ Colors.orange[100], Colors.orange[200] ]
                    colors: [
                  Theme.of(context).primaryColor,
                  Theme.of(context).primaryColorLight
                ])),
            child: Column(),
          ),
        ),
        ClipPath(
          clipper: WaveClipper1(),
          child: Container(
            margin: const EdgeInsets.only(top: 0.0),
            width: double.infinity,
            height: 133,
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
