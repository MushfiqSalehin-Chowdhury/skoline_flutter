import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:skoline/responseData/UserResponse.dart';
import 'package:skoline/responseData/LogInResponse.dart';
import 'signUp.dart';
import 'homePage.dart';
import 'package:skoline/networkCalls/AllHttpNetworkCalls.dart';
import 'package:skoline/SharedData/Token.dart';

// Define a custom Form widget.
class Login extends StatelessWidget {


  TextEditingController userName= new TextEditingController();
  TextEditingController dob= new TextEditingController();
  Token token=new Token();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
        body: Padding(
        padding: const EdgeInsets.all(30.0),
        child: Column(
          children: [
            // The first text field is focused on as soon as the app starts.
            SizedBox(height: 100),
            Expanded(
                flex: 2,
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(0.0, 0.0, 20.0, 0.0),
                  child: new Image(
                      image: new AssetImage("assets/images/fajar.gif"),
                      fit: BoxFit.cover),
                )),
            TextFormField(
              controller: userName ,
                decoration: InputDecoration(
              filled: true,
              fillColor: Colors.white,
              labelText: 'Enter your name',
              labelStyle: TextStyle(
                color: Colors.blueAccent,
                fontSize: 20
              ),

              focusedBorder: OutlineInputBorder(
                borderSide: new BorderSide(color: Colors.blueAccent),
                borderRadius:new  BorderRadius.circular(5),
              ),
              enabledBorder: UnderlineInputBorder(
                borderSide: BorderSide(color: Colors.white),
                borderRadius: BorderRadius.circular(10),
              ),
            )),
            // The second text field is focused on when a user taps
            Padding(
              padding: const EdgeInsets.fromLTRB(0.0, 20.0, 0.0, 0.0),
              child: TextFormField(
                controller: dob,
                  decoration: InputDecoration(
                    filled: true,
                    fillColor: Colors.white,
                    labelText: 'dd/mm/yyyy',
                    labelStyle: TextStyle(
                        color: Colors.blueAccent,
                        fontSize: 20
                    ),

                    focusedBorder: OutlineInputBorder(
                      borderSide: new BorderSide(color: Colors.blueAccent),
                      borderRadius:new  BorderRadius.circular(5),
                    ),
                    enabledBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: Colors.white),
                      borderRadius: BorderRadius.circular(10),
                    ),
                  )),
            ),
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: RaisedButton(
                  color: Colors.red,
                  onPressed: (

                      )  async {
                    Map map = new Map();
                    map['unique_name'] = userName.text;
                    map['date_of_birth'] = dob.text;

                    LogInResponse p = await getToken("login", body: map);

                    print(p.token);
                    token.setToken=p.token;
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
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: GestureDetector(
                onTap: () {
                  Navigator.push(context, SlideLeftRoute(page: SignUp()));
                },
                child: Text(
                  'Creat your account',
                  style: TextStyle(
                    fontSize: 15,
                    color: Colors.white,
                    decoration: TextDecoration.underline,
                  ),
                ),
              ),
            ),
            SizedBox(height: 100)
          ],
        ),
        // This trailing comma makes auto-formatting nicer for build methods.
      ),
      backgroundColor: Colors.amber[800],
    );
  }

  void showUser(BuildContext context) async{
    UserResponse userResponse= await getUser("profile",token.getToken);
    Navigator.pushReplacement(context, SlideLeftRoute(page: HomePage(userResponse: userResponse)));
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



