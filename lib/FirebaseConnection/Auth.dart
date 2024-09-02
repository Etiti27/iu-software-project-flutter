import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class FirebaseClass {
  late FirebaseAuth auth;

  void signIn(String email, String password) {
    auth = FirebaseAuth.instance;
    auth.signInWithEmailAndPassword(email: email, password: password);
  }

  User? getCurrentUser() {
    auth = FirebaseAuth.instance;
    return auth.currentUser;
  }

  void addMessage(String text, String sender, String senderEmail) async {
    CollectionReference items =
        FirebaseFirestore.instance.collection('messages');
    Map<String, Object> messages = {
      "text": text,
      "email": senderEmail,
      "sender": sender,
      "time": FieldValue.serverTimestamp(),
    };
    await items.add(messages);
  }
}
