import 'package:flutter/material.dart';

import '../Constants.dart';

class MessageListView extends StatelessWidget {
  const MessageListView({required this.document});
  final List document;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      reverse: true,
      itemCount: document.length,
      itemBuilder: (BuildContext context, int index) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Text(document[index]),
            Material(
              color: Color(kBackgroundColor),
              borderRadius: true
                  ? BorderRadius.only(
                      topLeft: Radius.circular(30.0),
                      bottomLeft: Radius.circular(30.0),
                      bottomRight: Radius.circular(30.0))
                  : BorderRadius.only(
                      bottomLeft: Radius.circular(30.0),
                      bottomRight: Radius.circular(30.0),
                      topRight: Radius.circular(30.0),
                    ),
              elevation: 5.0,
              child: Padding(
                padding: EdgeInsets.all(8.0),
                child: Text("data2 h"),
              ),
            ),
          ],
        );
      },
    );
  }
}
