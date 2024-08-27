import 'package:cloud_firestore/cloud_firestore.dart';
import 'dart:developer';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:illimited_app/constant/const.dart';
import 'package:illimited_app/models/sign_in_result.dart';
import 'package:illimited_app/providers/authentication_provider.dart';
import 'package:illimited_app/providers/questions_provider.dart';
import 'package:illimited_app/providers/user_provider.dart';
import 'package:illimited_app/router/router_names.dart';
import 'package:illimited_app/screens/signin_screen.dart';
import 'package:illimited_app/services/authentication_service.dart';
import 'package:illimited_app/utils/utils.dart';
import 'package:illimited_app/widget/google_sign_button.dart';
import 'package:illimited_app/widget/primary_button.dart';
import 'package:illimited_app/widget/top_snackbar.dart';
import 'package:lottie/lottie.dart';
import 'package:modern_textfield/modern_textfield.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:provider/provider.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _confirmePasswordController = TextEditingController();
  final _fNameController = TextEditingController();
  final _lNameController = TextEditingController();

  bool isValidEmail(String? value) {
    final emailRegExp = RegExp(r'^[^@]+@[^@]+\.[^@]+');
    if (value == null || value.isEmpty || !emailRegExp.hasMatch(value)) {
      return false;
    } else {
      return true;
    }
  }

  bool isValidFirstName(String? value) {
    if (value == null || value.isEmpty || value.length < 2) {
      return false;
    } else {
      return true;
    }
  }

  bool isValidLastName(String? value) {
    if (value == null || value.isEmpty || value.length < 2) {
      return false;
    } else {
      return true;
    }
  }

  bool isValidPassword(String? value) {
    if (value == null || value.isEmpty || value.length < passwordMinLength) {
      return false;
    } else {
      return true;
    }
  }

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final authProvider =
        Provider.of<AuthenticationProvider>(context, listen: true);

    return PopScope(
      canPop: false,
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: Stack(
          children: [
            Lottie.asset(
              'assets/lottie/lottie_bg1.json',
              fit: BoxFit
                  .cover, // Ensures the animation covers the entire background
              width: double.infinity,
              height: double.infinity,
            ),
            Padding(
              padding: const EdgeInsets.all(12),
              child: SingleChildScrollView(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(
                      height: getScreenHeight(context) * 0.05,
                    ),
                    Text(
                      "Sign Up",
                      style: getFontStyle(context)
                          .copyWith(fontSize: 40, fontWeight: FontWeight.w800),
                    ),
                    SizedBox(
                      height: getScreenHeight(context) * 0.05,
                    ),
                    ModernTextField(
                      textFieldTextStyle:
                          getFontStyle(context).copyWith(color: Colors.black),
                      textEditingController: _fNameController,
                      iconBackgroundColor: primaryColor,
                      borderRadius: 20,
                      customTextFieldIcon: const Icon(
                        Icons.person_rounded,
                        color: Colors.white,
                      ),
                      hintText: "First Name",
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    ModernTextField(
                      textFieldTextStyle:
                          getFontStyle(context).copyWith(color: Colors.black),
                      textEditingController: _lNameController,
                      iconBackgroundColor: primaryColor,
                      borderRadius: 20,
                      customTextFieldIcon: const Icon(
                        Icons.person_rounded,
                        color: Colors.white,
                      ),
                      hintText: "Last Name",
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    ModernTextField(
                      textFieldTextStyle:
                          getFontStyle(context).copyWith(color: Colors.black),
                      textEditingController: _emailController,
                      iconBackgroundColor: Colors.orange,
                      borderRadius: 20,
                      customTextFieldIcon: const Icon(
                        Icons.email_rounded,
                        color: Colors.white,
                      ),
                      hintText: "Enter Your Email",
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    ModernTextField(
                      isPasswordField: true,
                      textFieldTextStyle:
                          getFontStyle(context).copyWith(color: Colors.black),
                      textEditingController: _passwordController,
                      iconBackgroundColor: Colors.pink,
                      borderRadius: 20,
                      customTextFieldIcon: const Icon(
                        Icons.lock_rounded,
                        color: Colors.white,
                      ),
                      hintText: "Enter Your Password",
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    ModernTextField(
                      isPasswordField: true,
                      textFieldTextStyle:
                          getFontStyle(context).copyWith(color: Colors.black),
                      textEditingController: _confirmePasswordController,
                      iconBackgroundColor: Colors.pink,
                      borderRadius: 20,
                      customTextFieldIcon: const Icon(
                        Icons.lock_rounded,
                        color: Colors.white,
                      ),
                      hintText: "Confirme Password",
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: PrimaryButton(
                        text: "Sign Up",
                        onPressed: () async {
                          if (!isValidFirstName(_fNameController.text.trim())) {
                            mySnackBar(
                                context: context,
                                message:
                                    "First Name Must be at least 6 character",
                                snackBarType: SnackBarType.failure);
                          } else if (!isValidFirstName(
                              _lNameController.text.trim())) {
                            mySnackBar(
                                context: context,
                                message:
                                    "Last Name Must be at least 6 character",
                                snackBarType: SnackBarType.failure);
                          } else if (!isValidEmail(
                              _emailController.text.trim())) {
                            mySnackBar(
                                context: context,
                                message: "Invalid Email",
                                snackBarType: SnackBarType.failure);
                          } else if (!isValidPassword(
                              _passwordController.text)) {
                            mySnackBar(
                                context: context,
                                message:
                                    "Password Must be at least 6 character",
                                snackBarType: SnackBarType.failure);
                          } else {
                            if (_confirmePasswordController.text ==
                                _passwordController.text) {
                              UserCredential? userCreds = await AuthService()
                                  .signUpWithEmailAndPassword(
                                      context,
                                      _emailController.text.trim(),
                                      _passwordController.text);
                              if (userCreds != null) {
                                FirebaseFirestore.instance
                                    .collection('users')
                                    .doc(userCreds.user!.uid)
                                    .set({
                                  "age": "",
                                  "country": "",
                                  "firstname": _fNameController.text,
                                  "lastname": _lNameController.text,
                                  "gender": "",
                                  "improvement_preference": "",
                                  "isQuestionsAnswered": false,
                                }).then((value) {
                                  print("User added successfully!");

                                  context
                                      .read<UserProvider>()
                                      .setUserId(userCreds.user!.uid);
                                }).catchError(
                                  (error) =>
                                      print("Failed to add user: $error"),
                                );

                                userCreds.user!.sendEmailVerification().then(
                                  (value) {
                                    context.goNamed(
                                        RouteNames.emailVerificationMessage);
                                  },
                                ).onError(
                                  (error, stackTrace) {
                                    log("ERROR SENDING THE EMAIL VERIFICATION : $error");
                                  },
                                );
                                log("Email Sent");
                              }
                            } else {
                              mySnackBar(
                                  context: context,
                                  message: "Password Confirmation is not match",
                                  snackBarType: SnackBarType.failure);
                            }
                          }
                        },
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SizedBox(
                          child: Divider(),
                          width: getScreenWidth(context) * 0.4,
                        ),
                        const SizedBox(
                          width: 5,
                        ),
                        Text(
                          "Or",
                          style: getFontStyle(context),
                        ),
                        const SizedBox(
                          width: 5,
                        ),
                        SizedBox(
                          child: Divider(),
                          width: getScreenWidth(context) * 0.4,
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    SizedBox(
                      width: getScreenWidth(context) * 0.7,
                      child: GoogleSignButton(
                        isBold: true,
                        onPressed: () async {
                          context
                              .read<AuthenticationProvider>()
                              .setIsAuthenticating(true);

                          SignInResult? res =
                              await AuthService().signInWithGoogle();
                          if (res != null) {
                            context
                                .read<AuthenticationProvider>()
                                .setIsAuthenticating(false);
                            mySnackBar(
                                context: context,
                                message: "Successully Signed In");
                            await Future.delayed(
                              const Duration(milliseconds: 1000),
                            );

                            if (res.isNewUser) {
                              FirebaseFirestore.instance
                                  .collection('users')
                                  .doc(res.user!.uid)
                                  .set({
                                "age": "",
                                "country": "",
                                "firstname":
                                    res.user!.displayName!.split(" ")[0],
                                "lastname":
                                    res.user!.displayName!.split(" ")[1],
                                "gender": "",
                                "improvement_preference": "",
                                "isQuestionsAnswered": false,
                              }).then((value) {
                                print("User signed up successfully!");

                                context
                                    .read<UserProvider>()
                                    .setUserId(res.user!.uid);
                              }).catchError(
                                (error) => print(
                                    "Failed to sign up with google auth : $error"),
                              );

                              context.goNamed(RouteNames.question);
                            } else {
                              // context.goNamed(RouteNames.home);
                              FirebaseFirestore.instance
                                  .collection('users')
                                  .doc(res.user!.uid)
                                  .get()
                                  .then((DocumentSnapshot documentSnapshot) {
                                if (documentSnapshot.exists) {
                                  Map<String, dynamic>? userData =
                                      documentSnapshot.data()
                                          as Map<String, dynamic>?;

                                  context
                                      .read<UserProvider>()
                                      .setUserId(res.user!.uid);
                                  context.read<UserProvider>().setQuestionFlag(
                                      userData!["isQuestionsAnswered"] as bool);

                                  if (context
                                      .read<UserProvider>()
                                      .isQuestionsAnswered) {
                                    context.goNamed(RouteNames.home);
                                  } else {
                                    context.goNamed(RouteNames.question);
                                  }
                                } else {
                                  print('No user found with this ID.');
                                }
                              }).catchError((error) {
                                print('Failed to retrieve user data: $error');
                              });
                            }
                          } else {
                            context
                                .read<AuthenticationProvider>()
                                .setIsAuthenticating(false);
                            mySnackBar(
                                context: context,
                                message: "Authentication Failed",
                                snackBarType: SnackBarType.failure);
                            // loadingProvider.hide();
                          }
                        },
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Text(
                      "Already have an account ?",
                      style: getFontStyle(context),
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    InkWell(
                      onTap: () {
                        Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: (context) => SignInScreen(),
                          ),
                        );
                      },
                      child: Text(
                        "Sign In",
                        style: getFontStyle(context).copyWith(
                            fontSize: 20,
                            color: Colors.cyan,
                            decoration: TextDecoration.underline,
                            decorationColor: Colors.cyan),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Visibility(
              visible: authProvider.isAuthenticating,
              child: Positioned(
                top: 0,
                bottom: 0,
                right: 0,
                left: 0,
                child: Container(
                  color: Colors.black.withOpacity(0.5),
                  child: const SpinKitFoldingCube(
                    color: Colors.white,
                    size: 50.0,
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
