import 'package:chris_dev_app/FirebaseConnection/Auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import '../Constants.dart';

class Getmessages extends StatefulWidget {
  const Getmessages({super.key});

  @override
  State<Getmessages> createState() => _GetmessagesState();
}

class _GetmessagesState extends State<Getmessages> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  String? user = FirebaseClass().getCurrentUser()?.email;

  late bool isMe;

  // late bool isMe;
  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
        stream: FirebaseFirestore.instance
            .collection('messages')
            .orderBy('time', descending: true)
            .snapshots(),
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            return const Center(child: Text('Something went wrong!'));
          }

          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          }

          // Get the list of documents from the snapshot
          final List<QueryDocumentSnapshot<Map<String, dynamic>>> documents =
              snapshot.data!.docs;

          return ListView.builder(
            reverse: true,
            itemCount: documents.length,
            itemBuilder: (BuildContext context, int index) {
              Map<String, dynamic> data = documents[index].data();
              if (data["email"] == user) {
                isMe = true;
              } else {
                isMe = false;
              }

              // Assume `user` is the User object you have

              return Column(
                crossAxisAlignment:
                    isMe ? CrossAxisAlignment.end : CrossAxisAlignment.start,
                children: [
                  Text(
                    data["email"],
                    style: const TextStyle(
                        fontFamily: "Roboto-italic", fontSize: 12),
                  ),
                  Material(
                    color: const Color(kBackgroundColor),
                    borderRadius: isMe
                        ? const BorderRadius.only(
                            topLeft: Radius.circular(30.0),
                            bottomLeft: Radius.circular(30.0),
                            bottomRight: Radius.circular(30.0))
                        : const BorderRadius.only(
                            bottomLeft: Radius.circular(30.0),
                            bottomRight: Radius.circular(30.0),
                            topRight: Radius.circular(30.0),
                          ),
                    elevation: 5.0,
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        data["text"],
                        style: const TextStyle(color: Colors.white),
                      ),
                    ),
                  ),
                ],
              );
            },
          );
        });
  }
}
