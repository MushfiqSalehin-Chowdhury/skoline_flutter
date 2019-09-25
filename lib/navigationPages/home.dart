import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:skoline/responseData/KlassesResponse.dart';
import 'package:skoline/responseData/UserResponse.dart';
import 'package:skoline/networkCalls/AllHttpNetworkCalls.dart';
import 'dart:collection';
import 'package:flutter/scheduler.dart';
import 'dart:convert';

class Home extends StatelessWidget {
  Home(this.klassesResponse);
  KlassesResponse klassesResponse;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
            child: Column(

      children: [
        Column(
          children: [
            Card(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(8.0))),
                color: Colors.cyan,
                child: Column(
                  children: <Widget>[
                    new Image(
                        image: AssetImage("assets/images/logo_skoline.png")
                    ),
                    Text(
                      "Pilih Topik Berdasarkan Kelas"
                    )
                  ],
                )
            )
          ],
        ),
        Column(
          children:<Widget>[
            new GridView.count(
              crossAxisCount: 2,
              children: new List<Widget>.generate(4, (index) {
                return new GridTile(
                  child: new Card(
                      color: Colors.blue.shade200,
                      child: new Center(
                        child: new Text('tile $index'),
                      )
                  ),
                );
              }),
            ),
          ],
        )
      ],
    )));
  }
}
