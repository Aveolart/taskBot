import 'package:flutter/material.dart';

class TabBarS extends StatelessWidget {
  const TabBarS({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const TabBar(
      padding: EdgeInsets.zero,
      labelPadding: EdgeInsets.zero,
      indicatorPadding: EdgeInsets.only(
        left: 10,
        right: 10,
        top: 0,
      ),
      indicatorWeight: 4,
      indicatorColor: Colors.white,
      tabs: [
        Tab(
          child: Text(
            "TO DO",
            style: TextStyle(
                color: Colors.white, fontWeight: FontWeight.w500, fontSize: 15),
          ),
        ),
        Tab(
          child: Text(
            "ONGOING",
            style: TextStyle(
                color: Colors.white, fontWeight: FontWeight.w500, fontSize: 15),
          ),
        ),
        Tab(
          child: Text(
            "COMPLETED",
            style: TextStyle(
                color: Colors.white, fontWeight: FontWeight.w500, fontSize: 15),
          ),
        )
      ],
    );
  }
}
