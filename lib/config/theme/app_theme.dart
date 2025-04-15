import 'package:flutter/material.dart';

ThemeData theme() {
  return ThemeData(
      scaffoldBackgroundColor: Colors.white,
      fontFamily: 'poppins',
      appBarTheme: appBarTheme());
}

AppBarTheme appBarTheme() {
  return const AppBarTheme(
    color: Colors.blue,
    elevation: 2,
    centerTitle: true,
  );
}
