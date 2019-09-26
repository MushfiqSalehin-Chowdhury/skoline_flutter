import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:skoline/login.dart';
import 'package:skoline/splashPage.dart';


Future main() async {

  await SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);

  runApp(new Skoline());

}
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
