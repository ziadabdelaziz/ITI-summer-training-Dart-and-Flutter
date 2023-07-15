import 'package:flutter/material.dart';
import 'package:lab4/screens/navigation_screen.dart';
import 'package:lab4/widgets/third_party_button.dart';

import 'home_screen.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    final _formKey = GlobalKey<FormState>();
    final TextEditingController emailController = TextEditingController();

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
                        decoration: const InputDecoration(
                          label: Text("Password"),
                          border: OutlineInputBorder(),
                          prefixIcon: Padding(
                            padding: EdgeInsets.symmetric(horizontal: 15),
                            child: Icon(Icons.key),
                          ),
                        ),
                        validator: (value) {
                          if (value!.length < 10) {
                            return "Your Password Length Must Be More Than 9";
                          } else {
                            return null;
                          }
                        }),
                    const SizedBox(height: 60),
                    ElevatedButton(
                      onPressed: () {
                        if (_formKey.currentState!.validate()) {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => NavigationScreen(
                                email: emailController.text,
                                image: 'assets/profile.jpg',
                              ),
                            ),
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
