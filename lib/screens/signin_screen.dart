import 'dart:developer';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:illimited_app/constant/const.dart';
import 'package:illimited_app/models/sign_in_result.dart';
import 'package:illimited_app/providers/authentication_provider.dart';
import 'package:illimited_app/router/router_names.dart';
import 'package:illimited_app/screens/sign_up_screen.dart';
import 'package:illimited_app/services/authentication_service.dart';
import 'package:illimited_app/services/user_repository.dart';
import 'package:illimited_app/utils/utils.dart';
import 'package:illimited_app/widget/google_sign_button.dart';
import 'package:illimited_app/widget/primary_button.dart';
import 'package:illimited_app/widget/top_snackbar.dart';
import 'package:lottie/lottie.dart';
import 'package:modern_textfield/modern_textfield.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:provider/provider.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
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

  // bool isValidPassword(String? value) {
  //   if (value == null || value.isEmpty || value.length < 8) {
  //     return false;
  //   } else {
  //     return true;
  //   }
  // }

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
                        AppLocalizations.of(context)!.signIn,
                        style: getFontStyle(context).copyWith(
                            fontSize: 40, fontWeight: FontWeight.w800),
                      ),
                      SizedBox(
                        height: getScreenHeight(context) * 0.05,
                      ),
                      ModernTextField(
                        textFieldTextStyle:
                            Theme.of(context).textTheme.labelLarge,
                        textEditingController: _emailController,
                        iconBackgroundColor: primaryColor,
                        borderRadius: 20,
                        customTextFieldIcon: const Icon(
                          Icons.email_rounded,
                          color: Colors.white,
                        ),
                        hintText: AppLocalizations.of(context)!.enterYourEmail,
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      ModernTextField(
                        isPasswordField: true,
                        textFieldTextStyle:
                            Theme.of(context).textTheme.labelLarge,
                        textEditingController: _passwordController,
                        iconBackgroundColor: Colors.pink,
                        borderRadius: 20,
                        customTextFieldIcon: const Icon(
                          Icons.lock_rounded,
                          color: Colors.white,
                        ),
                        
                        hintText: AppLocalizations.of(context)!.enterYourPassword,
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: PrimaryButton(
                          text: AppLocalizations.of(context)!.signIn,
                          isBold: true,
                          onPressed: () async {
                            UserCredential? userCrendential =
                                await AuthService().signInWithEmailAndPassword(
                                    context,
                                    _emailController.text.trim(),
                                    _passwordController.text);
                            if (userCrendential != null) {
                              if (FirebaseAuth
                                  .instance.currentUser!.emailVerified) {
                                mySnackBar(
                                    context: context,
                                    message: AppLocalizations.of(context)!.successfullySignedIn);

                                UserRepository().getQuestionFlag().then(
                                  (isAnsweredQuestions) {
                                    if (isAnsweredQuestions) {
                                      context.goNamed(RouteNames.dashboard);
                                    } else {
                                      context.goNamed(RouteNames.question);
                                    }
                                  },
                                );
                              } else {
                                showEmailVerificationDialog(
                                  context: context,
                                  message:
                                      AppLocalizations.of(context)!.emailHasPendingVerification,
                                  subtitle:
                                      AppLocalizations.of(context)!.didntReceiveVerificationEmail,
                                  verifyButtonCallBack: () {
                                    userCrendential.user!
                                        .sendEmailVerification()
                                        .then(
                                      (value) {
                                        mySnackBar(
                                            context: context,
                                            message: AppLocalizations.of(context)!.emailVerificationSent,
                                            snackBarType: SnackBarType.info);
                                        // context.goNamed(RouteNames.signin);
                                      },
                                    ).onError(
                                      (error, stackTrace) {
                                        log("ERROR SENDING THE EMAIL VERIFICATION : $error");
                                        mySnackBar(
                                            context: context,
                                            message:
                                                AppLocalizations.of(context)!.somethingWentWrongTryAgainLater,
                                            snackBarType: SnackBarType.info);
                                      },
                                    );
                                  },
                                );
                              }
                            }
                          },
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      RichText(
                        textAlign: TextAlign.center,
                        text: TextSpan(
                          style: Theme.of(context).textTheme.labelSmall,
                          children: [
                            TextSpan(text: AppLocalizations.of(context)!.forgotYourPassword),
                            TextSpan(
                              text: AppLocalizations.of(context)!.tapToReset,
                              style: Theme.of(context)
                                  .textTheme
                                  .labelSmall!
                                  .copyWith(
                                    color: Colors.cyan,
                                    decoration: TextDecoration.underline,
                                    decorationColor: Colors.cyan,
                                  ),
                              recognizer: TapGestureRecognizer()
                                ..onTap = () =>
                                    context.pushNamed(RouteNames.resetPassword),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(
                        height: 10,
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
                            AppLocalizations.of(context)!.or,
                            style: Theme.of(context).textTheme.labelSmall,
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
                              showCreatingProfileDialog(context);
                              context
                                  .read<AuthenticationProvider>()
                                  .setIsAuthenticating(false);
                              mySnackBar(
                                  context: context,
                                  message: AppLocalizations.of(context)!.successfullySignedIn);
                              await Future.delayed(
                                const Duration(milliseconds: 1200),
                              );

                              if (res.isNewUser) {
                                UserRepository()
                                    .createUser(
                                        FirebaseAuth.instance.currentUser)
                                    .then(
                                      (value) {
                                        context.goNamed(RouteNames.question);
                                      },
                                    )
                                    .then(
                                      (value) {},
                                    )
                                    .onError(
                                      (error, stackTrace) {
                                        log("FAILED TO CREATE USER IN FIRESTORE $error");
                                        debugPrintStack(stackTrace: stackTrace);
                                        mySnackBar(
                                            context: context,
                                            message: AppLocalizations.of(context)!.somethingWentWrong);
                                      },
                                    );
                              } else {
                                UserRepository().getQuestionFlag().then(
                                  (isAnsweredQuestion) {
                                    if (isAnsweredQuestion) {
                                      context.goNamed(RouteNames.dashboard);
                                    } else {
                                      context.goNamed(RouteNames.question);
                                    }
                                  },
                                );
                              }
                            } else {
                              context
                                  .read<AuthenticationProvider>()
                                  .setIsAuthenticating(false);

                              mySnackBar(
                                  context: context,
                                  message: AppLocalizations.of(context)!.authenticationFailed,
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
                        AppLocalizations.of(context)!.dontHaveAnAccount,
                        style: Theme.of(context).textTheme.labelSmall,
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
                          AppLocalizations.of(context)!.signUp,
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
