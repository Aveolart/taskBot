// ignore_for_file: no_logic_in_create_state

import 'package:flutter/material.dart';
import 'dart:math' as math;

class GroupTask extends StatefulWidget {
  const GroupTask({Key? key}) : super(key: key);

  @override
  State<GroupTask> createState() => _GroupTaskState();
}

class _GroupTaskState extends State<GroupTask> {
  bool isExpanded = true;
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
                  "Group Tasks",
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
              const Icon(
                Icons.control_point_outlined,
                color: Color(0xFF8030D0),
                size: 25,
              )
            ],
          ),
          isExpanded
              ? Container(
                  width: MediaQuery.of(context).size.width,
                  margin: const EdgeInsets.only(top: 20),
                  // height: 55,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(6),
                    border: Border.all(
                      color:
                          Color((math.Random().nextDouble() * 0xFFFFFF).toInt())
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
                )
              : Container()
        ],
      ),
    );
  }
}
