import 'package:chris_dev_app/Screens/ChatApp.dart';
import 'package:chris_dev_app/Screens/Decision.dart';
import 'package:chris_dev_app/Screens/HomeScreen.dart';
import 'package:chris_dev_app/Screens/Login.dart';
import 'package:chris_dev_app/Screens/Registration.dart';
import 'package:chris_dev_app/Screens/ToDo.dart';
import 'package:chris_dev_app/Screens/WeatherApp.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

void main() async {
  await dotenv.load(fileName: ".env");
  WidgetsFlutterBinding
      .ensureInitialized(); // Ensure widgets are initialized before Firebase
  await Firebase.initializeApp();
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
      routes: {
        Homescreen.id: (context) => const Homescreen(),
        Registration.id: (context) => const Registration(),
        Login.id: (context) => const Login(),
        Decision.id: (context) => const Decision(),
        Todo.id: (context) => Todo(),
        Weatherapp.id: (context) => Weatherapp(),
        Chatapp.id: (context) => Chatapp()
      },
    );
  }
}
