import 'package:flutter/material.dart';

class Themes {
  ThemeData darkTheme = ThemeData(
    colorScheme: const ColorScheme.light(
      primary: Colors.blue,
      onPrimary: Colors.red,
      secondary: Color.fromARGB(255, 33, 33, 33),
      onSecondary: Colors.black,
      surface: Colors.white,
    ),
    appBarTheme: const AppBarTheme(
      backgroundColor: Colors.black45,
      foregroundColor: Color.fromARGB(255, 238, 238, 238),
      iconTheme: IconThemeData(
        color: Colors.blue,
      ),
    ),
    scaffoldBackgroundColor: Colors.black45,
    floatingActionButtonTheme: FloatingActionButtonThemeData(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(40),
      ),
      backgroundColor: Colors.blue,
      foregroundColor: Colors.white,
      iconSize: 25,
    ),
    listTileTheme: const ListTileThemeData(
      contentPadding: EdgeInsets.only(left: 20, top: 5, bottom: 5),
      textColor: Color.fromARGB(255, 238, 238, 238),
      titleTextStyle: TextStyle(
        letterSpacing: 1,
        wordSpacing: 3,
        fontSize: 16,
        fontWeight: FontWeight.w500,
      ),
      iconColor: Colors.blue,
    ),
    primaryColor: Colors.white,
    dialogBackgroundColor: const Color.fromARGB(255, 238, 238, 238),
    primaryColorLight: Colors.black,
  );

  ThemeData lightTheme = ThemeData(
    colorScheme: const ColorScheme.light(
      primary: Color.fromARGB(255, 54, 152, 233),
      onPrimary: Colors.red,
      secondary: Colors.white,
      onSecondary: Colors.black,
      surface: Colors.white,
    ),
    appBarTheme: const AppBarTheme(
        backgroundColor: Color.fromARGB(255, 238, 238, 238),
        foregroundColor: Colors.black,
        iconTheme: IconThemeData(
          color: Color.fromARGB(255, 54, 152, 233),
        )),
    scaffoldBackgroundColor: const Color.fromARGB(255, 238, 238, 238),
    floatingActionButtonTheme: FloatingActionButtonThemeData(
       shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(40),
      ),
      backgroundColor: Colors.blue,
      foregroundColor: Colors.white,
      iconSize: 25,
    ),
    listTileTheme: const ListTileThemeData(
      contentPadding: EdgeInsets.only(left: 20, top: 5, bottom: 5),
      textColor: Colors.black87,
      titleTextStyle: TextStyle(
        fontSize: 16,
        fontWeight: FontWeight.w500,
      ),
      iconColor: Color.fromARGB(255, 54, 152, 233),
    ),
    primaryColor: Colors.white,
    dialogBackgroundColor: const Color.fromARGB(255, 238, 238, 238),
    primaryColorLight: Colors.white,
  );
}
