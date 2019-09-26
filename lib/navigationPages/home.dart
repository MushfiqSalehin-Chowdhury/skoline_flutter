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
    return new Scaffold(
        body: Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: <Widget>[
        Align(
          alignment: Alignment.topCenter,
          child: Container(
            alignment: Alignment.center,
            child: Column(children: [
              Card(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(8.0))),
                  color: Colors.cyan,
                  child: Column(
                    children: <Widget>[
                      new Image(
                          image: AssetImage("assets/images/logo_skoline.png")),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text("Pilih Topik Berdasarkan Kelas"),
                      )
                    ],
                  ))
            ]),
          ),
        ),
        Expanded(
          child: Container(
            alignment: Alignment.center,
            child: Column(
              children: <Widget>[
                Expanded(
                  child: new GridView.count(
                    crossAxisCount: 2,
                    shrinkWrap: true,
                    children: new List<Widget>.generate(6, (index) {
                      return new Container(
                        child: new Card(
                            margin: EdgeInsets.fromLTRB(5.0, 0.0, 5.0, 0.0),
                            shape: RoundedRectangleBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(10.0))),
                            child: new Image.network(
                              RootbaseUrl +
                                  klassesResponse.klasses
                                      .elementAt(index)
                                      .bannerUrl,
                              fit: BoxFit.fill,
                            )),
                      );
                    }),
                  ),
                ),
              ],
            ),
          ),
        ),
        Align(
          alignment: Alignment.bottomCenter,
          child: Container(
            alignment: Alignment.center,
            height: 75.0,
            width: double.infinity,
            color: Colors.blue,
            child: Text(
              'Anything want in the bottom',
              textAlign: TextAlign.center,
            ),
          ),
        ),
      ],
    ));
  }
}
