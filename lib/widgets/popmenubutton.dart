import 'package:flutter/material.dart';

class PopmenuButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return PopupMenuButton(itemBuilder: (BuildContext context) {
      return [
        PopupMenuItem(
          onTap: () {
            print("data");
          },
          child: Text("data"),
        ),
      ];
    });
  }
}
