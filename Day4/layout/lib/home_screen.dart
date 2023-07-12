import 'package:flutter/material.dart';
import './my_button.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("HomeScreen"),
        backgroundColor: Colors.amber,
      ),
      body: Container(
        width: double.infinity,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const SizedBox(),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Container(
                  color: Colors.blue,
                  width: 100,
                  height: 200,
                ),
                Container(
                  color: Colors.green,
                  width: 100,
                  height: 150,
                ),
              ],
            ),
            Container(
              height: 45,
              width: 150,
              decoration: BoxDecoration(
                color: Colors.blueGrey,
                borderRadius: BorderRadius.circular(25),
              ),
              child: const Center(child: Text("Click me")),
            ),
            const MyButton(label: "Don't click me"),
            const MyButton(label: "You've been worned"),
            Container(
              color: Colors.red,
              width: 70,
              height: 50,
            ),
          ],
        ),
      ),
    );
  }
}
