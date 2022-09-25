// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:task_bot/screens/login/onboard_second.dart';
import 'package:task_bot/widgets/buttons.dart';
import 'package:task_bot/widgets/onboardtext.dart';

class OnboardScreen extends StatelessWidget {
  const OnboardScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        color: Color(0xFFA771DC),
        child: Column(
          children: [
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.135,
            ),
            Expanded(
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 25, vertical: 24),
                width: MediaQuery.of(context).size.width,
                // height: MediaQuery.of(context).size.height * 0.91,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(
                    topRight: Radius.circular(30),
                    topLeft: Radius.circular(30),
                  ),
                  color: Color(0xFFF9F9F9),
                ),
                child: Column(
                  children: [
                    Text(
                      "Welcome to",
                      style: TextStyle(
                          color: Color(0xFF16163F),
                          fontSize: 25,
                          fontWeight: FontWeight.w900),
                    ),
                    Image(
                      width: 160,
                      height: 45,
                      fit: BoxFit.contain,
                      image: AssetImage("assets/Group 46.png"),
                      color: Color(0xFF8030D0),
                    ),
                    SizedBox(
                      height: 60,
                    ),
                    OnboardText(
                      icon: "assets/add_task.png",
                      title: "Create a task",
                      description:
                          "You can pen down your tasks and be reminded about them",
                    ),
                    OnboardText(
                        icon: "assets/delete.png",
                        title: "Edit and delete tasks",
                        description:
                            "Be asssured you can edit your tasks and delete when you are done"),
                    OnboardText(
                        icon: "assets/people.png",
                        title: "Collaborate within your team",
                        description:
                            "Get your team together and collaborate on a task"),
                    GestureDetector(
                      onTap: () async {
                        final prefs = await SharedPreferences.getInstance();
                        prefs.setBool("showLogin", true);
                        Navigator.pushReplacement(
                            (context),
                            MaterialPageRoute(
                                builder: (context) => SecondOnboard()));
                      },
                      child: PurpleLargeButton(
                        text: "Get started",
                      ),
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
