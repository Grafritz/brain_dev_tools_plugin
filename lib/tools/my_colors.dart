import 'package:flutter/material.dart';
class MyColors{
  static Color primaryColorSwatch = Colors.deepOrange;
  Map<int, Color> color = {
    50: Color.fromRGBO(136, 14, 79, .1),
    100: Color.fromRGBO(136, 14, 79, .2),
    200: Color.fromRGBO(136, 14, 79, .3),
    300: Color.fromRGBO(136, 14, 79, .4),
    400: Color.fromRGBO(136, 14, 79, .5),
    500: Color.fromRGBO(136, 14, 79, .6),
    600: Color.fromRGBO(136, 14, 79, .7),
    700: Color.fromRGBO(136, 14, 79, .8),
    800: Color.fromRGBO(136, 14, 79, .9),
    900: Color.fromRGBO(136, 14, 79, 1),
  };
  static List colors = [
    Colors.red,
    Colors.purple,
    Colors.blue,
    Colors.deepPurple,
    Colors.orange,
    Colors.brown,
    Colors.teal,
    Colors.indigo,
    Colors.white
  ];

  static List primaryColorStr = [
    'red',
    'deep Orange',
    'orange',
    'pink',
    'purple',
    'deep Purple',
    'brown',
    'indigo',
    'blue',
    'light Blue',
    'cyan',
    'blue Grey',
    'teal',
    'green',
  ];

  static List primaryColor = [
    Colors.red,//0
    Colors.deepOrange,
    Colors.orange,//2
    Colors.pink,
    Colors.purple,//4
    Colors.deepPurple,
    Colors.brown,//6
    Colors.indigo,
    Colors.blue,//8
    Colors.lightBlue,
    Colors.cyan,//10
    Colors.blueGrey,
    Colors.teal,//12
    Colors.green,
  ];

}

const List<ColorSwatch> materialColors = <ColorSwatch>[
  Colors.red,//0
  Colors.pink,
  Colors.purple,//2
  Colors.deepPurple,
  Colors.indigo,//4
  Colors.blue,
  Colors.lightBlue,//6
  Colors.cyan,
  Colors.teal,//8
  Colors.green,
  Colors.lightGreen,//10
  Colors.lime,
  Colors.yellow,//11
  Colors.amber,
  Colors.orange,//13
  Colors.deepOrange,
  Colors.brown,//14
  Colors.grey,
  Colors.blueGrey//16
];

const List<ColorSwatch> accentColors = <ColorSwatch>[
  Colors.redAccent,
  Colors.pinkAccent,
  Colors.purpleAccent,
  Colors.deepPurpleAccent,
  Colors.indigoAccent,
  Colors.blueAccent,
  Colors.lightBlueAccent,
  Colors.cyanAccent,
  Colors.tealAccent,
  Colors.greenAccent,
  Colors.lightGreenAccent,
  Colors.limeAccent,
  Colors.yellowAccent,
  Colors.amberAccent,
  Colors.orangeAccent,
  Colors.deepOrangeAccent,
];

const List<ColorSwatch> myFullMaterialColors = <ColorSwatch>[
  ColorSwatch(0xFFFFFFFF, {500: Colors.white}),
  ColorSwatch(0xFF000000, {500: Colors.black}),
  Colors.red,
  Colors.redAccent,
  Colors.pink,
  Colors.pinkAccent,
  Colors.purple,
  Colors.purpleAccent,
  Colors.deepPurple,
  Colors.deepPurpleAccent,
  Colors.indigo,
  Colors.indigoAccent,
  Colors.blue,
  Colors.blueAccent,
  Colors.lightBlue,
  Colors.lightBlueAccent,
  Colors.cyan,
  Colors.cyanAccent,
  Colors.teal,
  Colors.tealAccent,
  Colors.green,
  Colors.greenAccent,
  Colors.lightGreen,
  Colors.lightGreenAccent,
  Colors.lime,
  Colors.limeAccent,
  Colors.yellow,
  Colors.yellowAccent,
  Colors.amber,
  Colors.amberAccent,
  Colors.orange,
  Colors.orangeAccent,
  Colors.deepOrange,
  Colors.deepOrangeAccent,
  Colors.brown,
  Colors.grey,
  Colors.blueGrey
];

getColorMaterial({ @required colorPrimary,  }){
  var result = Colors.white60;
  for (var col in MyColors.primaryColor) {
    if( col==colorPrimary){
      return col;
    }
  }
  return result;
}