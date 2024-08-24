import 'package:flutter/material.dart';
import 'package:illimited_app/services/authentication_service.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(body: Center(child: TextButton(onPressed: () => AuthService().signOut(), child: Text("Signout"),),));
  }
}