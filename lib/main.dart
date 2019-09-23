import 'dart:async';

import 'package:flutter/material.dart';
import 'package:skoline/login.dart';
import 'package:skoline/splashPage.dart';

void main() {

  runApp(Skoline());

  const timeout = const Duration(seconds: 3);
  const ms = const Duration(milliseconds: 1);
  int milliseconds;

  var duration = milliseconds == null ? timeout : ms * milliseconds;
  new Timer(duration, handleTimeout);

}

void handleTimeout() {  // callback function
  Login();
}

class Skoline extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primarySwatch: Colors.cyan,
      ),
      home:splashPage(),

    );
  }

}




