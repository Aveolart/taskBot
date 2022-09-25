import 'package:flutter/material.dart';

class CompletedTab extends StatefulWidget {
  const CompletedTab({Key? key}) : super(key: key);

  @override
  State<CompletedTab> createState() => _CompletedTabState();
}

class _CompletedTabState extends State<CompletedTab> {
  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Padding(
        padding: EdgeInsets.all(40.0),
        child: Text(
          textAlign: TextAlign.center,
          "Nothing to show here yet!",
          style: TextStyle(
              fontSize: 35, fontWeight: FontWeight.bold, color: Colors.grey),
        ),
      ),
    );
  }
}
