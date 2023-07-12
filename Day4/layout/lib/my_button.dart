import 'package:flutter/material.dart';

class MyButton extends StatelessWidget {
  final String label;
  const MyButton({required this.label, super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 45,
      width: 150,
      decoration: BoxDecoration(
        color: Colors.blueGrey,
        borderRadius: BorderRadius.circular(25),
      ),
      child: Center(child: Text(label)),
    );
  }
}
