// import 'package:flutter/material.dart';
// import 'package:shared_preferences/shared_preferences.dart';

// class ProfileScreen extends StatefulWidget {
//   const ProfileScreen({super.key});

//   @override
//   State<ProfileScreen> createState() => _ProfileScreenState();
// }

// class _ProfileScreenState extends State<ProfileScreen> {
//   String _userEmail = 'first';

//   @override
//   void initState() {
//     super.initState();
//     getEmail();                                                                                                                                                               
//   }

//   getEmail() async {
//     final SharedPreferences prefs = await SharedPreferences.getInstance();
//     _userEmail = prefs.getString('email') ?? "--";
//     setState(() {});
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Center(child: Text(_userEmail)
//           // child: Column(children: [
//           //   const SizedBox(height: 20),
//           //   ClipRRect(
//           //     borderRadius: BorderRadius.circular(50),
//           //     child: Image.asset(image, width: 100),
//           //   ),
//           //   const SizedBox(height: 10),
//           //   Text(email),
//           // ]),
//           ),
//     );
//   }
// }
