// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:task_bot/screens/login/onboard.dart';
import 'package:task_bot/screens/login/onboard_second.dart';


void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final prefs = await SharedPreferences.getInstance();
  final showLogin = prefs.getBool("showLogin") ?? false;
  runApp(MainApp(showLogin: showLogin));
}

class MainApp extends StatelessWidget {
  final bool showLogin;
  const MainApp({Key? key, required this.showLogin}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      // theme: ThemeData(
      //   textTheme: GoogleFonts.interTextTheme(
      //     Theme.of(context).textTheme,
      //   ),
      // ),

      debugShowCheckedModeBanner: false,
      // home: const Mainpage(),
      home: showLogin ? SecondOnboard() : OnboardScreen(),
    );
  }
}
