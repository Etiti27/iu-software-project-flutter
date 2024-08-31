import 'package:chris_dev_app/Screens/HomeScreen.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Chris Dev App",
      theme: ThemeData.light(),
      initialRoute: Homescreen.id,
      routes: {Homescreen.id: (context) => const Homescreen()},
    );
  }
}
