import 'dart:async';

import 'package:flutter/material.dart';
import 'package:insta_clone/widgets/header.dart';

class CreateAccount extends StatefulWidget {
  @override
  _CreateAccountState createState() => _CreateAccountState();
}

class _CreateAccountState extends State<CreateAccount> {
  final _formKey = GlobalKey<FormState>();
  String username;

  onTap()  {
    final form = _formKey.currentState;
    if (form.validate()) {
      form.save();
      Timer(Duration(seconds: 2), () {
        Navigator.pop(context, username);
      });
    }
  }

  @override
  Widget build(BuildContext parentContext) {
    return Scaffold(
      appBar: header(context, titleText: "Create user Profile"),
      body: ListView(
        children: <Widget>[
          Column(
            children: [
              Padding(
                padding: EdgeInsets.only(top: 20.0),
                child: Container(
                  child: Text("Profile Setup"),
                ),
              ),
              Padding(
                padding: EdgeInsets.all(15.0),
                child: Form(
                  key: _formKey,
                  child: TextFormField(
                    autovalidateMode: AutovalidateMode.always,
                    validator: (val) {
                      if (val.trim().length < 4 || val.isEmpty) {
                        return "Username too short";
                      } else if (val.trim().length > 12) {
                        return "Username too long";
                      } else {
                        return null;
                      }
                    },
                    decoration: InputDecoration(
                        labelText: "Username",
                        hintText: "Enter your username",
                        border: OutlineInputBorder()),
                    onSaved: (value) => username = value,
                  ),
                ),
              ),
              Center(
                child: GestureDetector(
                  onTap: onTap,
                  child: Container(
                    height: 50.0,
                    width: 360.0,
                    child: Center(child: Text("Submit")),
                    decoration: BoxDecoration(
                        color: Colors.blue,
                        borderRadius: BorderRadius.circular(7.0)),
                  ),
                ),
              )
            ],
          ),
        ],
      ),
    );
  }
}
