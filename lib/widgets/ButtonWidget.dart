import 'package:flutter/material.dart';

import '../Constants.dart';

class ButtonWidget extends StatelessWidget {
  ButtonWidget(this.onpressed, this.text);
  VoidCallback onpressed;
  String text;
  @override
  Widget build(BuildContext context) {
    return FilledButton(
      onPressed: onpressed,
      style: FilledButton.styleFrom(
          backgroundColor: const Color(kBackgroundColor)),
      child: Text(text),
    );
  }
}
