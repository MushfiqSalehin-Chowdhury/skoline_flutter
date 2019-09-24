import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'login.dart';

// Define a custom Form widget.
class SplashPage extends StatefulWidget {
  @override
  SplashPageState createState() => SplashPageState();
}

// Define a corresponding State class.
// This class holds data related to the form.
class SplashPageState extends State<SplashPage> {
  // Define the focus node. To manage the lifecycle, create the FocusNode in
  // the initState method, and clean it up in the dispose method.

  Timer _timer;

  SplashPageState() {
    _timer = new Timer(const Duration(seconds: 3), () {
      setState(() {
        Navigator.pushReplacement(context, SlideLeftRoute(page: Login()));
      });
    });
  }

  @override
  void dispose() {
    super.dispose();
    _timer.cancel();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
            child: Column(
                children: <Widget>[
                  SizedBox(height: 200),
                  Expanded(
                      flex: 2,
                      child: Padding(
                        padding: const EdgeInsets.fromLTRB(0.0,0.0,20.0,0.0),
                        child: new Image(
                            image: new AssetImage("assets/images/loading_icon.gif"),
                            fit: BoxFit.fill),
                      )),
                  Expanded(
                      child: new Image(
                        image: new AssetImage("assets/images/loading.gif"),
                        height: 180.0,
                        width: 80,
                      )),
                  SizedBox(height: 100),
                ]
            )),
        backgroundColor: Colors.cyan);
  }
}
