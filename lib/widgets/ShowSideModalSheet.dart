import 'package:chris_dev_app/Constants.dart';
import 'package:flutter/material.dart';

import '../Method/InputDecoration.dart';

Future<String?> showSideModalSheet(BuildContext context) {
  return showGeneralDialog(
    context: context,
    barrierDismissible: true,
    barrierLabel: MaterialLocalizations.of(context).modalBarrierDismissLabel,
    barrierColor: Colors.black54, // Background color behind the dialog
    transitionDuration: Duration(milliseconds: 300), // Animation duration
    pageBuilder: (BuildContext context, Animation<double> animation,
        Animation<double> secondaryAnimation) {
      return Align(
        alignment:
            Alignment.centerRight, // Align to the right side of the screen
        child: SlideTransition(
          position: Tween<Offset>(
            begin: Offset(1, 0), // Start position (off-screen to the right)
            end: Offset(0, 0), // End position (on-screen)
          ).animate(animation),
          child: Material(
            child: Container(
              width: MediaQuery.of(context).size.width *
                  0.7, // Set width to 70% of screen width
              // Full screen height
              color: Colors.white, // Background color

              child: SideModalContent(), // Custom content widget
            ),
          ),
        ),
      );
    },
  );
}

// Custom widget for the content of the side modal sheet
class SideModalContent extends StatefulWidget {
  @override
  State<SideModalContent> createState() => _SideModalContentState();
}

class _SideModalContentState extends State<SideModalContent> {
  String? cityName;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          const SizedBox(
            height: 40,
          ),
          TextField(
            onChanged: (newCity) {
              setState(() {
                cityName = newCity;
              });
            },
            autofocus: true,
            obscureText: false,
            keyboardType: TextInputType.text,
            decoration: InputDecor("Search by City Name", "City Name"),
          ),
          ElevatedButton(
              style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(kBackgroundColor)),
              onPressed: () {
                print(cityName);
                cityName == null
                    ? Navigator.pop(context)
                    : Navigator.of(context).pop(cityName); // Close the modal
              },
              child: const Icon(
                Icons.search,
                size: 40,
                color: Colors.white,
              )),
        ],
      ),
    );
  }
}
