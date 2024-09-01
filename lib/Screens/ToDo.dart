import 'package:chris_dev_app/widgets/AppBarWidget.dart';
import 'package:chris_dev_app/widgets/BottomAppWidget.dart';
import 'package:flutter/material.dart';

class Todo extends StatefulWidget {
  static const String id = "todo";

  @override
  State<Todo> createState() => _TodoState();
}

class _TodoState extends State<Todo> {
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
          "Todo App "),
      bottomNavigationBar: bottomAppWidget(),
    );
  }
}
