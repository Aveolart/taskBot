// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:task_bot/screens/dashboard/drawer.dart';
import 'package:task_bot/screens/dashboard/ongoing_view.dart';
import 'package:task_bot/screens/dashboard/tabs.dart';
import 'package:task_bot/screens/dashboard/to_do_view.dart';


import '../completed_view.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          padding: EdgeInsets.only(left: 10, right: 20, top: 40),
          height: MediaQuery.of(context).size.height / 5.5,
          decoration: BoxDecoration(
            color: Color(0xFF8030D0),
          ),
          child: Column(
            children: [
              Row(
                children: [
                  IconButton(
                    color: Colors.white,
                    onPressed: () {
                      // DialogHelper.welcome();
                      Get.to(
                        () => DrawerPage(),
                        transition: Transition.leftToRight,
                      );
                    },
                    icon: Icon(
                      Icons.menu,
                      size: 30,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 10.0),
                    child: Image(
                      height: 40,
                      width: 110,
                      image: AssetImage("assets/Group 46.png"),
                    ),
                  ),
                  Expanded(child: Container()),
                  CircleAvatar(
                    radius: 23,
                    child: ClipOval(
                      child: Image.asset("assets/imageavatar.png"),
                    ),
                  )
                ],
              ),
              const Expanded(child: TabBarS()),
            ],
          ),
        ),
        const Expanded(
          child:
              TabBarView(children: [TodoView(), OngoingView(), CompletedTab()]),
        )
      ],
    );
  }
}
