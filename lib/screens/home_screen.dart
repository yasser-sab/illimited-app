import 'dart:developer';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:illimited_app/providers/questions_provider.dart';
import 'package:illimited_app/services/authentication_service.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
      child: TextButton(
        onPressed: () {
          AuthService().signOut();
          context.read<QuestionProvider>().resetProvider();
        },
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("Email : ${FirebaseAuth.instance.currentUser!.email}"),
            Text("Signout"),
          ],
        ),
      ),
    ));
  }
}
