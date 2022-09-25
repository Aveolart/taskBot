// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

class OnboardText extends StatelessWidget {
  final String icon;
  final String title;
  final String description;

  const OnboardText(
      {Key? key,
      required this.icon,
      required this.title,
      required this.description})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 40),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Image.asset(
            color: Colors.black,
            icon,
            width: 20,
            height: 20,
          ),
          Container(
            margin: EdgeInsets.only(left: 15),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.only(bottom: 6.0),
                  child: Text(
                    title,
                    style: TextStyle(fontWeight: FontWeight.w800, fontSize: 16),
                  ),
                ),
                SizedBox(
                  width: MediaQuery.of(context).size.width - 100,
                  child: Text(
                    description,
                    style: TextStyle(fontWeight: FontWeight.w500, fontSize: 15),
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
