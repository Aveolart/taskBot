// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:task_bot/models/Addtask/alltask_model.dart';
import 'package:task_bot/screens/login/loginpage.dart';
import 'dart:math' as math;

import 'package:task_bot/services/api_service.dart';
import 'package:task_bot/services/helper_dialog.dart';
import 'package:task_bot/widgets/add_task_widget.dart';

class EventList extends StatefulWidget {
  const EventList({Key? key}) : super(key: key);

  @override
  State<EventList> createState() => _EventListState();
}

class _EventListState extends State<EventList> {
  bool isExpanded = true;
  bool isPressed = true;
  GetTaskModel? getallTask;
  late final Future? future;
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

  gettingTask() async {
    var out = await ApiCalls().getAllTAsk(tok);

    if (out != null) {
      setState(() {
        getallTask = out;
      });
      return getallTask;
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

  // @override
  // void initState() {
  //   super.initState();
  //   WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
  //     gettingTask();
  //   });
  // }
  @override
  void initState() {
    // TODO: implement initState
    future = gettingTask();
    super.initState();
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
                  "Events",
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
              InkWell(
                onTap: () async {
                  setState(() {
                    isExpanded = false;
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
              ?
              // ? Text("Loading")
              FutureBuilder<dynamic>(
                  future:
                      future, // a previously-obtained Future<String> or null
                  builder:
                      (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
                    List<Widget> children;
                    if (snapshot.hasData) {
                      print(snapshot.data);
                      return ListView.builder(
                        addAutomaticKeepAlives: true,
                        scrollDirection: Axis.vertical,
                        shrinkWrap: true,
                        itemCount: getallTask?.notes.length,
                        itemBuilder: (context, index) {
                          return Container(
                            width: MediaQuery.of(context).size.width,
                            margin: const EdgeInsets.only(top: 20),
                            // height: 55,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(6),
                              border: Border.all(
                                color: Color(
                                        (math.Random().nextDouble() * 0xFFFFFF)
                                            .toInt())
                                    .withOpacity(1.0),
                              ),
                            ),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Padding(
                                  padding: EdgeInsets.all(16),
                                  child: Text(
                                    "Titile: ${getallTask?.notes[index].title}",

                                    // snapshot.data[index].title,
                                    // "${getallTask?.notes[0].title.toString()}",
                                    style: TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.w500),
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsets.all(16),
                                  child: Text(
                                    "Description: ${getallTask?.notes[index].description}",

                                    // snapshot.data[index].title,
                                    // "${getallTask?.notes[0].title.toString()}",
                                    style: TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.w500),
                                  ),
                                ),
                              ],
                            ),
                          );
                        },
                      );
                    } else if (snapshot.hasError) {
                      children = <Widget>[
                        const Icon(
                          Icons.error_outline,
                          color: Colors.red,
                          size: 60,
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 16),
                          child: Text('Error: ${snapshot.error}'),
                        ),
                      ];
                    } else {
                      children = const <Widget>[
                        SizedBox(
                          width: 20,
                          height: 20,
                          child: CircularProgressIndicator(),
                        ),
                        Padding(
                          padding: EdgeInsets.only(top: 16),
                          child: Text('Awaiting tasks...'),
                        ),
                      ];
                      print(snapshot.data);
                      // return ListView.builder(
                      //   addAutomaticKeepAlives: true,
                      //   scrollDirection: Axis.vertical,
                      //   shrinkWrap: true,
                      //   itemCount: getallTask?.notes.length,
                      //   itemBuilder: (context, index) {
                      //     return Container(
                      //       width: MediaQuery.of(context).size.width,
                      //       margin: const EdgeInsets.only(top: 20),
                      //       // height: 55,
                      //       decoration: BoxDecoration(
                      //         borderRadius: BorderRadius.circular(6),
                      //         border: Border.all(
                      //           color: Color(
                      //                   (math.Random().nextDouble() * 0xFFFFFF)
                      //                       .toInt())
                      //               .withOpacity(1.0),
                      //         ),
                      //       ),
                      //       child: Center(
                      //         child: Padding(
                      //           padding: EdgeInsets.all(16),
                      //           child: Text(
                      //             "Hello",
                      //             // snapshot.data[index].title,
                      //             // "${getallTask?.notes[0].title.toString()}",
                      //             style: TextStyle(
                      //                 fontSize: 16,
                      //                 fontWeight: FontWeight.w500),
                      //           ),
                      //         ),
                      //       ),
                      //     );
                      //   },
                      // );
                    }
                    return Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: children,
                      ),
                    );
                  },
                )
              // ? ListView.builder(
              //     scrollDirection: Axis.vertical,
              //     shrinkWrap: true,
              //     itemCount: getallTask?.notes.length,
              //     itemBuilder: (context, index) {
              //       return Container(
              //         width: MediaQuery.of(context).size.width,
              //         margin: const EdgeInsets.only(top: 20),
              //         // height: 55,
              //         decoration: BoxDecoration(
              //           borderRadius: BorderRadius.circular(6),
              //           border: Border.all(
              //             color: Color((math.Random().nextDouble() * 0xFFFFFF)
              //                     .toInt())
              //                 .withOpacity(1.0),
              //           ),
              //         ),
              //         child: Center(
              //           child: Padding(
              //             padding: EdgeInsets.all(16),
              //             child: Text(
              //               "${getallTask?.notes[0].title.toString()}",
              //               style: TextStyle(
              //                   fontSize: 16, fontWeight: FontWeight.w500),
              //             ),
              //           ),
              //         ),
              //       );
              //     },
              //   )
              : Container(),
          addTask
              ? AddNewTask(
                  onTap: () async {
                    DialogHelper.showAddingTask();
                    await addingTask();
                    setState(() {
                      gettingTask();
                      addTask = false;
                    });
                  },
                  titleController: titleController,
                  detailsController: detailsController)
              : Container()
        ],
      ),
    );
  }
}
