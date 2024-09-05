import 'package:chris_dev_app/Constants.dart';
import 'package:chris_dev_app/FirebaseConnection/Auth.dart';
import 'package:chris_dev_app/widgets/AppBarWidget.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import '../widgets/ShowBottomSheet.dart';

class Todo extends StatefulWidget {
  static const String id = "todo";

  @override
  State<Todo> createState() => _TodoState();
}

class _TodoState extends State<Todo> {
  String title = "Todo App";
  Map<String, dynamic> tasks = {"name": "is nothing", "isDone": false};

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
          "T0-DO"),
      // bottomNavigationBar: bottomAppWidget(),
      body: StreamBuilder(
          stream: FirebaseFirestore.instance
              .collection("todolist")
              // .where('isDone', isEqualTo: false)
              .orderBy('time', descending: false)
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

            return Column(
              children: [
                documents.isNotEmpty
                    ? Expanded(
                        child: Padding(
                          padding: EdgeInsets.all(20.0),
                          child: ListView.builder(
                            reverse: false,
                            itemCount: documents.length,
                            itemBuilder: (context, index) {
                              bool isDoneToDo = documents[index]["isDone"];

                              return ListTile(
                                leading: Text("${index + 1}".toString()),
                                title: Text(documents[index]["task"]
                                    .toString()
                                    .toUpperCase()),
                                trailing: Checkbox(
                                    activeColor: Color(kBackgroundColor),
                                    value: isDoneToDo,
                                    onChanged: (newVA) async {
                                      setState(() {
                                        title = "$index items in Todo";
                                      });
                                      print(newVA);
                                      await FirebaseFirestore.instance
                                          .collection('todolist')
                                          .doc(documents[index].id)
                                          .update(
                                        {
                                          "isDone": newVA!,
                                        },
                                      );
                                      await FirebaseFirestore.instance
                                          .collection('todolist')
                                          .doc(documents[index].id)
                                          .delete(); // Delete the specified document
                                      print('Document deleted successfully!');

                                      setState(() {
                                        print(documents[index]["task"]
                                            .toString());
                                      });
                                    }),
                              );
                            },
                          ),
                        ),
                      )
                    : const Expanded(
                        child: Center(
                          child: Text("Your todo List is empty, add task"),
                        ),
                      ),
                SizedBox(
                  height: 70,
                  width: double
                      .infinity, // Make the button take up the entire width
                  child: FilledButton(
                    onPressed: () async {
                      // Define what happens when the button is pressed
                      final result = await ShowModalBottomSheet(context);
                      print("just returned home with $result");
                      CollectionReference items =
                          FirebaseFirestore.instance.collection("todolist");
                      Map<String, Object> todolist = {
                        "task": result,
                        "sender": FirebaseClass().getCurrentUser().toString(),
                        "isDone": false,
                        "time": FieldValue.serverTimestamp(),
                      };
                      await items.add(todolist);
                    },
                    style: FilledButton.styleFrom(
                        backgroundColor: const Color(kBackgroundColor),
                        padding: const EdgeInsets.symmetric(vertical: 16.0),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(0.0))
                        // Customize padding if needed
                        ),
                    child: const Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text("Add"),
                        Icon(Icons.add),
                      ],
                    ), // Button text
                  ),
                ),
                // SizedBox(
                //   height: 10,
                // )
              ],
            );

            // return ChatAppMessageDesign(documents);
          }),
    );
  }
}
