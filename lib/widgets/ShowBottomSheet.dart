import 'package:flutter/material.dart';

import 'TextfieldForAddTask.dart';

Future<dynamic> ShowModalBottomSheet(BuildContext context) {
  return showModalBottomSheet(
    context: context,
    builder: (BuildContext context) {
      return Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(50.0),
            child: TestFieldToAddTask(),
          ),
        ],
      );
    },
  );
}
