import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:ui_flutter_course/toturials/grid_example.dart';


import 'buttonExample.dart';

void main() {
  runApp(
    MaterialApp(
      home: const GridExample(),
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        // brightness: Brightness.dark,
        primaryColor: Colors.amber,
        // scaffoldBackgroundColor: Color(0x8984FFFF),
      ),
    ),
  );
}

