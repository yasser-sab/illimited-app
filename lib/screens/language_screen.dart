import 'dart:developer';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:illimited_app/constant/const.dart';
import 'package:illimited_app/main.dart';
import 'package:illimited_app/models/language.dart';
import 'package:illimited_app/providers/language_provider.dart';
import 'package:illimited_app/services/notification_service.dart';
import 'package:illimited_app/utils/utils.dart';
import 'package:illimited_app/widget/language_button.dart';
import 'package:illimited_app/widget/primary_button.dart';
import 'package:illimited_app/widget/top_snackbar.dart';
import 'package:provider/provider.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class LanguageScreen extends StatefulWidget {
  const LanguageScreen({super.key});
  @override
  State<LanguageScreen> createState() => _LanguageScreenState();
}

class _LanguageScreenState extends State<LanguageScreen> {
  String _currentLanguageCode = "fr";
  @override
  void initState() {
    super.initState();
    log(_currentLanguageCode);
  }

  @override
  Widget build(BuildContext context) {
    final languageProvider = Provider.of<LanguageProvider>(context);
    _currentLanguageCode = Localizations.localeOf(context).languageCode;

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        foregroundColor: Colors.white,
        toolbarHeight: 80,
        backgroundColor: primaryColor,
        centerTitle: true,
        leading: IconButton(
          icon: Icon(Icons.arrow_back_rounded),
          onPressed: () {
            languageProvider.setSelectedLanguage(_currentLanguageCode);
            context.pop();
          },
        ),
        title: Text(
          AppLocalizations.of(context)!.changeLanguage,
          style: GoogleFonts.roboto().copyWith(
            fontSize: 27,
            letterSpacing: 1.5,
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(15),
        child: Column(
          children: [
            Expanded(
              child: ListView(
                children: Language.languageList().map(
                  (lang) {
                    return LanguageButton(
                      lang: lang,
                      onTap: () {
                        setState(() async {
                          languageProvider
                              .setSelectedLanguage(lang.languageCode);
                          MyApp.setLocale(context, Locale(lang.languageCode));
                          if (FirebaseAuth.instance.currentUser != null) {
                            await NotificationService()
                                .cancelAllNotifications();
                            await NotificationService()
                                .scheduleMorningNotification(context);
                            await NotificationService()
                                .scheduleNightNotification(context);
                            await NotificationService()
                                .scheduleRemainders(context);
                          }
                        });
                      },
                    );
                  },
                ).toList(),
              ),
            ),
            // Spacer(),
            PrimaryButton(
              text: AppLocalizations.of(context)!.save,
              onPressed: () {
                saveLanguage(context);
                mySnackBar(
                    context: context,
                    message: AppLocalizations.of(context)!.languageSaved);
                context.pop();
              },
            )
          ],
        ),
      ),
    );
  }
}
