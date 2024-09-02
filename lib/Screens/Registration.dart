import 'package:chris_dev_app/Screens/Decision.dart';
import 'package:chris_dev_app/widgets/AppBarWidget.dart';
import 'package:chris_dev_app/widgets/BottomAppWidget.dart';
import 'package:chris_dev_app/widgets/ButtonWidget.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../Method/InputDecoration.dart';
import 'Login.dart';

class Registration extends StatefulWidget {
  const Registration({super.key});
  static const String id = "register";

  @override
  State<Registration> createState() => _RegistrationState();
}

class _RegistrationState extends State<Registration> {
  late String email, password;
  Image image = Image.asset("images/iu_en.png");
  bool _isLoading = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarWidget(image, "Register"),
      bottomNavigationBar: bottomAppWidget(),
      body: _isLoading
          ? const Center(
              child: CircularProgressIndicator(),
            )
          : Container(
              margin:
                  const EdgeInsets.symmetric(vertical: 0.0, horizontal: 20.0),
              child: Column(
                children: [
                  const Expanded(
                    child: Center(
                      child: Image(
                        width: 250.0,
                        image: AssetImage("images/iu_en.png"),
                      ),
                    ),
                  ),
                  const Text(
                    "Registration",
                    style: TextStyle(fontSize: 30.0),
                  ),
                  SizedBox(
                    height: 20.0,
                  ),
                  Expanded(
                    child: Column(
                      children: [
                        TextField(
                          onChanged: (newEmail) {
                            setState(() {
                              email = newEmail;
                            });
                          },
                          autofocus: false,
                          keyboardType: TextInputType.emailAddress,
                          decoration:
                              InputDecor("Enter Your E-mail", "E-mail:"),
                        ),
                        const SizedBox(
                          height: 20.0,
                        ),
                        TextField(
                          onChanged: (newPassword) {
                            password = newPassword;
                          },
                          obscureText: true,
                          keyboardType: TextInputType.text,
                          decoration:
                              InputDecor("Enter Your Password", "Password:"),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            ButtonWidget(() async {
                              setState(() {
                                _isLoading = true;
                              });
                              FirebaseAuth auth = FirebaseAuth.instance;
                              await auth.createUserWithEmailAndPassword(
                                  email: email, password: password);
                              Navigator.pushNamed(context, Decision.id);
                              _isLoading = false;
                            }, "Register"),
                          ],
                        )
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(bottom: 30.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text("Already have an account?"),
                        const SizedBox(
                          width: 20.0,
                        ),
                        GestureDetector(
                          onTap: () {
                            Navigator.pushNamed(context, Login.id);
                          },
                          child: const Text(
                            "Login",
                            style: TextStyle(color: Colors.indigo),
                          ),
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ),
    );
  }
}
