// To parse this JSON data, do
//
//     final temperatures = temperaturesFromJson(jsonString);

import 'dart:convert';

LoginBodyModel temperaturesFromJson(String str) => LoginBodyModel.fromJson(json.decode(str));

String temperaturesToJson(LoginBodyModel data) => json.encode(data.toJson());

class LoginBodyModel {
  String firstname;
  String password;

  LoginBodyModel({
    required this.firstname,
    required this.password,
  });

  LoginBodyModel copyWith({
    String? firstname,
    String? password,
  }) =>
      LoginBodyModel(
        firstname: firstname ?? this.firstname,
        password: password ?? this.password,
      );

  factory LoginBodyModel.fromJson(Map<String, dynamic> json) => LoginBodyModel(
    firstname: json["firstname"],
    password: json["password"],
  );

  Map<String, dynamic> toJson() => {
    "firstname": firstname,
    "password": password,
  };
}
