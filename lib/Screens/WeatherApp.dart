import 'package:chris_dev_app/widgets/AppBarWidget.dart';
import 'package:chris_dev_app/widgets/BottomAppWidget.dart';
import 'package:flutter/material.dart';

class Weatherapp extends StatefulWidget {
  static const String id = "weatherapp";

  @override
  State<Weatherapp> createState() => _TodoState();
}

class _TodoState extends State<Weatherapp> {
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
          "Weather App"),
      bottomNavigationBar: bottomAppWidget(),
    );
  }
}
