import 'package:flutter/material.dart';

class OngoingView extends StatefulWidget {
  const OngoingView({Key? key}) : super(key: key);

  @override
  State<OngoingView> createState() => _OngoingViewState();
}

class _OngoingViewState extends State<OngoingView> {
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
