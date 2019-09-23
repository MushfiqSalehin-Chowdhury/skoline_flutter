import 'package:flutter/material.dart';

// Define a custom Form widget.
class SignUp extends StatefulWidget {
  @override
  _MyCustomFormState createState() => _MyCustomFormState();
}

// Define a corresponding State class.
// This class holds data related to the form.
class _MyCustomFormState extends State<SignUp> {
  // Define the focus node. To manage the lifecycle, create the FocusNode in
  // the initState method, and clean it up in the dispose method.

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('SignUp page'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(30.0),
        child: Column(
          children: [
            // The first text field is focused on as soon as the app starts.
            TextFormField(
              decoration:
                  InputDecoration(labelText: 'Enter your username'),
              keyboardType: TextInputType.text,
            ),
            TextFormField(
              decoration:
                  InputDecoration(labelText: 'Enter your full name'),
              keyboardType: TextInputType.text,
            ),
            TextFormField(
              decoration:
              InputDecoration(labelText: 'Enter your phone number'),
              keyboardType: TextInputType.number,
            ),
            TextFormField(
              decoration:
              InputDecoration(labelText: 'Enter your enter your date of birth'),
              keyboardType: TextInputType.datetime,

            ),
            // The second text field is focused on when a user taps the
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: FlatButton(
                  color: Colors.blueAccent,
                  onPressed: () {},
                  child: Text(
                    "Sign Up",
                    style: TextStyle(color: Colors.white),
                  )),
            ),
          ],
        ),
        // This trailing comma makes auto-formatting nicer for build methods.
      ),
    );
  }
}
