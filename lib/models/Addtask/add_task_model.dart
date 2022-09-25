// To parse this JSON data, do
//
//     final addTaskResponse = addTaskResponseFromJson(jsonString);

import 'dart:convert';

class AddTaskResponse {
  AddTaskResponse({
    required this.note,
  });

  Note note;

  factory AddTaskResponse.fromRawJson(String str) =>
      AddTaskResponse.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory AddTaskResponse.fromJson(Map<String, dynamic> json) =>
      AddTaskResponse(
        note: Note.fromJson(json["note"]),
      );

  Map<String, dynamic> toJson() => {
        "note": note.toJson(),
      };
}

class Note {
  Note({
    required this.id,
    required this.description,
    required this.title,
    required this.createdBy,
    required this.createdAt,
    required this.updatedAt,
    required this.v,
  });

  String id;
  String description;
  String title;
  String createdBy;
  DateTime createdAt;
  DateTime updatedAt;
  int v;

  factory Note.fromRawJson(String str) => Note.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Note.fromJson(Map<String, dynamic> json) => Note(
        id: json["_id"],
        description: json["description"],
        title: json["title"],
        createdBy: json["createdBy"],
        createdAt: DateTime.parse(json["createdAt"]),
        updatedAt: DateTime.parse(json["updatedAt"]),
        v: json["__v"],
      );

  Map<String, dynamic> toJson() => {
        "_id": id,
        "description": description,
        "title": title,
        "createdBy": createdBy,
        "createdAt": createdAt.toIso8601String(),
        "updatedAt": updatedAt.toIso8601String(),
        "__v": v,
      };
}
