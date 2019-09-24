import 'package:flutter/material.dart';
import 'package:skoline/responseData/UserResponse.dart';

class Home extends StatefulWidget {
  UserResponse userResponse;

  @override
  _HomeState createState() => _HomeState();

  Home();
}

class _HomeState extends State<Home> {
  // ···
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          children: <Widget>[

          ],
        ),
      ),
    );
  }
}