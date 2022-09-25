// To parse this JSON data, do
//
//     final signupGetResponse = signupGetResponseFromJson(jsonString);

import 'dart:convert';

class SignupGetResponse {
  SignupGetResponse({
    required this.status,
    required this.token,
    required this.data,
  });

  String status;
  String token;
  Data data;

  factory SignupGetResponse.fromRawJson(String str) =>
      SignupGetResponse.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory SignupGetResponse.fromJson(Map<String, dynamic> json) =>
      SignupGetResponse(
        status: json["status"],
        token: json["token"],
        data: Data.fromJson(json["data"]),
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "token": token,
        "data": data.toJson(),
      };
}

class Data {
  Data({
    required this.user,
  });

  User user;

  factory Data.fromRawJson(String str) => Data.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        user: User.fromJson(json["user"]),
      );

  Map<String, dynamic> toJson() => {
        "user": user.toJson(),
      };
}

class User {
  User({
    required this.id,
    required this.fullName,
    required this.userName,
    required this.email,
    required this.gender,
    required this.v,
  });

  String id;
  String fullName;
  String userName;
  String email;
  String gender;
  int v;

  factory User.fromRawJson(String str) => User.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory User.fromJson(Map<String, dynamic> json) => User(
        id: json["_id"],
        fullName: json["fullName"],
        userName: json["userName"],
        email: json["email"],
        gender: json["gender"],
        v: json["__v"],
      );

  Map<String, dynamic> toJson() => {
        "_id": id,
        "fullName": fullName,
        "userName": userName,
        "email": email,
        "gender": gender,
        "__v": v,
      };
}
