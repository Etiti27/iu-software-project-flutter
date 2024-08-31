import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:chris_dev_app/Constants.dart';
import 'package:flutter/material.dart';

import '../widgets/AppBarWidget.dart';
import '../widgets/BottomAppWidget.dart';

class Homescreen extends StatefulWidget {
  const Homescreen({super.key});
  static const id = "home_screen";

  @override
  State<Homescreen> createState() => _HomescreenState();
}

class _HomescreenState extends State<Homescreen> {
  String title = "Chris IU Projects";
  Image image = Image.asset("images/iu_en.png");
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBarWidget(image, title),
        bottomNavigationBar: bottomAppWidget(),
        body: Padding(
          padding: const EdgeInsets.only(
              top: 50.0, right: 20.0, left: 20.0, bottom: 50.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Expanded(
                flex: 1,
                child: Image(
                  image: AssetImage("images/iu_en.png"),
                ),
              ),
              const SizedBox(
                width: 20.0,
              ),
              Expanded(
                flex: 2,
                child: Padding(
                  padding: const EdgeInsets.only(top: 50.0),
                  child: AnimatedTextKit(
                    animatedTexts: [
                      TypewriterAnimatedText(
                        'Welcome to Chris App',
                        textStyle: const TextStyle(
                          fontSize: 32.0,
                          fontWeight: FontWeight.bold,
                        ),
                        speed: const Duration(milliseconds: 250),
                      ),
                    ],
                    repeatForever: true,
                  ),
                ),
              ),
              Expanded(
                child: Center(
                  child: FilledButton(
                    onPressed: () {},
                    child: Text("Get Started!"),
                    style: FilledButton.styleFrom(
                        backgroundColor: const Color(kBackgroundColor)),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
