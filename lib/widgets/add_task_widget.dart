// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'dart:math' as math;

class TextFieldWidget extends StatelessWidget {
  final TextEditingController textController;
  final String hintText;
  final double radius;
  final int? maxline;
  const TextFieldWidget(
      {Key? key,
      this.maxline,
      required this.textController,
      required this.hintText,
      required this.radius})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextField(
      style: TextStyle(fontSize: 17),
      maxLines: maxline,
      autofocus: false,
      controller: textController,
      // keyboardType: TextInputType.name,
      enableSuggestions: true,

      decoration: InputDecoration(
        filled: false,
        border: InputBorder.none,
        hintText: hintText,
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(radius),
          borderSide: BorderSide(color: Colors.white, width: 1),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(radius),
          borderSide: BorderSide(color: Colors.white, width: 1),
        ),
      ),
    );
  }
}

class AddNewTask extends StatelessWidget {
  final TextEditingController titleController;
  final TextEditingController detailsController;
  final VoidCallback onTap;
  const AddNewTask(
      {Key? key,
      required this.onTap,
      required this.titleController,
      required this.detailsController})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      margin: const EdgeInsets.only(top: 15),
      // height: 55,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(6),
        border: Border.all(
          color: Color((math.Random().nextDouble() * 0xFFFFFF).toInt())
              .withOpacity(1.0),
        ),
      ),
      child: Column(
        children: [
          TextFieldWidget(
            textController: titleController,
            hintText: "Add task",
            radius: 30,
            maxline: 1,
          ),
          Divider(
            endIndent: 10,
            // height: 1,
            indent: 10,
            color: Colors.black,
          ),
          TextFieldWidget(
            textController: detailsController,
            hintText: "Task details",
            radius: 20,
            maxline: 4,
          ),
          ElevatedButton(
            style: ButtonStyle(),
            onPressed: onTap,
            child: Text("Submit"),
          )
        ],
      ),
    );
  }
}
