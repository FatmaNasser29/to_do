import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

class AuthProvider extends ChangeNotifier {
  User? firebaseUser;

  AuthProvider() {
    firebaseUser = FirebaseAuth.instance.currentUser;
  }

  bool isLoggedIn() {
    return firebaseUser != null;
  }

  void login(User newUser) {
    firebaseUser = newUser;
  }

  void logOut() {
    firebaseUser = null;
  }

  Future<UserCredential> createUserWithEmailAndPassword(
    String email,
    String password,
  ) async {
    UserCredential credential = await FirebaseAuth.instance
        .createUserWithEmailAndPassword(email: email, password: password);
    if (credential.user != null) {
      login(credential.user!);
    }
    return credential;
  }

  Future<UserCredential> signInWithEmailAndPassword(
    String email,
    String password,
  ) async {
    UserCredential credential = await FirebaseAuth.instance
        .signInWithEmailAndPassword(email: email, password: password);
    if (credential.user != null) {
      login(credential.user!);
    }
    return credential;
  }
}
