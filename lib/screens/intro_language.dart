import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:illimited_app/constant/const.dart';
import 'package:illimited_app/main.dart';
import 'package:illimited_app/models/language.dart';
import 'package:illimited_app/providers/language_provider.dart';
import 'package:illimited_app/router/router_names.dart';
import 'package:illimited_app/utils/utils.dart';
import 'package:illimited_app/widget/language_button.dart';
import 'package:illimited_app/widget/primary_button.dart';
import 'package:illimited_app/widget/top_snackbar.dart';
import 'package:provider/provider.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class IntroLanguage extends StatefulWidget {
  const IntroLanguage({super.key});
  @override
  State<IntroLanguage> createState() => _IntroLanguageState();
}

class _IntroLanguageState extends State<IntroLanguage> {
  String _currentLanguageCode = "en";
  @override
  void initState() {
    super.initState();
   

    _currentLanguageCode = context.read<LanguageProvider>().selectedLanguage;
  }

  Future<void> setFalseFirstLaunch() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setBool("isFirstLaunch", false);
  }

  @override
  Widget build(BuildContext context) {
    final languageProvider = Provider.of<LanguageProvider>(context);

    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.all(15),
        child: Column(
          children: [
            const SizedBox(
              height: 60,
            ),
            Text(
              AppLocalizations.of(context)!.chooseYourLanguage,
              style: getFontStyle(context).copyWith(color: Colors.black),
            ),
                        
            const SizedBox(
              height: 30,
            ),
            SizedBox(width: 120, child: Image.asset("assets/icon/lang1.png")),


            Expanded(
              child: ListView(
                children: Language.languageList().map(
                  (lang) {
                    return LanguageButton(
                      lang: lang,
                      onTap: () {
                        setState(() {
                          languageProvider
                              .setSelectedLanguage(lang.languageCode);
                          MyApp.setLocale(context, Locale(lang.languageCode));
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
                 setFalseFirstLaunch();
                saveLanguage(context);
                mySnackBar(context: context, message: AppLocalizations.of(context)!.languageSaved);
                context.goNamed(RouteNames.getStarted);
              },
            )
          ],
        ),
      ),
    );
  }
}
