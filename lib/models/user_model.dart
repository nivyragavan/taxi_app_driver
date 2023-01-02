import 'package:firebase_database/firebase_database.dart';

class UserModel {
  String? phone;
  String? name;
  String? id;
  String? email;

  UserModel({
    this.phone,
    this.name,
    this.id,
    this.email,
  });

  UserModel.fromSnapshot(DatabaseEvent snap) {
    phone = (snap.snapshot as dynamic)["phone"];
    name = (snap.snapshot as dynamic)["name"];
    id = snap.previousChildKey;
    email = (snap.snapshot as dynamic)["email"];
  }
}
