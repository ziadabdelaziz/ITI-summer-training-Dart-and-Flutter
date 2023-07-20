import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:todo_app/views/screens/navigation_screen.dart';
import 'package:todo_app/views/widgets/third_party_button.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
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

  @override
  Widget build(BuildContext context) {
    final _formKey = GlobalKey<FormState>();
    final TextEditingController emailController = TextEditingController();
    final TextEditingController passwordController = TextEditingController();

    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(35.0),
          child: Column(
            children: [
              const SizedBox(height: 55),
              Container(
                width: double.infinity,
                child: const Text(
                  "Welcome!",
                  textAlign: TextAlign.left,
                  style: TextStyle(
                    fontSize: 40,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              const SizedBox(height: 20),
              Container(
                width: double.infinity,
                child: const Text(
                  "We are happy for having you with us",
                  textAlign: TextAlign.left,
                  style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Color.fromARGB(255, 124, 124, 124)),
                ),
              ),
              const SizedBox(height: 40),
              Form(
                key: _formKey,
                child: Column(
                  children: [
                    TextFormField(
                        decoration: const InputDecoration(
                          label: Text("Email"),
                          border: OutlineInputBorder(),
                          prefixIcon: Padding(
                            padding: EdgeInsets.symmetric(horizontal: 15),
                            child: Icon(Icons.email),
                          ),
                        ),
                        controller: emailController,
                        validator: (value) {
                          if (value!.contains("@")) {
                            return null;
                          } else {
                            return "Invalid Email";
                          }
                        }),
                    const SizedBox(height: 30),
                    TextFormField(
                        controller: passwordController,
                        decoration: const InputDecoration(
                          label: Text("Password"),
                          border: OutlineInputBorder(),
                          prefixIcon: Padding(
                            padding: EdgeInsets.symmetric(horizontal: 15),
                            child: Icon(Icons.key),
                          ),
                        ),
                        validator: (value) {
                          if (value!.length < 6) {
                            return "Your Password Length Must Be More Than 9";
                          } else {
                            return null;
                          }
                        }),
                    const SizedBox(height: 60),
                    ElevatedButton(
                      onPressed: () {
                        if (_formKey.currentState!.validate()) {
                          signinUsingFirebase(
                            email: emailController.text,
                            password: passwordController.text,
                            context: context,
                          );
                        }
                      },
                      child: const Padding(
                        padding: EdgeInsets.symmetric(
                            vertical: 15.0, horizontal: 40),
                        child: Text(
                          "Login",
                          style: TextStyle(
                              fontSize: 18, fontWeight: FontWeight.bold),
                        ),
                      ),
                    )
                  ],
                ),
              ),
              const SizedBox(height: 50),
              const Row(
                children: <Widget>[
                  Expanded(child: Divider()),
                  Text("OR"),
                  Expanded(child: Divider()),
                ],
              ),
              const SizedBox(height: 40),
              const ThirdPartyButton(),
            ],
          ),
        ),
      ),
    );
  }
}
