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

class SignInScreen extends StatefulWidget {
  const SignInScreen({super.key});

  @override
  State<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  bool isValidEmail(String? value) {
    final emailRegExp = RegExp(r'^[^@]+@[^@]+\.[^@]+');
    if (value == null || value.isEmpty || !emailRegExp.hasMatch(value)) {
      return false;
    } else {
      return true;
    }
  }

  bool isValidPassword(String? value) {
    if (value == null || value.isEmpty || value.length < 8) {
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
                        "Sign In",
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
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: PrimaryButton(
                          text: "Sign In",
                          onPressed: () async {
                            if (!isValidEmail(_emailController.text.trim())) {
                              mySnackBar(
                                  context: context,
                                  message: "Invalid Email",
                                  snackBarType: SnackBarType.failure);
                            } else if (!isValidPassword(
                                _passwordController.text)) {
                              mySnackBar(
                                  context: context,
                                  message:
                                      "Password Must be at least 8 character",
                                  snackBarType: SnackBarType.failure);
                            } else {
                              UserCredential? userCrendential =
                                  await AuthService()
                                      .signInWithEmailAndPassword(
                                          context,
                                          _emailController.text.trim(),
                                          _passwordController.text);
                              if (userCrendential != null) {
                                if (FirebaseAuth
                                    .instance.currentUser!.emailVerified) {
                                  mySnackBar(
                                      context: context,
                                      message: "Succefully Signed In");
                                  context.goNamed(RouteNames.home);
                                } else {
                                  showEmailVerificationDialog(
                                    context:  context,
                                    message: "Your Email Has a Pending Verification",
                                    subtitle: "Didn't receive a verification email ?",
                                    verifyButtonCallBack: () {
                                      userCrendential.user!
                                          .sendEmailVerification()
                                          .then(
                                        (value) {
                                          mySnackBar(
                                              context: context,
                                              message:
                                                  "Email Verification Sent",
                                              snackBarType: SnackBarType.info);
                                          // context.goNamed(RouteNames.signin);
                                        },
                                      ).onError(
                                        (error, stackTrace) {
                                          log("ERROR SENDING THE EMAIL VERIFICATION : $error" );
                                          mySnackBar(
                                              context: context,
                                              message:
                                                  "Something Went Wrong, Please Try Again Later",
                                              snackBarType: SnackBarType.info);
                                        },
                                      );
                                    },
                                  );
                                }
                              }
                            }
                          },
                          // onPressed: () {
                            
                          //   showEmailVerificationDialog(
                          //           context:  context,
                          //           message: "Your Email Has a Pending Verification",
                          //           subtitle: "Didn't receive a verification email ?",
                          //           verifyButtonCallBack: () {
                          //             FirebaseAuth.instance.currentUser!
                          //                 .sendEmailVerification()
                          //                 .then(
                          //               (value) {
                          //                 mySnackBar(
                          //                     context: context,
                          //                     message:
                          //                         "Email Verification Sent",
                          //                     snackBarType: SnackBarType.info);
                          //                     // context.pop();
                          //                 // context.goNamed(RouteNames.signin);
                          //               },
                                        
                          //             ).onError(
                          //               (error, stackTrace) {
                          //                 log("ERROR SENDING THE EMAIL VERIFICATION : $error" );
                          //                 mySnackBar(
                          //                     context: context,
                          //                     message:
                          //                         "Something Went Wrong, Please Try Again Later",
                          //                     snackBarType: SnackBarType.info);
                          //               },
                          //             );
                          //           },
                          //         );
                          // },
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
                          SizedBox(
                            width: 5,
                          ),
                          Text(
                            "Or",
                            style: getFontStyle(context),
                          ),
                          SizedBox(
                            width: 5,
                          ),
                          SizedBox(
                            child: Divider(),
                            width: getScreenWidth(context) * 0.4,
                          ),
                        ],
                      ),
                      SizedBox(
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
                                const Duration(milliseconds: 1200),
                              );
                              log("lala");
                              context.goNamed(RouteNames.home);

                              if (res.isNewUser) {
                                context.goNamed(RouteNames.question);
                              } else {
                                context.goNamed(RouteNames.home);
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
                      SizedBox(
                        height: 20,
                      ),
                      Text(
                        "Don't have an account ?",
                        style: getFontStyle(context),
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      InkWell(
                        onTap: () {
                          Navigator.of(context).push(
                            MaterialPageRoute(
                              builder: (context) => SignUpScreen(),
                            ),
                          );
                        },
                        child: Text(
                          "Sign Up",
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
