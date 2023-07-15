import 'package:flutter/material.dart';
import 'package:lab4/screens/profile_screen.dart';
import 'package:lab4/screens/settings_screen.dart';
import './home_screen.dart';

class NavigationScreen extends StatelessWidget {
  final String email;
  final String image;

  NavigationScreen({
    required this.image,
    required this.email,
    super.key,
  });

  final List<Widget> screens = [
    const ProfileScreen(),
    const HomeScreen(),
    const SettingsScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Profile"),
        actions: [
          Text(email),
          const SizedBox(width: 5),
          ClipRRect(
            borderRadius: BorderRadius.circular(50),
            child: Image.asset(image, width: 30),
          ),
          const SizedBox(width: 15),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(items: const [
        BottomNavigationBarItem(icon: Icon(Icons.person), label: "Profile"),
        BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
        BottomNavigationBarItem(icon: Icon(Icons.settings), label: "Settings"),
      ]),
      body: Center(
        child: Column(children: [
          const SizedBox(height: 20),
          ClipRRect(
            borderRadius: BorderRadius.circular(50),
            child: Image.asset(image, width: 100),
          ),
          const SizedBox(height: 10),
          Text(email),
        ]),
      ),
    );
  }
}
