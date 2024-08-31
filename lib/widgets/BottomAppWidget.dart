import 'package:flutter/material.dart';

import '../Constants.dart';

class bottomAppWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50.0,
      color: Color(kBackgroundColor),
      child: Center(
        child: Text(
          "this is a project app, all right reserved, \n copyright © 2024",
          style: TextStyle(color: Colors.white),
        ),
      ),
    );
  }
}
