// ignore_for_file: prefer_const_constructors, prefer_typing_uninitialized_variables

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:task_bot/screens/dashboard/drawer.dart';
import 'package:table_calendar/table_calendar.dart';

class CalenderPage extends StatefulWidget {
  const CalenderPage({Key? key}) : super(key: key);

  @override
  State<CalenderPage> createState() => _CalenderPageState();
}

class _CalenderPageState extends State<CalenderPage> {
  var _selectedDay;
  var focusedDay = DateTime.now();
  CalendarFormat calendarFormat = CalendarFormat.month;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          padding: EdgeInsets.only(left: 10, right: 20, top: 40),
          height: MediaQuery.of(context).size.height / 8,
          decoration: BoxDecoration(
            color: Color(0xFF8030D0),
          ),
          child: Row(
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
        ),
        Padding(
          padding: const EdgeInsets.only(top: 2, right: 10, left: 10),
          child: TableCalendar(
            firstDay: DateTime.utc(2010, 10, 16),
            lastDay: DateTime.utc(2080, 3, 14),
            focusedDay: focusedDay,
            calendarFormat: calendarFormat,
            onFormatChanged: (format) {
              setState(() {
                calendarFormat = format;
              });
            },
            selectedDayPredicate: (day) {
              return isSameDay(_selectedDay, day);
            },
            onPageChanged: (focusedDays) {
              focusedDay = focusedDays;
            },
            onDaySelected: (selectedDay, focusedDay) {
              setState(() {
                _selectedDay = selectedDay;
                focusedDay = focusedDay; // update `_focusedDay` here as well
              });
            },
          ),
        ),
      ],
    );
  }
}
