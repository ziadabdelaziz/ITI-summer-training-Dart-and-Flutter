// import 'package:flutter/material.dart';
// import 'package:todo_app/views/screens/profile_screen.dart';
// import 'package:todo_app/views/screens/settings_screen.dart';
// import './home_screen.dart';

// class NavigationScreen extends StatefulWidget {
//   final String email;
//   final String image;

//   NavigationScreen({
//     required this.image,
//     required this.email,
//     super.key,
//   });

//   @override
//   State<NavigationScreen> createState() => _NavigationScreenState();
// }

// class _NavigationScreenState extends State<NavigationScreen> {
//   final List<Map<String, Object>> screens = [
//     {"body": const HomeScreen(), "title": "Home"},
//     {"body": const ProfileScreen(), "title": "Profile"},
//     {"body": const SettingsScreen(), "title": "Settings"}
//   ];

//   int _selectedIndex = 0;

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text(screens[_selectedIndex]["title"] as String),
//         actions: [
//           Text(widget.email),
//           const SizedBox(width: 5),
//           ClipRRect(
//             borderRadius: BorderRadius.circular(50),
//             child: Image.asset(widget.image, width: 30),
//           ),
//           const SizedBox(width: 15),
//         ],
//       ),
//       bottomNavigationBar: BottomNavigationBar(
//         items: const [
//           BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
//           BottomNavigationBarItem(icon: Icon(Icons.person), label: "Profile"),
//           BottomNavigationBarItem(
//               icon: Icon(Icons.settings), label: "Settings"),
//         ],
//         currentIndex: _selectedIndex,
//         onTap: (index) {
//           _selectedIndex = index;
//           setState(() {});
//         },
//       ),
//       body: screens[_selectedIndex]["body"] as Widget,
//     );
//   }
// }
