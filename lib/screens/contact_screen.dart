import 'dart:developer';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:illimited_app/constant/const.dart';
import 'package:illimited_app/services/authentication_service.dart';
import 'package:illimited_app/widget/primary_button.dart';
import 'package:illimited_app/widget/primary_textfield.dart';
import 'package:flutter_email_sender/flutter_email_sender.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

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
          AppLocalizations.of(context)!.contact,
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
                  AppLocalizations.of(context)!.howCanWeHelpYou,
                  style: getFontStyle(context)
                      .copyWith(fontSize: 22, color: Colors.black),
                ),
                const SizedBox(
                  height: 30,
                ),
                PrimaryTextfield(
                  maxLines: 1,
                  controller: _subjectController,
                  hintText: AppLocalizations.of(context)!.subject,
                  validator: (txt) {
                    if (txt!.trim().length < 4) {
                      return AppLocalizations.of(context)!
                          .mustContainAtLeast4Chars;
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
                  hintText: AppLocalizations.of(context)!.typeYourMessage,
                  validator: (txt) {
                    if (txt!.trim().length < 10) {
                      return AppLocalizations.of(context)!
                          .mustContainAtLeast10Chars;
                    } else {
                      return null;
                    }
                  },
                ),
                const SizedBox(
                  height: 25,
                ),
                PrimaryButton(
                  text: AppLocalizations.of(context)!.send,
                  onPressed: () async {
                    final Email email = Email(
                      body:
                          '${_msgController.text.trim()})\n\n${user!.displayName}.',
                      subject: _subjectController.text.trim(),
                      recipients: ['joannaplessier@gmail.com'],
                      isHTML: false,
                    );

                    await FlutterEmailSender.send(email);
                  },
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Text(
                    AppLocalizations.of(context)!.afterClickSendRedirect,
                    textAlign: TextAlign.center,
                    style: GoogleFonts.roboto(
                        color: Colors.black.withOpacity(0.4),
                        fontSize: 13,
                        fontWeight: FontWeight.w400),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
