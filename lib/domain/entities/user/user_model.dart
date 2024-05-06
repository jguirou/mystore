import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';
import 'package:mystore/utils/formatters/formatter.dart';

class UserModel {
   UserModel({
    required this.id,
    required this.firstName,
    required this.lastName,
    required this.username,
    required this.email,
    required this.phoneNumber,
    required this.profilePicture,
  });

  final String id;
   String firstName;
   String lastName;
  final String username;
  final String email;
   String phoneNumber;
   String profilePicture;


   String get fullName => '$firstName $lastName';

   String get formattedPhoneNo => Formatter.formatPhoneNumber(phoneNumber);
   static List<String> nameParts(fullName) => fullName.split(" ");
   static generateUserName(fullName) {
     List<String> nameParts = fullName.split(" ");
     String firstName = nameParts[0].toLowerCase();
     String lastName = nameParts.length > 1 ? nameParts[0].toLowerCase(): "";

     String camelCaseUserName = "$firstName$lastName";
     String userNameWithPrefix = "cwt_$camelCaseUserName";
     return userNameWithPrefix;
   }

   static UserModel empty () => UserModel(id: '', firstName: '', lastName: '', username: '', email: '', phoneNumber: '', profilePicture: '');
  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      id: json['id'] ?? '',
      firstName: json['firstName'] ?? '',
      lastName: json['lastName'] ?? '',
      username: json['username'] ?? '',
      email: json['email'] ?? '',
      phoneNumber: json['phoneNumber'] ?? '',
      profilePicture: json['profilePicture'] ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'firstName': firstName,
      'lastName': lastName,
      'username': username,
      'email': email,
      'phoneNumber': phoneNumber,
      'profilePicture': profilePicture,
    };
  }

   factory UserModel.fromSnapshot(DocumentSnapshot<Map<String, dynamic>> document) {

     if (document.data == null) {
       throw Exception('DocumentSnapshot does not contain data');
     }
     final data = document.data()!;

     return UserModel(
       id: document.id,
       firstName: data['firstName'] ?? '',
       lastName: data['lastName'] ?? '',
       username: data['username'] ?? '',
       email: data['email'] ?? '',
       phoneNumber: data['phoneNumber'] ?? '',
       profilePicture: data['profilePicture'] ?? '',
     );
   }
}
