import 'package:flutter/material.dart';
import 'package:layout/my_button.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final _formKey = GlobalKey<FormState>();

    return Scaffold(
      appBar: AppBar(
        title: const Text("Login Screen"),
        backgroundColor: Colors.orange,
      ),
      body: SingleChildScrollView(
        child: Form(
            key: _formKey,
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextFormField(
                    decoration: const InputDecoration(
                      label: Text("Email"),
                    ),
                    validator: (value) {
                      if (value!.contains('@')) {
                        return null;
                      } else {
                        return "Not valid Email";
                      }
                    },
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextFormField(
                    decoration: const InputDecoration(
                      label: Text("Password"),
                    ),
                    validator: (value) {
                      if (value!.length < 7) {
                        return "Not valid password";
                      } else {
                        return null;
                      }
                    },
                  ),
                ),
                InkWell(
                  onTap: () {
                    _formKey.currentState!.validate();
                  },
                  borderRadius: BorderRadius.circular(25),
                  child: const MyButton(
                    label: "login",
                  ),
                ),
              ],
            )),
      ),
    );
  }
}
