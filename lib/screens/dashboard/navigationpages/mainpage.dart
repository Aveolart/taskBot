// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, unused_element

import 'package:flutter/material.dart';
import 'package:task_bot/screens/dashboard/navigationpages/calender_page.dart';
import 'package:task_bot/screens/dashboard/navigationpages/home_page.dart';
import 'package:task_bot/screens/dashboard/navigationpages/notes_page.dart';
import 'package:task_bot/screens/dashboard/navigationpages/project_page.dart';
import 'package:task_bot/screens/login/loginpage.dart';
import 'package:task_bot/services/api_service.dart';
import 'package:task_bot/services/helper_dialog.dart';

class Mainpage extends StatefulWidget {
  const Mainpage({Key? key}) : super(key: key);

  @override
  State<Mainpage> createState() => _MainpageState();
}

class _MainpageState extends State<Mainpage> {
  int selectedIndex = 0;
  void _changeNavBar(int index) {
    setState(() {
      selectedIndex = index;
    });
  }

  final List<Widget> pages = [
    HomePage(),
    CalenderPage(),
    ProjectPage(),
    NotesPage()
  ];

  Future<bool> _onWillPop(BuildContext context) async {
    // bool? exitResult = await _showExitBottomSheet(context);
    // return exitResult ?? false;
    bool? exitResult = false;
    return exitResult;
  }

  Future<bool?> _showExitBottomSheet(BuildContext context) async {
    return await showModalBottomSheet(
      backgroundColor: Colors.transparent,
      context: context,
      builder: (BuildContext context) {
        return Container(
          padding: const EdgeInsets.all(16),
          decoration: const BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(24),
              topRight: Radius.circular(24),
            ),
          ),
          child: _buildBottomSheet(context),
        );
      },
    );
  }

  Widget _buildBottomSheet(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        const SizedBox(
          height: 24,
        ),
        Text(
          'Do you really want to exit the app?',
          style: Theme.of(context).textTheme.headline6,
        ),
        const SizedBox(
          height: 24,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: <Widget>[
            TextButton(
              style: ButtonStyle(
                padding: MaterialStateProperty.all(
                  const EdgeInsets.symmetric(
                    horizontal: 8,
                  ),
                ),
              ),
              onPressed: () => Navigator.of(context).pop(false),
              child: const Text(
                'CANCEL',
                style: TextStyle(
                  color: Color(0xFF8030D0),
                ),
              ),
            ),
            TextButton(
              style: ButtonStyle(
                padding: MaterialStateProperty.all(
                  const EdgeInsets.symmetric(
                    horizontal: 8,
                  ),
                ),
              ),
              onPressed: () => Navigator.of(context).pop(true),
              child: const Text(
                'YES, EXIT',
                style: TextStyle(
                  color: Color(0xFF8030D0),
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      DialogHelper.welcome();
      // ApiCalls().getAllTAsk(tok);
    });
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () => _onWillPop(context),
      child: DefaultTabController(
        length: 3,
        child: Scaffold(
          // drawer: DrawerPage(),
          // resizeToAvoidBottomInset: false,
          body: pages[selectedIndex],
          bottomNavigationBar: BottomNavigationBar(
            items: [
              BottomNavigationBarItem(
                label: "Home",
                icon: Icon(Icons.home, size: 26),
              ),
              BottomNavigationBarItem(
                label: "CALENDER",
                icon: Icon(Icons.calendar_month),
              ),
              BottomNavigationBarItem(
                label: "PROJECTS",
                icon: Icon(Icons.cases_rounded),
              ),
              BottomNavigationBarItem(
                label: "NOTES",
                icon: Icon(Icons.drive_file_rename_outline),
              ),
            ],
            backgroundColor: Color(0xFF8030D0),
            selectedLabelStyle:
                TextStyle(fontSize: 14, fontWeight: FontWeight.w500),
            unselectedLabelStyle:
                TextStyle(fontSize: 14, fontWeight: FontWeight.w500),
            onTap: _changeNavBar,
            currentIndex: selectedIndex,
            type: BottomNavigationBarType.fixed,
            selectedItemColor: Colors.white,
            unselectedItemColor: Color(0xFF9E9EA0),
          ),
        ),
      ),
    );
  }
}
