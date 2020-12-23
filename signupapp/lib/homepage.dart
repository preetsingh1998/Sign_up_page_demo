import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  final String name, email, mobile, collegename, password;

  HomePage({
    Key key,
    @required this.name,
    this.email,
    this.mobile,
    this.collegename,
    this.password,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.amber,
      appBar: AppBar(
        title: Text("Welcome $name"),
        centerTitle: true,
      ),
      body: Form(
        child: Card(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15.0),
            ),
            child: Column(
              children: [
                Padding(
                  padding: EdgeInsets.all(50.0),
                ),
                Image(
                  image: AssetImage("img/logo.png"),
                  width: 100.0,
                  height: 100.0,
                ),
                Padding(
                  padding: EdgeInsets.all(10.0),
                ),
                ListTile(
                  leading: Icon(Icons.verified_user),
                  title: Text(name),
                ),
                ListTile(
                  leading: Icon(Icons.email_outlined),
                  title: Text(email),
                ),
                ListTile(
                  leading: Icon(Icons.lock_open),
                  title: Text(password),
                ),
                ListTile(
                  leading: Icon(Icons.phone_iphone),
                  title: Text(mobile),
                ),
                ListTile(
                  leading: Icon(Icons.school),
                  title: Text(collegename),
                ),
              ],
            )),
      ),
    );
  }
}
