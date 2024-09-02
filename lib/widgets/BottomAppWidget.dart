import 'package:flutter/material.dart';

import '../Constants.dart';

class bottomAppWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        height: 50.0,
        color: Color(kBackgroundColor),
        child: const Center(
          child: Column(
            children: [
              Text(
                "All right reserved",
                style: TextStyle(color: Colors.white),
              ),
              Text("Copyright © 2024", style: TextStyle(color: Colors.white))
            ],
          ),
        ),
      ),
    );
  }
}
