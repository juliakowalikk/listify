import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';

class AuthService extends ChangeNotifier {
  FirebaseAuth firebaseAuth = FirebaseAuth.instance;

  Stream<User?> get onAuthStateChanged => firebaseAuth.authStateChanges();

  Future<String> getCurrentUID() async => firebaseAuth.currentUser!.uid;
}
