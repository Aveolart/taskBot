// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:task_bot/screens/login/loginpage.dart';
import 'package:task_bot/screens/login/sign_up.dart';
import 'package:task_bot/widgets/buttons.dart';
import 'package:get/get.dart';

class SecondOnboard extends StatelessWidget {
  const SecondOnboard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Color(0xFFFFFFFF),
        padding: EdgeInsets.only(top: 60, left: 30, right: 30, bottom: 10),
        child: Column(
          children: [
            Image(
              image: AssetImage("assets/illustration.png"),
            ),
            SizedBox(
              height: 20,
            ),
            Image(
              image: AssetImage("assets/create_organize.png"),
            ),
            InkWell(
              onTap: () {
                Get.to(() => SignUpScreen(),
                    transition: Transition.fadeIn,
                    duration: Duration(milliseconds: 500));
              },
              child: PurpleLargeButton(
                text: "Create an account",
              ),
            ),
            Container(
              margin: EdgeInsets.only(top: 10),
              height: 60,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: Color(0xFFE6D6F6),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image(
                    width: 16,
                    image: AssetImage("assets/image 7.png"),
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Image(
                    width: 180,
                    // height: ,
                    image: AssetImage("assets/Continue with Google.png"),
                  )
                ],
              ),
            ),
            Container(
              padding: EdgeInsets.only(top: 30),
              child: InkWell(
                onTap: () {
                  Get.to(() => LoginPage(),
                      transition: Transition.fadeIn,
                      duration: Duration(milliseconds: 500));
                },
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Already have an account?  ",
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 18,
                          color: Color(0xFF16163F)),
                    ),
                    Text(
                      "Log in",
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 18,
                          color: Color(0xFF8030D0)),
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
