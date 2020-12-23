import 'package:flutter/material.dart';
import "string_extension.dart";

import 'homepage.dart';

class Signup extends StatefulWidget {
  Signup({Key key}) : super(key: key);

  @override
  _SignupState createState() => _SignupState();
}

class _SignupState extends State<Signup> {
  GlobalKey<FormState> _key = new GlobalKey();
  bool _autoValidate = false;
  String name, email, mobile, collegename, password;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("SignUp"),
        centerTitle: true,
      ),
      backgroundColor: Colors.amber,
      body: Center(
        child: SingleChildScrollView(
          child: Form(
            key: _key,
            child: Card(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15.0),
              ),
              child: Column(
                children: [
                  Padding(
                    padding: EdgeInsets.all(10.0),
                  ),
                  Image(
                    image: AssetImage("img/logo.png"),
                    height: 100.0,
                    width: 100.0,
                  ),
                  ListTile(
                    leading: Icon(Icons.supervised_user_circle),
                    title: TextFormField(
                      // ignore: missing_return
                      validator: (input) {
                        if (input.isEmpty) {
                          return 'Enter Name';
                        }
                      },
                      decoration: InputDecoration(
                        labelText: 'Name',
                      ),
                      onSaved: (input) => name = input.capitalize(),
                    ),
                  ),
                  ListTile(
                    leading: Icon(Icons.email),
                    title: TextFormField(
                      // ignore: missing_return
                      validator: (input) {
                        if (input.isEmpty || !input.contains('.com')) {
                          return 'Enter Email';
                        }
                      },
                      decoration: InputDecoration(
                        labelText: 'Email',
                      ),
                      onSaved: (input) => email = input,
                    ),
                  ),
                  ListTile(
                    leading: Icon(Icons.phone),
                    title: TextFormField(
                      obscureText: true,
                      // ignore: missing_return
                      validator: (input) {
                        if (input.isEmpty) {
                          return 'Enter Password';
                        }
                      },
                      decoration: InputDecoration(
                        labelText: 'Password',
                      ),
                      onSaved: (input) => password = input,
                    ),
                  ),
                  ListTile(
                    leading: Icon(Icons.phone),
                    title: TextFormField(
                      // ignore: missing_return
                      validator: (input) {
                        if (input.isEmpty || input.length < 10) {
                          return 'Enter MobileNo';
                        }
                      },
                      decoration: InputDecoration(
                        labelText: 'Mobile Number',
                      ),
                      onSaved: (input) => mobile = ("+1 (" +
                          input.substring(0, 3) +
                          ") - " +
                          input.substring(3, 6) +
                          " - " +
                          input.substring(6, 10)),
                    ),
                  ),
                  ListTile(
                    leading: Icon(Icons.school),
                    title: TextFormField(
                      // ignore: missing_return
                      validator: (input) {
                        if (input.isEmpty) {
                          return 'Enter CollegeName';
                        }
                      },
                      decoration: InputDecoration(
                        labelText: 'College Name',
                      ),
                      onSaved: (input) => collegename = input.toUpperCase(),
                    ),
                  ),
                  SizedBox(
                    height: 20.0,
                  ),
                  ButtonTheme(
                    height: 40.0,
                    minWidth: 200.0,
                    child: RaisedButton(
                      color: Colors.redAccent,
                      onPressed: _sendToNextScreen,
                      child: Text(
                        "Save",
                        style: TextStyle(color: Colors.white),
                      ),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10.0)),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.all(10.0),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  _sendToNextScreen() {
    if (_key.currentState.validate()) {
      _key.currentState.save();
      Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) => HomePage(
                    name: name,
                    email: email,
                    mobile: mobile,
                    collegename: collegename,
                    password: password,
                  )));
    } else {
      setState(() {
        _autoValidate = true;
      });
    }
  }
}
