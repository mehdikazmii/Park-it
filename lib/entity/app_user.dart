import 'package:cloud_firestore/cloud_firestore.dart';

class AppUser {
  String? id;
  String? username;
  String? city;
  String? email;
  String? number;

  AppUser(
      {required this.id,
      required this.username,
      required this.city,
      required this.email,
      required this.number});

  AppUser.fromSnapshot(DocumentSnapshot snapshot) {
    id = snapshot['id'];
    username = snapshot['name'];
    email = snapshot['email'];
    city = snapshot['city'];
    number = snapshot['number'];
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'name': username,
      'email': email,
      'city': city,
      'number': number,
    };
  }
}
