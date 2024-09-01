import 'package:firebase_auth/firebase_auth.dart';

class FirebaseClass {
  late String email;
  late String password;
  late FirebaseAuth auth;

  FirebaseClass({required this.email, required this.password});
  Future<Future<UserCredential>> createUser() async {
    auth = await FirebaseAuth.instance;
    return auth.createUserWithEmailAndPassword(
        email: email, password: password);
  }

  void signIn() {
    auth = FirebaseAuth.instance;
    auth.signInWithEmailAndPassword(email: email, password: password);
  }

  void getCurrentUser() {
    auth = FirebaseAuth.instance;
    auth.currentUser;
  }
}
