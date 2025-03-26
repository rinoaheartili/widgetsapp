import 'package:flutter/material.dart';

const Color _customColor = Color( 0xFF5C11D4 ); 
const colorList = <Color> [
  _customColor,
  Colors.blue,
  Colors.red,
  Colors.yellow,
  Colors.green,
  Colors.orange,
  Colors.pink,
  Colors.white,
];

class AppTheme
{
  final int selectedColor;

  AppTheme({
    this.selectedColor = 0
  }): assert (selectedColor >= 0, 'Selected color must ber greater then 0'), 
      assert (selectedColor < colorList.length, 'Selected color must be less or equal than ${colorList.length - 1}');

  ThemeData getTheme() => ThemeData
  ( 
      useMaterial3: true,
      colorSchemeSeed: colorList[selectedColor],
      appBarTheme: AppBarTheme(
        centerTitle: false
      ),
      brightness: Brightness.dark  
  );
}