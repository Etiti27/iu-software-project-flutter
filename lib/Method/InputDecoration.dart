import 'package:chris_dev_app/Constants.dart';
import 'package:flutter/material.dart';

InputDecoration InputDecor(String hintText, String label) {
  return InputDecoration(
    focusColor: Color(kBackgroundColor),
    hintText: hintText,
    label: Text(label),
    contentPadding:
        const EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
    border: const OutlineInputBorder(
      borderRadius: BorderRadius.all(Radius.circular(32.0)),
    ),
    enabledBorder: const OutlineInputBorder(
      borderSide: BorderSide(color: Color(kBackgroundColor), width: 1.0),
      borderRadius: BorderRadius.all(Radius.circular(32.0)),
    ),
    focusedBorder: const OutlineInputBorder(
      borderSide: BorderSide(color: Color(kBackgroundColor), width: 2.0),
      borderRadius: BorderRadius.all(Radius.circular(32.0)),
    ),
  );
}
