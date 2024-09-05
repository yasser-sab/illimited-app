import 'dart:developer';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:illimited_app/providers/questions_provider.dart';
import 'package:illimited_app/router/router_names.dart';
import 'package:illimited_app/services/authentication_service.dart';
import 'package:illimited_app/widget/drawer_button.dart';
import 'package:illimited_app/widget/profile_frame.dart';
import 'package:provider/provider.dart';

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
                    image: user!.photoURL,
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  GestureDetector(
                    child: Text(
                      user.displayName!.toUpperCase(),
                      style: GoogleFonts.chakraPetch().copyWith(
                          fontSize: 28, color: Colors.black, letterSpacing: 1),
                    ),
                    onTap: () => log(user.uid),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  const Divider(),
                  const SizedBox(
                    height: 20,
                  ),
                  DrawerIconButton(
                    iconPath: "assets/icon/profile.png",
                    text: "Profile",
                    onPressed: () {
                      context.pushNamed(RouteNames.profile);
                    },
                  ),
                  DrawerIconButton(
                    iconPath: "assets/icon/customer.png",
                    text: "Contact",
                    onPressed: () {
                      context.pushNamed(RouteNames.contact);
                    },
                  ),
                  DrawerIconButton(
                    iconPath: "assets/icon/language.png",
                    text: "Languages",
                    onPressed: () => {},
                  ),
                  DrawerIconButton(
                    iconPath: "assets/icon/goal.png",
                    text: "Goals",
                    onPressed: () => {},
                  ),
                  DrawerIconButton(
                    iconPath: "assets/icon/forum.png",
                    text: "Forum",
                    onPressed: () => {},
                  ),
                  const Spacer(),
                  const Divider(),
                  DrawerIconButton(
                    iconPath: "assets/icon/shutdown.png",
                    text: "Log out",
                    color: Colors.red,
                    onPressed: () {
                      AuthService().signOut();
                      context.read<QuestionProvider>().resetProvider();
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
}
