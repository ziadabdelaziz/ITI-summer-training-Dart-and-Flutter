import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Title"),
        backgroundColor: Colors.orange,
        centerTitle: true,
      ),
      body: SizedBox(
        width: double.infinity,
        child: Column(
          children: [
            const Text(
              "Hello in home screen",
              style: TextStyle(color: Colors.red, fontSize: 30),
            ),
            const Icon(
              Icons.person,
              color: Colors.red,
              size: 50,
            ),
            const Padding(
              padding: EdgeInsets.all(10),
              child: TextField(),
            ),
            Container(
              width: 100,
              height: 100,
              child: Image.asset('assets/dart.png'),
            ),
          ],
        ),
      ),
    );
  }
}
