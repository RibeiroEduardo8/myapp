import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class Themes {
  static final light = ThemeData(
    colorScheme: ColorScheme.fromSwatch(
        primarySwatch: Colors.cyan, backgroundColor: Colors.white),
    appBarTheme: const AppBarTheme(backgroundColor: Colors.cyan),
    
  );
}
