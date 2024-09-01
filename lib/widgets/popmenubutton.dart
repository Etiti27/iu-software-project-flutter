import 'package:chris_dev_app/Screens/HomeScreen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../Screens/Login.dart';

class PopmenuButton extends StatefulWidget {
  @override
  State<PopmenuButton> createState() => _PopmenuButtonState();
}

class _PopmenuButtonState extends State<PopmenuButton> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    checkStatus();
  }

  late bool isLoggedIn;
  void checkStatus() async {
    FirebaseAuth auth = FirebaseAuth.instance;
    User? user = auth.currentUser;
    if (user != null) {
      isLoggedIn = true;
    } else {
      isLoggedIn = false;
    }
  }

  @override
  Widget build(BuildContext context) {
    return PopupMenuButton(itemBuilder: (BuildContext context) {
      return [
        PopupMenuItem(
          onTap: () async {
            if (isLoggedIn) {
              FirebaseAuth auth = FirebaseAuth.instance;
              await auth.signOut();
              Navigator.pushNamed(context, Homescreen.id);
            } else {
              Navigator.pushNamed(context, Login.id);
            }
          },
          child: isLoggedIn ? const Text("Sign Out") : const Text("Sign In"),
        ),
      ];
    });
  }
}
