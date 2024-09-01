import 'package:chris_dev_app/widgets/AppBarWidget.dart';
import 'package:chris_dev_app/widgets/BottomAppWidget.dart';
import 'package:flutter/material.dart';

class Chatapp extends StatefulWidget {
  static const String id = "chatapp";
  @override
  State<Chatapp> createState() => _TodoState();
}

class _TodoState extends State<Chatapp> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarWidget(
          GestureDetector(
            onTap: () {
              Navigator.pop(context);
            },
            child: Icon(Icons.arrow_back_ios_new),
          ),
          "Chat App"),
      bottomNavigationBar: bottomAppWidget(),
    );
  }
}
