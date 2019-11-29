import 'package:flutter/material.dart';

class ThemeUtils {
  // 默认主题色
//  static const Color defaultColor = const Color(0xFF63CA6C);
  static const Color defaultColor = Colors.lightBlue;

  // 可选的主题色
  static const List<Color> supportColors = [
    defaultColor,
    Colors.purple,
    Colors.orange,
    Colors.deepPurpleAccent,
    Colors.redAccent,
    Colors.blue,
    Colors.amber,
    Colors.green,
    Colors.lime,
    Colors.indigo,
    Colors.cyan,
    Colors.teal,
    Colors.white
  ];

  // 当前的主题色
  static Color currentColorTheme = defaultColor;

  //分割线颜色
  static const Color line_color=Color.fromARGB(255, 245, 245, 245);
}
