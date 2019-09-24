import 'dart:async';

import 'package:flutter/material.dart';
import 'package:skoline/login.dart';
import 'package:skoline/splashPage.dart';

void main() =>runApp(Skoline());

class Skoline extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primarySwatch: Colors.cyan,
      ),
      home: SplashPage(),
    );
  }
}
