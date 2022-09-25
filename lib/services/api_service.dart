// ignore_for_file: avoid_print, body_might_complete_normally_nullable

import 'dart:convert';
import 'dart:io';

import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:task_bot/models/Addtask/add_task_model.dart';
import 'package:task_bot/models/Addtask/alltask_model.dart';

import 'package:task_bot/models/LoginModel/login_response.dart';
import 'package:task_bot/models/Logout/logout_model.dart';
import 'package:task_bot/models/signupModel/signup_get_response.dart';

import 'package:task_bot/services/helper_dialog.dart';

// const baseUrl = "https://task-bot-api.herokuapp.com/api/v1/users/";

class ApiCalls {
  Future signUp(String fullName, String username, String email, String gender,
      String password, String confirmPass, String errorMail) async {
    try {
      final url =
          Uri.parse("https://task-bot-api.herokuapp.com/api/v1/users/signup");
      final response = await http.post(url,
          headers: {'Content-Type': 'application/json'},
          body: json.encode({
            "fullName": fullName,
            "userName": username,
            "email": email,
            "gender": gender,
            "password": password,
            "passwordConfirm": confirmPass
          }));
      if (response.statusCode == 200) {
        Get.back();
        print("Registration Complete");
        DialogHelper.signUpSuccess();
        var body = jsonDecode(response.body);
        return SignupGetResponse.fromJson(body);
      } else if (response.statusCode == 500) {
        Get.back();
        print(response.statusCode);
        return DialogHelper.userEmailExistError();
        // print(response.body);
        // var userError = jsonDecode(response.body);
        // // print(userError);
        // print(userError["message"]);
        // if (userError["message"].toString() ==
        //     "E11000 duplicate key error collection: TodoListTeam1.users index: email_1 dup key: { email: \"$errorMail\" }") {
        //   print("Yes");
        // } else {
        //   print("no");
        //   print(errorMail);
        // }
        // if (userError["status"].toString() == "error") {
        //   print("Yes");
        // } else {
        //   print("no");
        // }
      } else {
        Get.back();
        print(response.statusCode);
      }
      return response.statusCode;
    } catch (e) {
      print(e.toString());
    }
  }

  Future login(String emailAdress, String password) async {
    try {
      var url =
          Uri.parse("https://task-bot-api.herokuapp.com/api/v1/users/login");
      var response = await http.post(url,
          headers: {'Content-Type': 'application/json'},
          body: json.encode({"email": emailAdress, "password": password}));
      if (response.statusCode == 200) {
        var nbody = jsonDecode(response.body);
        // print(nbody);
        return LoginResponseModel.fromJson(nbody);
      } else {
        // Map error = jsonDecode(response.body);
        print(response.statusCode);
        Get.back();
        print(response.statusCode);
        return DialogHelper.showErroDialog();
        // print("The error is " + error["message"]);
      }
    } catch (e) {
      Get.back();
      print(e);
      return DialogHelper.showNetworkDialog();
      // print("internet");

    }
    // return response.statusCode;
  }

  Future addTask(String title, String details, String? token) async {
    try {
      var url = Uri.parse(
          "https://task-bot-api.herokuapp.com/api/v1/notes/createNote");
      var response = await http.post(url,
          headers: {
            'Content-Type': 'application/json',
            'Authorization': 'Bearer $token'
          },
          body: json.encode({"title": title, "description": details}));
      if (response.statusCode == 200) {
        var nbody = jsonDecode(response.body);
        // print(nbody);
        return AddTaskResponse.fromJson(nbody);
      } else if (response.statusCode == 201) {
        var nbody = jsonDecode(response.body);
        // print(nbody);
        return AddTaskResponse.fromJson(nbody);
      } else {
        // Map error = jsonDecode(response.body);
        // print(response.statusCode);
        print(jsonDecode(response.body));
        Get.back();
        return DialogHelper.addTaskErroe();
        // print("The error is " + error["message"]);
      }
    } catch (e) {
      Get.back();
      print(e);
      return DialogHelper.showNetworkDialog();
      // print("internet");

    }
    // return response.statusCode;
  }

  //GetTAsk Api
  Future<GetTaskModel?> getAllTAsk(String? token) async {
    try {
      // final token =
      //     "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6IjYzMmVlZmQ5MDAwYWYyMDAyMzMzZWRjZCIsImlhdCI6MTY2NDA3MTM3MiwiZXhwIjoxNjY0MTU3NzcyfQ.IiSWY2QRh778SaV7GCCbdv8zq8o11O4MslwuL5BA7W8";
      final url = Uri.parse(
          "https://task-bot-api.herokuapp.com/api/v1/notes/getAllNotes");
      final response = await http.get(
        url,
        headers: {
          'Content-Type': 'application/json',
          'Authorization': 'Bearer $token'
        },
      );
      print(response.statusCode);
      if (response.statusCode == 200) {
        var successful = jsonDecode(response.body);
        print(successful);
        return GetTaskModel.fromJson(successful);
      } else {
        DialogHelper.logoutError();
      }
      var res = jsonDecode(response.body);
      print(res["message"]);
      // return EmailHistoryResponse.fromJson(res);
      // }
    } on SocketException {
      throw "No internet connection";
    } catch (e) {
      throw Exception(e.toString());
    }
  }

  Future signOut(String? token) async {
    try {
      // final token =
      //     "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6IjYzMmVlZmQ5MDAwYWYyMDAyMzMzZWRjZCIsImlhdCI6MTY2NDA3MTM3MiwiZXhwIjoxNjY0MTU3NzcyfQ.IiSWY2QRh778SaV7GCCbdv8zq8o11O4MslwuL5BA7W8";
      final url =
          Uri.parse("https://task-bot-api.herokuapp.com/api/v1/users/logout");
      final response = await http.get(
        url,
        headers: {
          'Content-Type': 'application/json',
          'Authorization': 'Bearer $token'
        },
      );
      // print(response.statusCode);
      if (response.statusCode == 200) {
        var successful = jsonDecode(response.body);
        // print(successful);
        return LogOut.fromJson(successful);
      } else {
        DialogHelper.logoutError();
      }
      var res = jsonDecode(response.body);
      print(res["message"]);
      // return EmailHistoryResponse.fromJson(res);
      // }
    } on SocketException {
      throw "No internet connection";
    } catch (e) {
      throw Exception(e.toString());
    }
  }
}
