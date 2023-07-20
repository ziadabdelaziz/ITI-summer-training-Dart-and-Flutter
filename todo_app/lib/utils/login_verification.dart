import 'package:todo_app/views/screens/navigation_screen.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:shared_preferences/shared_preferences.dart';

void saveEmail(String email) async {
  final SharedPreferences prefs = await SharedPreferences.getInstance();
  prefs.setString('email', email);
}

signinUsingFirebase({
  required String email,
  required String password,
  required BuildContext context,
}) async {
  try {
    UserCredential userCredential =
        await FirebaseAuth.instance.signInWithEmailAndPassword(
      email: email,
      password: password,
    );
    User? user = userCredential.user;
    if (user != null) {
      saveEmail(email);
      // ignore: use_build_context_synchronously
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => NavigationScreen(
            email: email,
            image: 'assets/profile.jpg',
          ),
        ),
      );
    } else {
      // ignore: use_build_context_synchronously
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
        content: Text("SignIn Failed"),
      ));
    }
  } catch (e) {
    ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
      content: Text("Wrong Email or Password"),
    ));
  }
}
