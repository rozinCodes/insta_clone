import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:insta_clone/widgets/progress.dart';

final userRef = FirebaseFirestore.instance.collection("Users");

class Timeline extends StatefulWidget {
  @override
  _TimelineState createState() => _TimelineState();
}

class _TimelineState extends State<Timeline> {
  List<dynamic> users = [];

  @override
  void initState() {
    // TODO: implement initState
    // getUsers();
    // createUSer();
    // updateUSer();
    deleteUser();
    super.initState();
  }

  //Todo: get all user details
  getUsers() async {
    final QuerySnapshot snapshot = await userRef.get();
    // doc.docs.forEach((element){
    //   print(element.data());
    // });
    setState(() {
      users = snapshot.docs;
    });
  }

  //Todo: get user details base on their id
  getUserById() async {
    String id = "tXS2Zl1UVuOciLaX6DPr";
    final DocumentSnapshot doc = await userRef.doc(id).get();
    print(doc.data());
  }

  createUSer()
  {
    userRef.doc("ffer2345234").set({
      "User Name": "Farisha",
      "Age": 25,
      "isAdmin": false,
     "postsCount": 5,
    });
  }

  updateUSer() async
  {
   final doc = await userRef.doc("tXS2Zl1UVuOciLaX6DPr").get();
    if(doc.exists){
      doc.reference.update({
        "User Name": "Tony Stark"
      });
    }
  }

  deleteUser() async {
    final doc = await userRef.doc("ffer2345234").get();
    if(doc.exists){
      doc.reference.delete();
    }
  }

  @override
  Widget build(context) {
    return StreamBuilder<QuerySnapshot>(
      stream: userRef.snapshots(),
      builder: (context, snapshot){
        if(!snapshot.hasData){
          return circularProgress();
        }
        final children = snapshot.data.docs.map((e) => Text(e["User Name"])).toList();
        return Container(
          child: ListView(
            children: children,
          ),
        );
      },
    );
  }
}
