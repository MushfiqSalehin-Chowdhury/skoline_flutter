import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:skoline/responseData/UserResponse.dart';

class Profile extends StatelessWidget {
  Profile(this.userResponse);
  UserResponse userResponse;
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      body: new Center(
        child: new Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            CircleAvatar(
              radius: 70.0,
              backgroundImage:
              NetworkImage("http://18.136.124.102"+userResponse.user.avatarUrl),
            ),
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