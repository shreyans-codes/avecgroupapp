import 'package:flutter/material.dart';
import 'colors.dart';
class OurTheme{
  ThemeData buildTheme() {
    return ThemeData(
      canvasColor: Colors.white,
      inputDecorationTheme: InputDecorationTheme(
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(30.0),
          borderSide: BorderSide(
            color: borderColor,
          ),        
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(30.0),
          borderSide: BorderSide(
            color: globalPurple,
          ),
        ),
      ),
    );
  }
}