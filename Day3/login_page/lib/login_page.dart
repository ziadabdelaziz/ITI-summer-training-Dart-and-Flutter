import 'package:flutter/material.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: const EdgeInsets.all(40),
        width: double.infinity,
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(30),
              child: Image.asset(
                "assets/flutter.png",
                width: 200,
                height: 200,
              ),
            ),
            const SizedBox(height: 75),
            TextFormField(
              decoration: const InputDecoration(
                labelText: 'Phone Number',
                labelStyle: TextStyle(
                  fontSize: 25,
                  color: Colors.black54,
                ),
              ),
            ),
            const SizedBox(height: 38),
            TextFormField(
              decoration: const InputDecoration(
                labelText: 'Password',
                labelStyle: TextStyle(
                  fontSize: 25,
                  color: Colors.black54,
                ),
              ),
            ),
            const SizedBox(height: 63),
            SizedBox(
              child: SizedBox(
                width: double.infinity,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(13),
                  child: MaterialButton(
                    onPressed: () {},
                    color: Colors.blue[300],
                    padding: const EdgeInsets.symmetric(vertical: 25),
                    child: const Text(
                      "Log In",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                      ),
                    ),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 30),
            TextButton(
              onPressed: () {},
              child: const Text(
                "Forgot password? No yawa. Tap me",
                style: TextStyle(
                  color: Color.fromARGB(176, 77, 77, 77),
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            const SizedBox(height: 50),
            SizedBox(
              width: double.infinity,
              child: MaterialButton(
                onPressed: () {},
                color: Colors.white54,
                padding: const EdgeInsets.symmetric(vertical: 20),
                child: const Text(
                  "No Account? Sign Up",
                  style: TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                    color: Color.fromARGB(176, 77, 77, 77),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
