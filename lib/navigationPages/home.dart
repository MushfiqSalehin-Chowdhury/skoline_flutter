import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:skoline/responseData/UserResponse.dart';

class Home extends StatelessWidget {
  Home(this.userResponse);
  UserResponse userResponse;
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      body: new Center(
        child: new Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            new Text(
              userResponse.user.childName,
              style: Theme.of(context).textTheme.display1,
            ),
          ],
        ),
      ),
    );
  }
}