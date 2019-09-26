import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:skoline/responseData/KlassesResponse.dart';
import 'package:skoline/responseData/UserResponse.dart';
import 'package:skoline/responseData/LogInResponse.dart';
import 'homePage.dart';
import 'signUp.dart';
import 'package:skoline/networkCalls/AllHttpNetworkCalls.dart';
import 'package:skoline/SharedData/Token.dart';

// Define a custom Form widget.
class Login extends StatelessWidget {


  TextEditingController userName= new TextEditingController();
  TextEditingController dob= new TextEditingController();
  Token token=new Token();

  @override
  Widget build(BuildContext context) {
    MediaQueryData media = MediaQuery.of(context);

    final Size screenSize = media.size;
    return new Scaffold(
      body: new Container(
          padding: new EdgeInsets.all(20.0),

          child: new Form(
            child: new ListView(
              children: <Widget>[
                new Container(
                    padding: new EdgeInsets.all(20.0),
                    child:new Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        new Image(
                            height: 200,
                            image: new AssetImage("assets/images/fajar.gif"),
                            fit: BoxFit.fitHeight),
                      ],
                    )
                ),
                new Container(
                    padding: const EdgeInsets.only(top: 10.0),
                    child: new TextFormField(
                        controller: userName ,
                        keyboardType: TextInputType.text,
                        maxLines: 1,
                        decoration: InputDecoration(
                          filled: true,
                          fillColor: Colors.white,
                          labelText: 'Enter your name',
                          labelStyle: TextStyle(
                              color: Colors.black38,
                              fontSize: 15
                          ),

                          focusedBorder: OutlineInputBorder(
                            borderSide: new BorderSide(color: Colors.black),
                            borderRadius:new  BorderRadius.circular(5),
                          ),
                          enabledBorder: UnderlineInputBorder(
                            borderSide: BorderSide(color: Colors.white),
                            borderRadius: BorderRadius.circular(10),
                          ),
                          icon: new Icon(Icons.person)
                        ))
                ),
                new Container(
                  padding: const EdgeInsets.only(top:10.0),
                  child: TextFormField(
                      controller: dob,
                      keyboardType: TextInputType.datetime,
                      decoration: InputDecoration(
                        filled: true,
                        fillColor: Colors.white,
                        labelText: 'dd/mm/yyyy',
                        labelStyle: TextStyle(
                            color: Colors.black38,
                            fontSize: 15
                        ),

                        focusedBorder: OutlineInputBorder(
                          borderSide: new BorderSide(color: Colors.black),
                          borderRadius:new  BorderRadius.circular(5),
                        ),
                        enabledBorder: UnderlineInputBorder(
                          borderSide: BorderSide(color: Colors.white),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        icon: new Icon(Icons.date_range)
                      )),
                ),
                new Container(
                  width: screenSize.width,
                  child:new Column(
                    children: <Widget>[
                      new Container(
                        margin: const EdgeInsets.only(left: 10.0,top: 20.0),
                        child: new Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            new Container(
                              height:50.0,
                              width: 210.0,
                              child: new RaisedButton(
                                  color: Colors.red,
                                  onPressed: ()  async {
                                    Map map = new Map();
                                    map['unique_name'] = userName.text;
                                    map['date_of_birth'] = dob.text;

                                    LogInResponse loginResponse = await getToken("users/login", body: map);

                                    print(loginResponse.token);
                                    token.setToken=loginResponse.token;
                                    showUser(context);
                                  },
                                  child: Text(
                                    "Log in",
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 18,
                                        fontWeight: FontWeight.bold),
                                  )),

                            ),

                          ],
                        ),
                      )
                    ],
                  ),
                )
              ],
            ),
          )
      ),
      backgroundColor: Colors.amber[700],
    );
  }

  void showUser(BuildContext context) async{
    UserResponse userResponse= await getUser("users/profile",token.getToken);
    KlassesResponse klassesResponse= await getKlasses("klasses",token.getToken);
    Navigator.pushReplacement(context, SlideLeftRoute(page: Homepage(userResponse: userResponse,klassesResponse: klassesResponse)));
    print(userResponse.user.childName);
  }
}

class SlideLeftRoute extends PageRouteBuilder {
  final Widget page;
  SlideLeftRoute({this.page})
      : super(
          pageBuilder: (
            BuildContext context,
            Animation<double> animation,
            Animation<double> secondaryAnimation,
          ) =>
              page,
          transitionsBuilder: (
            BuildContext context,
            Animation<double> animation,
            Animation<double> secondaryAnimation,
            Widget child,
          ) =>
              SlideTransition(
            position: Tween<Offset>(
              begin: const Offset(1, 0),
              end: Offset.zero,
            ).animate(animation),
            child: child,
          ),
        );
}



