// To parse this JSON data, do
//
//     final deparmentModel = deparmentModelFromJson(jsonString);

import 'dart:convert';

List<DeparmentModel> deparmentModelFromJson(String str) =>
    List<DeparmentModel>.from(
        json.decode(str).map((x) => DeparmentModel.fromJson(x)));

String deparmentModelToJson(List<DeparmentModel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class DeparmentModel {
  String name;
  int id;

  DeparmentModel({
    required this.name,
    required this.id,
  });

  factory DeparmentModel.fromJson(Map<String, dynamic> json) => DeparmentModel(
        name: json["name"],
        id: json["id"],
      );

  Map<String, dynamic> toJson() => {
        "name": name,
        "id": id,
      };
}
