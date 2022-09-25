// ignore_for_file: no_logic_in_create_state

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:task_bot/services/api_service.dart';
import 'package:task_bot/services/helper_dialog.dart';
import 'dart:math' as math;

import 'package:task_bot/widgets/add_task_widget.dart';
import 'package:task_bot/screens/login/loginpage.dart';

class TasksList extends StatefulWidget {
  const TasksList({Key? key}) : super(key: key);

  @override
  State<TasksList> createState() => _TasksListState();
}

class _TasksListState extends State<TasksList> {
  bool isExpanded = true;
  bool addTask = false;
  TextEditingController titleController = TextEditingController();
  TextEditingController detailsController = TextEditingController();

  addingTask() async {
    var out = await ApiCalls()
        .addTask(titleController.text, detailsController.text, tok);

    if (out != null) {
      Get.back();
      DialogHelper.addTask();
      // Get.offAll(() => LoginPage());
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

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 30),
      child: Column(
        children: [
          Row(
            children: [
              Container(
                margin: const EdgeInsets.only(right: 10),
                child: const Text(
                  "Tasks",
                  style: TextStyle(
                      color: Color(0xFF16163F),
                      fontSize: 16,
                      fontWeight: FontWeight.w500),
                ),
              ),
              GestureDetector(
                onTap: () {
                  setState(() {
                    isExpanded = !isExpanded;
                  });
                },
                child: isExpanded
                    ? const Icon(
                        Icons.expand_more_rounded,
                        size: 28,
                      )
                    : const Icon(Icons.expand_less_rounded),
              ),
              Expanded(child: Container()),
              GestureDetector(
                onTap: () {
                  setState(() {
                    addTask = !addTask;
                    detailsController.clear();
                    titleController.clear();
                  });
                },
                child: const Icon(
                  Icons.control_point_outlined,
                  color: Color(0xFF8030D0),
                  size: 25,
                ),
              )
            ],
          ),
          isExpanded
              ? Column(
                  children: [
                    Container(
                      width: MediaQuery.of(context).size.width,
                      margin: const EdgeInsets.only(top: 20),
                      // height: 55,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(6),
                        border: Border.all(
                          color: Color((math.Random().nextDouble() * 0xFFFFFF)
                                  .toInt())
                              .withOpacity(1.0),
                        ),
                      ),
                      child: const Center(
                        child: Padding(
                          padding: EdgeInsets.all(16),
                          child: Text(
                            "Submit the task by saturday",
                            style: TextStyle(
                                fontSize: 16, fontWeight: FontWeight.w500),
                          ),
                        ),
                      ),
                    ),
                    addTask
                        ? AddNewTask(
                            onTap: () async {
                              DialogHelper.showAddingTask();
                              await addingTask();
                              setState(() {
                                addTask = false;
                              });
                            },
                            titleController: titleController,
                            detailsController: detailsController)
                        : Container()
                  ],
                )
              : Container()
        ],
      ),
    );
  }
}
