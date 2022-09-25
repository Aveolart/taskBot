// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:task_bot/screens/login/loginpage.dart';
import 'package:task_bot/services/api_service.dart';
import 'package:task_bot/services/helper_dialog.dart';

class DrawerItem extends StatelessWidget {
  final IconData icon;
  final String title;
  const DrawerItem({Key? key, required this.icon, required this.title})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(15),
      margin: EdgeInsets.only(bottom: 25),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(8),
        boxShadow: [
          BoxShadow(
            blurRadius: 3,
            spreadRadius: 1,
            color: Colors.grey.shade300,
          ),
        ],
        // border: Border.all(),
      ),
      child: Row(
        children: [
          Icon(
            icon,
            color: Color(0xFF8030D0),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 20),
            child: Text(
              title,
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w500,
                color: Color(0xFF16163F),
              ),
            ),
          )
        ],
      ),
    );
  }
}

class LogoutItem extends StatelessWidget {
  const LogoutItem({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    logginOut(var token) async {
      var out = await ApiCalls().signOut(tok);
      if (out != null) {
        Get.offAll(() => LoginPage());
        // print(out.toString());
        // Navigator.pushAndRemoveUntil<dynamic>(
        //   context,
        //   MaterialPageRoute<dynamic>(
        //     builder: (BuildContext context) => LoginPage(),
        //   ),
        //   (route) => false,
        // );
      }
    }

    return GestureDetector(
      onTap: () async {
        debugPrint("Logout");
        DialogHelper.showLoadingSignOut();
        await logginOut(tok);
        // await ApiCalls().signOut(tok);
        // print(loggedIn?.token);
        // print(tok);
        // print(token);
      },
      child: Container(
        padding: EdgeInsets.all(15),
        margin: EdgeInsets.only(bottom: 25),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(8),
          boxShadow: [
            BoxShadow(
              blurRadius: 3,
              spreadRadius: 1,
              color: Colors.grey.shade300,
            ),
          ],
          // border: Border.all(),
        ),
        child: Row(
          children: [
            Icon(
              Icons.logout,
              color: Color(0xFFC70505),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 20),
              child: Text(
                "Logout",
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w500,
                  color: Color(0xFFC70505),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
