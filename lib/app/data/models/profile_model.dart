// To parse this JSON data, do
//
//     final profileModel = profileModelFromJson(jsonString);

import 'dart:convert';

ProfileModel profileModelFromJson(String str) =>
    ProfileModel.fromJson(json.decode(str));

String profileModelToJson(ProfileModel data) => json.encode(data.toJson());

class ProfileModel {
  ProfileModel({
    this.name,
    this.email,
    this.nik,
    this.birth,
    this.gender,
    this.phoneNumber,
    this.address,
    this.department,
  });

  String? name;
  String? email;
  String? nik;
  String? birth;
  String? gender;
  String? phoneNumber;
  String? address;
  String? department;

  factory ProfileModel.fromJson(Map<String, dynamic>? json) => ProfileModel(
        name: json?["name"],
        email: json?["email"],
        nik: json?["nik"],
        birth: json?["birth"],
        gender: json?["gender"],
        phoneNumber: json?["phone_number"],
        address: json?["address"],
        department: json?["department"],
      );

  Map<String, dynamic> toJson() => {
        "name": name,
        "email": email,
        "nik": nik,
        "birth": birth,
        "gender": gender,
        "phone_number": phoneNumber,
        "address": address,
        "department": department,
      };
}
