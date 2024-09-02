import 'package:chris_dev_app/Constants.dart';
import 'package:chris_dev_app/Screens/ChatApp.dart';
import 'package:chris_dev_app/widgets/AppBarWidget.dart';
import 'package:chris_dev_app/widgets/BottomAppWidget.dart';
import 'package:flutter/material.dart';

import 'ToDo.dart';
import 'WeatherApp.dart';

class Decision extends StatefulWidget {
  const Decision({super.key});
  static const String id = "decision";

  @override
  State<Decision> createState() => _DecisionState();
}

class _DecisionState extends State<Decision> {
  List<String> myDecision = [
    "To Do",
    "Chat App",
    "Weather Condition",
  ];
  List<IconData> myDecisionIcons = [
    Icons.calendar_month,
    Icons.message,
    Icons.cloud
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarWidget(Image.asset("images/iu_en.png"), "Make a Decision"),
      bottomNavigationBar: bottomAppWidget(),
      body: Container(
        margin: const EdgeInsets.symmetric(vertical: 0.0, horizontal: 20.0),
        child: Column(
          children: [
            const Expanded(
              flex: 1,
              child: Image(
                width: 200.0,
                image: AssetImage("images/iu_en.png"),
              ),
            ),
            const Text(
              "Best Community",
              style: TextStyle(
                fontFamily: "Roboto",
                fontSize: 30.0,
              ),
            ),
            const SizedBox(
              height: 20.0,
            ),
            const Text(
              "What do you want to do in our community today?",
              style: TextStyle(
                fontFamily: "Pacifico",
                fontSize: 15.0,
              ),
            ),
            const SizedBox(
              height: 20.0,
            ),
            Expanded(
              flex: 2,
              child: Center(
                child: ListView.builder(
                    itemCount: myDecision.length,
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: FilledButton(
                          style: FilledButton.styleFrom(
                            backgroundColor: const Color(kBackgroundColor),
                          ),
                          onPressed: () {
                            if (myDecision[index] == "To Do") {
                              Navigator.pushNamed(context, Todo.id);
                            } else if (myDecision[index] ==
                                "Weather Condition") {
                              Navigator.pushNamed(context, Weatherapp.id);
                            } else if (myDecision[index] == "Chat App") {
                              Navigator.pushNamed(context, Chatapp.id);
                            }
                          },
                          child: ListTile(
                            iconColor: Colors.white,
                            textColor: Colors.white,
                            leading: Icon(myDecisionIcons[index]),
                            title: Text(myDecision[index]),
                            trailing: const Icon(Icons.arrow_forward_ios),
                          ),
                        ),
                      );
                    }),
              ),
            )
          ],
        ),
      ),
    );
  }
}
