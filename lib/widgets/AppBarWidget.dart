import 'package:chris_dev_app/widgets/popmenubutton.dart';
import 'package:flutter/material.dart';

import '../Constants.dart';

class AppBarWidget extends StatelessWidget implements PreferredSizeWidget {
  dynamic Iconss;
  final String title;

  AppBarWidget(this.Iconss, this.title);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      leading: Iconss,
      title: Text(
        title,
        textAlign: TextAlign.center,
        style: TextStyle(
            color: Colors.white, fontSize: 20.0, fontFamily: "Roboto"),
      ),
      centerTitle: true,
      backgroundColor: const Color(kBackgroundColor),
      actions: [PopmenuButton()],
    );
  }

  @override
  // TODO: implement preferredSize
  Size get preferredSize =>
      Size.fromHeight(kToolbarHeight); // Default AppBar height
}
