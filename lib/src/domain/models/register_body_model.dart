// To parse this JSON data, do
//
//     final temperatures = temperaturesFromJson(jsonString);

import 'dart:convert';

RegisterBodyModel temperaturesFromJson(String str) => RegisterBodyModel.fromJson(json.decode(str));

String temperaturesToJson(RegisterBodyModel data) => json.encode(data.toJson());

class RegisterBodyModel {
  String firstname;
  String lastname;
  String phone;
  String password;

  RegisterBodyModel({
    required this.firstname,
    required this.lastname,
    required this.phone,
    required this.password,
  });

  RegisterBodyModel copyWith({
    String? firstname,
    String? lastname,
    String? phone,
    String? password,
  }) =>
      RegisterBodyModel(
        firstname: firstname ?? this.firstname,
        lastname: lastname ?? this.lastname,
        phone: phone ?? this.phone,
        password: password ?? this.password,
      );

  factory RegisterBodyModel.fromJson(Map<String, dynamic> json) => RegisterBodyModel(
    firstname: json["firstname"],
    lastname: json["lastname"],
    phone: json["phone"],
    password: json["password"],
  );

  Map<String, dynamic> toJson() => {
    "firstname": firstname,
    "lastname": lastname,
    "phone": phone,
    "password": password,
  };
}
