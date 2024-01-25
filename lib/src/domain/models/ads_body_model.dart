// To parse this JSON data, do
//
//     final temperatures = temperaturesFromJson(jsonString);

import 'dart:convert';

AdsBodyModel temperaturesFromJson(String str) => AdsBodyModel.fromJson(json.decode(str));

String temperaturesToJson(AdsBodyModel data) => json.encode(data.toJson());

class AdsBodyModel {
  String title;
  String description;
  int lot;
  int lat;

  AdsBodyModel({
    required this.title,
    required this.description,
    required this.lot,
    required this.lat,
  });

  AdsBodyModel copyWith({
    String? title,
    String? description,
    int? lot,
    int? lat,
  }) =>
      AdsBodyModel(
        title: title ?? this.title,
        description: description ?? this.description,
        lot: lot ?? this.lot,
        lat: lat ?? this.lat,
      );

  factory AdsBodyModel.fromJson(Map<String, dynamic> json) => AdsBodyModel(
    title: json["title"],
    description: json["description"],
    lot: json["lot"],
    lat: json["lat"],
  );

  Map<String, dynamic> toJson() => {
    "title": title,
    "description": description,
    "lot": lot,
    "lat": lat,
  };
}
