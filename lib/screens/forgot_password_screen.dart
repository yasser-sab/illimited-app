import 'dart:developer';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:illimited_app/constant/const.dart';
import 'package:illimited_app/models/sign_in_result.dart';
import 'package:illimited_app/providers/authentication_provider.dart';
import 'package:illimited_app/router/router_names.dart';
import 'package:illimited_app/screens/sign_up_screen.dart';
import 'package:illimited_app/services/authentication_service.dart';
import 'package:illimited_app/utils/utils.dart';
import 'package:illimited_app/widget/google_sign_button.dart';
import 'package:illimited_app/widget/primary_button.dart';
import 'package:illimited_app/widget/top_snackbar.dart';
import 'package:lottie/lottie.dart';
import 'package:modern_textfield/modern_textfield.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:provider/provider.dart';

class ResetPassword extends StatefulWidget {
  const ResetPassword({super.key});

  @override
  State<ResetPassword> createState() => _ResetPasswordState();
}

class _ResetPasswordState extends State<ResetPassword> {
  final _emailController = TextEditingController();

  bool isValidEmail(String? value) {
    final emailRegExp = RegExp(r'^[^@]+@[^@]+\.[^@]+');
    if (value == null || value.isEmpty || !emailRegExp.hasMatch(value)) {
      return false;
    } else {
      return true;
    }
  }

  @override
  void dispose() {
    _emailController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: true,
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: Stack(
          children: [
            Lottie.asset(
              'assets/lottie/lottie_bg1.json',
              fit: BoxFit.cover,
              width: double.infinity,
              height: double.infinity,
            ),
            Padding(
              padding: const EdgeInsets.all(12),
              child: SingleChildScrollView(
                child: Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const SizedBox(
                        height: 40,
                      ),
                      Text(
                        "Password Reset",
                        style: getFontStyle(context).copyWith(
                            fontSize: 40, fontWeight: FontWeight.w800),
                      ),
                      SizedBox(
                        height: getScreenHeight(context) * 0.05,
                      ),
                      ModernTextField(
                        textFieldTextStyle:
                            getFontStyle(context).copyWith(color: Colors.black),
                        textEditingController: _emailController,
                        iconBackgroundColor: primaryColor,
                        borderRadius: 20,
                        customTextFieldIcon: const Icon(
                          Icons.email_rounded,
                          color: Colors.white,
                        ),
                        hintText: "Enter Your Email",
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: PrimaryButton(
                          text: "Reset",
                          onPressed: () async {
                            if (!isValidEmail(_emailController.text.trim())) {
                              mySnackBar(
                                  context: context,
                                  message: "Invalid Email",
                                  snackBarType: SnackBarType.failure);
                            } else {
                              FirebaseAuth.instance
                                  .sendPasswordResetEmail(
                                      email: _emailController.text.trim())
                                  .then(
                                (value) {
                                  mySnackBar(
                                      context: context,
                                      message:
                                          "We sent you a password reset email",
                                      snackBarType: SnackBarType.info);
                                },
                              ).onError((error, stackTrace) {
                                log("Can't send password reset : $error");
                                mySnackBar(
                                      context: context,
                                      message:
                                          "Something went wrong wrong",
                                      snackBarType: SnackBarType.info);
                              },);

                              await Future.delayed(
                                const Duration(
                                    milliseconds: 2000), // 30 seconds
                              );
                              context.goNamed(RouteNames.signin);
                            }
                          },
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
