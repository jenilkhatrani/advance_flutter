import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class themes{
  final ThemeData lighttheme =ThemeData(


      useMaterial3: true,
      switchTheme: const SwitchThemeData(
        thumbColor:WidgetStatePropertyAll(Colors.cyan),
        trackColor: WidgetStatePropertyAll(Colors.black),
      ),
      floatingActionButtonTheme: const FloatingActionButtonThemeData(
          foregroundColor: Colors.cyan,
          backgroundColor: Colors.black
      )
  );

  final ThemeData darktheme = ThemeData(
      brightness: Brightness.dark,
      switchTheme: const SwitchThemeData(
        thumbColor: WidgetStatePropertyAll(Colors.black),
        trackColor: WidgetStatePropertyAll(Colors.cyan),
      ),
      floatingActionButtonTheme: const FloatingActionButtonThemeData(
          backgroundColor: Colors.cyan,
          foregroundColor: Colors.black
      )
  );


  final CupertinoThemeData lightTheme = const CupertinoThemeData(
    brightness: Brightness.light,
    primaryColor: CupertinoColors.systemBlue,
  );

  final CupertinoThemeData darkTheme = const CupertinoThemeData(
    brightness: Brightness.dark,
    primaryColor: CupertinoColors.systemYellow,

  );


}