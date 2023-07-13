import 'package:flutter/material.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final _formKey = GlobalKey<FormState>();

    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            children: [
              Image.asset("assets/login_avatar.jpg"),
              const SizedBox(height: 20),
              Form(
                key: _formKey,
                child: Column(
                  children: [
                    TextFormField(
                        decoration: const InputDecoration(
                          label: Text("Email"),
                        ),
                        validator: (value) {
                          if (value!.contains("@")) {
                            return null;
                          } else {
                            return "Invalid Email";
                          }
                        }),
                    const SizedBox(height: 20),
                    TextFormField(
                        decoration: const InputDecoration(
                          label: Text("Password"),
                        ),
                        validator: (value) {
                          if (value!.length < 10) {
                            return "Your Password Length Must Be More Than 9";
                          } else {
                            return null;
                          }
                        }),
                    const SizedBox(height: 40),
                    ElevatedButton(
                      onPressed: () {
                        _formKey.currentState!.validate();
                      },
                      child: const Padding(
                        padding: EdgeInsets.symmetric(
                            vertical: 15.0, horizontal: 50),
                        child: Text("Login"),
                      ),
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
