import 'package:flutter/material.dart';

header(context , {bool isApptitle = false , String titleText}) {
  return AppBar(
    automaticallyImplyLeading: false,
    title: isApptitle ? Text("Flutter demo",
    style: TextStyle(color: Colors.white,
    fontFamily: isApptitle ? "Signatra" : "" ,
    fontSize: isApptitle ? 50.0 : 20.0),
    ) : Text(titleText),
    centerTitle: true,
    backgroundColor: Theme.of(context).accentColor,
  );
}
