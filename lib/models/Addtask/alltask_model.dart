// To parse this JSON data, do
//
//     final getTaskModel = getTaskModelFromJson(jsonString);

import 'dart:convert';

class GetTaskModel {
  GetTaskModel({
    required this.notes,
  });

  List<Note> notes;

  factory GetTaskModel.fromRawJson(String str) =>
      GetTaskModel.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory GetTaskModel.fromJson(Map<String, dynamic> json) => GetTaskModel(
        notes: List<Note>.from(json["notes"].map((x) => Note.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "notes": List<dynamic>.from(notes.map((x) => x.toJson())),
      };
}

class Note {
  Note({
    required this.id,
    required this.description,
    required this.title,
    required this.createdAt,
    required this.updatedAt,
    required this.v,
  });

  String id;
  String description;
  String title;
  DateTime createdAt;
  DateTime updatedAt;
  int v;

  factory Note.fromRawJson(String str) => Note.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Note.fromJson(Map<String, dynamic> json) => Note(
        id: json["_id"],
        description: json["description"],
        title: json["title"],
        createdAt: DateTime.parse(json["createdAt"]),
        updatedAt: DateTime.parse(json["updatedAt"]),
        v: json["__v"],
      );

  Map<String, dynamic> toJson() => {
        "_id": id,
        "description": description,
        "title": title,
        "createdAt": createdAt.toIso8601String(),
        "updatedAt": updatedAt.toIso8601String(),
        "__v": v,
      };
}
