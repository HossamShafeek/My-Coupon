import 'package:cloud_firestore/cloud_firestore.dart';

class AuthenticationModel {
  final String uid;
  final String email;
  final String firstName;
  final String lastName;
  final Timestamp createAt;

  const AuthenticationModel({
    required this.uid,
    required this.email,
    required this.firstName,
    required this.lastName,
    required this.createAt,
  });

factory AuthenticationModel.fromJson(Map<String, dynamic> json) =>
    AuthenticationModel(
      uid: json['uid'] as String,
      email: json['email'] as String,
      firstName: json['first_name'] as String,
      lastName: json['last_name'] as String,
      createAt: json['create_at'] as Timestamp,
    );

  Map<String, dynamic> toJson() => {
    'uid': uid,
    'email': email,
    'first_name': firstName,
    'last_name': lastName,
    'create_at': createAt,
  };

}
