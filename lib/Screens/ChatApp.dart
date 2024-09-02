import 'package:chris_dev_app/FirebaseConnection/Auth.dart';
import 'package:chris_dev_app/widgets/AppBarWidget.dart';
import 'package:chris_dev_app/widgets/BottomAppWidget.dart';
import 'package:chris_dev_app/widgets/GetMessages.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../Method/InputDecoration.dart';

class Chatapp extends StatefulWidget {
  static const String id = "chatapp";
  @override
  State<Chatapp> createState() => _TodoState();
}

class _TodoState extends State<Chatapp> {
  FirebaseAuth auth = FirebaseAuth.instance;

  List<String> message = ["welcome", "Enugu"];
  bool isMe = true;
  late String sender;
  late String text;
  dynamic controllerText = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarWidget(
          GestureDetector(
            onTap: () {
              Navigator.pop(context);
            },
            child: const Icon(Icons.arrow_back_ios_new),
          ),
          "Chat App"),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            const Expanded(
              child: Getmessages(),
            ),
            const SizedBox(
              height: 20,
            ),
            Row(
              children: [
                Expanded(
                  flex: 8,
                  child: TextField(
                    controller: controllerText,
                    onChanged: (newMessage) {
                      setState(() {
                        text = newMessage;
                      });
                    },
                    autofocus: false,
                    keyboardType: TextInputType.emailAddress,
                    decoration: InputDecor("type ...", "Message:"),
                  ),
                ),
                Expanded(
                  flex: 1,
                  child: GestureDetector(
                    onTap: () {
                      controllerText.clear();
                      User? user = auth.currentUser;
                      FirebaseClass().addMessage(
                        text,
                        user.toString(),
                        FirebaseClass().getCurrentUser()!.email.toString(),
                      );
                    },
                    child: const Icon(Icons.send),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
      bottomNavigationBar: bottomAppWidget(),
    );
  }
}
// TextField(
// onChanged: (newEmail) {
// setState(() {});
// },
// autofocus: false,
// keyboardType: TextInputType.emailAddress,
// decoration: InputDecor("type ...", "Message:"),
// ),
