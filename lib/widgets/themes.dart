import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:velocity_x/velocity_x.dart';

class MyTheme {
  static ThemeData lightTheme(BuildContext context) => ThemeData(
        brightness: Brightness.light,
        primarySwatch: Colors.deepPurple,
        cardColor: Colors.white,
        secondaryHeaderColor: darkBluishColor,
        canvasColor: creamColor,
        floatingActionButtonTheme:
            FloatingActionButtonThemeData(backgroundColor: darkBluishColor),
        elevatedButtonTheme: ElevatedButtonThemeData(
            style: ButtonStyle(
                shape: MaterialStateProperty.all(const StadiumBorder()),
                backgroundColor: MaterialStateProperty.all(darkBluishColor))),
        fontFamily: GoogleFonts.poppins().fontFamily,
        appBarTheme: AppBarTheme(
          color: Colors.white,
          elevation: 0.0,
          iconTheme: const IconThemeData(color: Colors.black),
          toolbarTextStyle: Theme.of(context).textTheme.bodyText2,
          titleTextStyle: Theme.of(context).textTheme.headline6,
        ),
      );

  static ThemeData darkTheme(BuildContext context) => ThemeData(
        brightness: Brightness.dark,
        primarySwatch: Colors.blue,
        cardColor: Colors.black,
        canvasColor: darkcreamColor,
        secondaryHeaderColor: Colors.white,
        floatingActionButtonTheme:
            FloatingActionButtonThemeData(backgroundColor: lightBluishColor),
        elevatedButtonTheme: ElevatedButtonThemeData(
            style: ButtonStyle(
                shape: MaterialStateProperty.all(const StadiumBorder()),
                backgroundColor: MaterialStateProperty.all(lightBluishColor))),
        fontFamily: GoogleFonts.poppins().fontFamily,
        appBarTheme: AppBarTheme(
          color: darkcreamColor,
          elevation: 0.0,
          iconTheme: const IconThemeData(color: Colors.white),
          toolbarTextStyle: Theme.of(context).textTheme.bodyText2,
          titleTextStyle: const TextStyle(color: Colors.white, fontSize: 25),
        ),
      );

  static Color creamColor = const Color(0xfff5f5f5);
  static Color darkcreamColor = Vx.gray900;
  static Color lightBluishColor = Vx.indigo500;
  static Color darkBluishColor = const Color(0xff403b58);
}
