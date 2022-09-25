// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

import 'package:task_bot/screens/dashboard/widgest/events.dart';
import 'package:task_bot/screens/dashboard/widgest/grouptask.dart';
import 'package:task_bot/screens/dashboard/widgest/tasks.dart';

class TodoView extends StatefulWidget {
  const TodoView({Key? key, required}) : super(key: key);

  @override
  State<TodoView> createState() => _TodoViewState();
}

class _TodoViewState extends State<TodoView> {
  bool isExpanded = true;
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        padding:
            const EdgeInsets.only(top: 40, left: 25, right: 25, bottom: 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: const [
            EventList(),
            TasksList(),
            GroupTask(),
          ],
        ),
      ),
    );
  }
}
