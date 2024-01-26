// To parse this JSON data, do
//
//     final temperatures = temperaturesFromJson(jsonString);

import 'dart:convert';

AdsSaveResponseModel temperaturesFromJson(String str) => AdsSaveResponseModel.fromJson(json.decode(str));

String temperaturesToJson(AdsSaveResponseModel data) => json.encode(data.toJson());

class AdsSaveResponseModel {
  String title;
  String description;
  double lat;
  DateTime updatedAt;
  DateTime createdAt;
  int id;

  AdsSaveResponseModel({
    required this.title,
    required this.description,
    required this.lat,
    required this.updatedAt,
    required this.createdAt,
    required this.id,
  });

  AdsSaveResponseModel copyWith({
    String? title,
    String? description,
    double? lat,
    DateTime? updatedAt,
    DateTime? createdAt,
    int? id,
  }) =>
      AdsSaveResponseModel(
        title: title ?? this.title,
        description: description ?? this.description,
        lat: lat ?? this.lat,
        updatedAt: updatedAt ?? this.updatedAt,
        createdAt: createdAt ?? this.createdAt,
        id: id ?? this.id,
      );

  factory AdsSaveResponseModel.fromJson(Map<String, dynamic> json) => AdsSaveResponseModel(
    title: json["title"],
    description: json["description"],
    lat: json["lat"],
    updatedAt: DateTime.parse(json["updated_at"]),
    createdAt: DateTime.parse(json["created_at"]),
    id: json["id"],
  );

  Map<String, dynamic> toJson() => {
    "title": title,
    "description": description,
    "lat": lat,
    "updated_at": updatedAt.toIso8601String(),
    "created_at": createdAt.toIso8601String(),
    "id": id,
  };
}
