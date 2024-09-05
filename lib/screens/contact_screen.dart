import 'dart:developer';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:illimited_app/constant/const.dart';
import 'package:illimited_app/services/authentication_service.dart';
import 'package:illimited_app/widget/primary_button.dart';
import 'package:illimited_app/widget/primary_textfield.dart';
import 'package:flutter_email_sender/flutter_email_sender.dart';

class HelpFormSceen extends StatefulWidget {
  const HelpFormSceen({super.key});

  @override
  State<HelpFormSceen> createState() => _HelpFormSceenState();
}

final _formKey = GlobalKey<FormState>();

class _HelpFormSceenState extends State<HelpFormSceen> {
  late TextEditingController _subjectController;
  late TextEditingController _msgController;

  @override
  void initState() {
    super.initState();
    _subjectController = TextEditingController();
    _msgController = TextEditingController();
  }

  @override
  Widget build(BuildContext context) {
    User? user = FirebaseAuth.instance.currentUser;
    if (user == null) {
      AuthService().signOut();
    }
    return Scaffold(
      appBar: AppBar(
        backgroundColor: primaryColor,
        title: Text(
          "Contact",
          style: getFontStyle(context).copyWith(fontSize: 18),
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 40),
        child: Form(
          key: _formKey,
          child: SingleChildScrollView(
            child: Column(
              children: [
                Text(
                  "How can we help you ?",
                  style: getFontStyle(context)
                      .copyWith(fontSize: 22, color: Colors.black),
                ),
                const SizedBox(
                  height: 30,
                ),
                PrimaryTextfield(
                  maxLines: 1,
                  controller: _subjectController,
                  hintText: "Subject",
                  validator: (txt) {
                    if (txt!.trim().length < 4) {
                      return "Must Contain at least 4 character";
                    } else {
                      return null;
                    }
                  },
                ),
                const SizedBox(
                  height: 20,
                ),
                PrimaryTextfield(
                  minLines: 10,
                  // maxLines: 7,
                  controller: _msgController,
                  hintText: "Type your message",
                  validator: (txt) {
                    if (txt!.trim().length < 10) {
                      return "Must Contain at least 10 character";
                    } else {
                      return null;
                    }
                  },
                ),
                const SizedBox(
                  height: 25,
                ),
                PrimaryButton(
                  text: "Send",
                  onPressed: () async {
                    final Email email = Email(
                      body: '${_msgController.text.trim()})\n\n${user!.displayName}.',
                      subject: _subjectController.text.trim(),
                      recipients: ['joannaplessier@gmail.com'],
                      isHTML: false,
                    );

                    await FlutterEmailSender.send(email);
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
