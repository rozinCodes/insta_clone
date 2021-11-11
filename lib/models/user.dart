import 'package:cloud_firestore/cloud_firestore.dart';

class User {
  final String email;
  final String id;
  final String photoUrl;
  final String userName;

  User({
    this.email,
    this.id,
    this.photoUrl,
    this.userName
});

  factory User.fromDocument(DocumentSnapshot doc){
    return User(
      email: doc["email"],
      id: doc["id"],
      photoUrl: doc["photoUrl"],
      userName: doc["userName"],
    );
  }
}
