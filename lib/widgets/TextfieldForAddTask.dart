import 'package:chris_dev_app/Constants.dart';
import 'package:flutter/material.dart';

import '../Method/InputDecoration.dart';

class TestFieldToAddTask extends StatefulWidget {
  @override
  State<TestFieldToAddTask> createState() => _TestFieldToAddTaskState();
}

class _TestFieldToAddTaskState extends State<TestFieldToAddTask> {
  late String task;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        const Text(
          'Add Task',
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 10),
        Row(
          children: [
            Expanded(
              flex: 4,
              child: TextField(
                key: const Key('taskTextField'),
                onChanged: (newTask) {
                  setState(() {
                    task = newTask;
                  });
                },
                autofocus: true,
                obscureText: false,
                keyboardType: TextInputType.text,
                decoration: InputDecor("Add task", "Task"),
              ),
            ),
            const SizedBox(width: 20),
            Expanded(
              flex: 1,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                    backgroundColor: Color(kBackgroundColor)),
                onPressed: () {
                  Navigator.of(context).pop(task); // Close the bottom sheet
                },
                child: const Icon(
                  Icons.add,
                  color: Colors.white,
                ),
              ),
            ),
          ],
        )
      ],
    );
  }
}
