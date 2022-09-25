// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:task_bot/widgets/drawer_items.dart';

class DrawerPage extends StatefulWidget {
  const DrawerPage({Key? key}) : super(key: key);

  @override
  State<DrawerPage> createState() => _DrawerPageState();
}

class _DrawerPageState extends State<DrawerPage> {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: SafeArea(
        child: Container(
          padding: EdgeInsets.only(right: 30, left: 30, top: 40),
          child: Column(
            children: [
              Row(
                children: [
                  Container(
                    padding: EdgeInsets.all(1),
                    width: 25,
                    height: 25,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      border: Border.all(
                        color: Color(0xFF8030D0),
                        width: 2,
                      ),
                    ),
                    child: GestureDetector(
                      onTap: () {
                        Get.back();
                      },
                      child: Icon(
                        Icons.arrow_back,
                        size: 18,
                        color: Color(0xFF8030D0),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 30.0),
                    child: Text(
                      "MENU",
                      style:
                          TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
                    ),
                  )
                ],
              ),
              SizedBox(
                height: 70,
              ),
              DrawerItem(
                icon: Icons.portrait_rounded,
                title: "Account",
              ),
              DrawerItem(
                icon: Icons.language_rounded,
                title: "Language",
              ),
              DrawerItem(
                icon: Icons.format_size_rounded,
                title: "Text size",
              ),
              DrawerItem(
                icon: Icons.colorize_rounded,
                title: "Color Scheme",
              ),
              DrawerItem(
                icon: Icons.quiz_outlined,
                title: "Faq",
              ),
              DrawerItem(
                icon: Icons.settings,
                title: "Settings",
              ),
              LogoutItem(),
            ],
          ),
        ),
      ),
    );
  }
}
