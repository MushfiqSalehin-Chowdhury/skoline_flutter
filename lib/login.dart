import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:skoline/responseData/UserResponse.dart';
import 'package:skoline/responseData/LogInResponse.dart';
import 'signUp.dart';
import 'homePage.dart';
import 'package:skoline/networkCalls/AllHttpNetworkCalls.dart';
import 'package:skoline/SharedData/Token.dart';




// Define a custom Form widget.
class Login extends StatefulWidget {
  @override
  _MyCustomFormState createState() => _MyCustomFormState();
}

// Define a corresponding State class.
// This class holds data related to the form.
class _MyCustomFormState extends State<Login> {

  TextEditingController userName= new TextEditingController();
  TextEditingController dob= new TextEditingController();
  Token token=new Token();

  Future<LogInResponse> loginData;
  Future<UserResponse> userData;

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
                  onPressed: () {
                    FutureBuilder<LogInResponse>(
                      future:loginData=getToken("login", userName.text, dob.text),
                      builder: (context, snapshot) {
                        if (snapshot.hasData) {
                          showUser();
                          token.setToken(snapshot.data.token);
                        } else if (snapshot.hasError) {
                          return Text("${snapshot.error}");
                        }
                        // By default, show a loading spinner.
                        return CircularProgressIndicator();
                      },
                    );
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

  void showUser() {

    FutureBuilder<UserResponse>(
      future: userData=getUser("profile",token.getToken),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          Navigator.pushReplacement(context, SlideLeftRoute(page: HomePage(text: snapshot.data.user.uniqueName,)));
        } else if (snapshot.hasError) {
          return Text("${snapshot.error}");
        }
        // By default, show a loading spinner.
        return CircularProgressIndicator();
      },
    );

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



