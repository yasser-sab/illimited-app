import 'dart:developer';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:illimited_app/providers/questions_provider.dart';
import 'package:illimited_app/router/router_names.dart';
import 'package:illimited_app/services/authentication_service.dart';
import 'package:illimited_app/utils/utils.dart';
import 'package:illimited_app/widget/drawer_button.dart';
import 'package:illimited_app/widget/profile_frame.dart';
import 'package:provider/provider.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:url_launcher/url_launcher.dart';

class EndDrawerContent extends StatelessWidget {
  const EndDrawerContent({super.key});

  @override
  Widget build(BuildContext context) {
    User? user = FirebaseAuth.instance.currentUser;

    if (user == null) {
      AuthService().signOut();
    }

    return Stack(
      children: [
        Visibility(
          visible: true,
          child: SafeArea(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ProfileFrame(
                    size: 80,
                    image: user!.photoURL,
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  GestureDetector(
                    child: Text(
                      user.displayName!.toUpperCase(),
                      style: GoogleFonts.chakraPetch().copyWith(
                          fontSize: 25, color: Colors.black, letterSpacing: 1),
                    ),
                    onTap: () => log(user.uid),
                  ),
                  const SizedBox(
                    height: 8,
                  ),
                  const Divider(),
                  const SizedBox(
                    height: 10,
                  ),
                  DrawerIconButton(
                    iconPath: "assets/icon/profile.png",
                    text: AppLocalizations.of(context)!.profile,
                    onPressed: () {
                      context.pushNamed(RouteNames.profile);
                    },
                  ),
                  DrawerIconButton(
                    iconPath: "assets/icon/diamond.png",
                    text: AppLocalizations.of(context)!.upgrade,
                    onPressed: () {
                      showPurchaseBottomSheet(context);
                    },
                  ),
                  DrawerIconButton(
                    iconPath: "assets/icon/customer.png",
                    text: AppLocalizations.of(context)!.contact,
                    onPressed: () {
                      context.pushNamed(RouteNames.contact);
                    },
                  ),
                  DrawerIconButton(
                    iconPath: "assets/icon/language.png",
                    text: AppLocalizations.of(context)!.languages,
                    onPressed: () {
                      context.pushNamed(RouteNames.language);
                    },
                  ),
                  DrawerIconButton(
                    iconPath: "assets/icon/goal.png",
                    text: AppLocalizations.of(context)!.goals,
                    onPressed: () {
                      context.pushNamed(RouteNames.goal);
                    },
                  ),
                  DrawerIconButton(
                    iconPath: "assets/icon/forum.png",
                    text: AppLocalizations.of(context)!.forum,
                    onPressed: () {
                      _openLink();
                    },
                  ),
                  DrawerIconButton(
                    iconPath: "assets/icon/terms-and-conditions.png",
                    text: AppLocalizations.of(context)!.terms_title,
                    onPressed: () =>
                        {context.pushNamed(RouteNames.termsConditions)},
                  ),
                  DrawerIconButton(
                    iconPath: "assets/icon/pricacy.png",
                    text: AppLocalizations.of(context)!.privacyPolicy,
                    onPressed: () {
                      context.pushNamed(RouteNames.privacyPolicy);
                    },
                  ),
                  const Spacer(),
                  const Divider(),
                  DrawerIconButton(
                    iconPath: "assets/icon/shutdown.png",
                    text: AppLocalizations.of(context)!.logOut,
                    color: Colors.red,
                    onPressed: () {
                      AuthService().signOut();
                    },
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }

  Future<void> _openLink() async {
    Uri _url = Uri.parse('https://illimites.ca/forum');
    if (!await launchUrl(_url)) {
      throw Exception('Could not launch $_url');
    }
  }
}
