import 'package:chris_dev_app/Screens/Decision.dart';
import 'package:chris_dev_app/Screens/Registration.dart';
import 'package:chris_dev_app/widgets/AppBarWidget.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../Method/InputDecoration.dart';
import '../widgets/BottomAppWidget.dart';
import '../widgets/ButtonWidget.dart';

class Login extends StatefulWidget {
  const Login({super.key});
  static const String id = "login";

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  late FirebaseAuth auth;
  Image image = Image.asset(
    "images/iu_en.png",
  );
  late String email;
  late String password;
  late bool _isLoading = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarWidget(image, "Login"),
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
                    child: Hero(
                      tag: "logo1",
                      child: Image(
                        width: 250.0,
                        image: AssetImage("images/iu_en.png"),
                      ),
                    ),
                  ),
                  const Text(
                    "Login",
                    style: TextStyle(fontSize: 30.0),
                  ),
                  const SizedBox(
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
                            setState(() {
                              password = newPassword;
                            });
                          },
                          autofocus: false,
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
                              await auth.signInWithEmailAndPassword(
                                  email: email, password: password);
                              Navigator.pushNamed(context, Decision.id);
                              _isLoading = false;
                            }, "Login"),
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
                        const Text("Don't have an account yet? "),
                        const SizedBox(
                          width: 20.0,
                        ),
                        GestureDetector(
                          onTap: () {
                            Navigator.pushNamed(context, Registration.id);
                          },
                          child: const Text(
                            "Register",
                            style: TextStyle(color: Colors.indigo),
                          ),
                        )
                      ],
                    ),
                  )
                ],
              ),
            ),
    );
  }
}
