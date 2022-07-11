import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class TodoListThemeConfig {
  TodoListThemeConfig._();

  static ThemeData get theme => ThemeData(
        textTheme: GoogleFonts.mandaliTextTheme(),
        primaryColor: const Color(0xff5C77CE),
        primaryColorLight: const Color(0xffABC8F7),
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            primary: const Color(0xff5C77CE),
            textStyle: const TextStyle(
              fontSize: 16,
            ),
          ),
        ),
      );
}
