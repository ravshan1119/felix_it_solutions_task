// To parse this JSON data, do
//
//     final temperatures = temperaturesFromJson(jsonString);

import 'dart:convert';

RegisterResponseModel temperaturesFromJson(String str) => RegisterResponseModel.fromJson(json.decode(str));

String temperaturesToJson(RegisterResponseModel data) => json.encode(data.toJson());

class RegisterResponseModel {
  String message;
  String accessToken;

  RegisterResponseModel({
    required this.message,
    required this.accessToken,
  });

  RegisterResponseModel copyWith({
    String? message,
    String? accessToken,
  }) =>
      RegisterResponseModel(
        message: message ?? this.message,
        accessToken: accessToken ?? this.accessToken,
      );

  factory RegisterResponseModel.fromJson(Map<String, dynamic> json) => RegisterResponseModel(
    message: json["message"],
    accessToken: json["accessToken"],
  );

  Map<String, dynamic> toJson() => {
    "message": message,
    "accessToken": accessToken,
  };
}
