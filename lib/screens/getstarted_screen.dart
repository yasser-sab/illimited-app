import 'package:animate_do/animate_do.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:illimited_app/constant/const.dart';
import 'package:illimited_app/router/router_names.dart';
import 'package:illimited_app/screens/terms_conditions.dart';
import 'package:illimited_app/widget/primary_button.dart';
import 'package:lottie/lottie.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class GetStarted extends StatefulWidget {
  const GetStarted({super.key});

  @override
  State<GetStarted> createState() => _GetStartedState();
}

class _GetStartedState extends State<GetStarted> {
  @override
  void initState() {
    super.initState();
  }

  Future<void> setFalseFirstLaunch() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setBool("isFirstLaunch", false);
  }

  void _navigateToTerms() {
    context.pushNamed(RouteNames.termsConditions);
  }

  void _navigateToPrivacy() {
    context.pushNamed(RouteNames.privacyPolicy);
  }

  bool _isChecked = false;

  void _onCheckboxChanged(bool? value) {
    setState(() {
      _isChecked = value ?? false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Stack(
      children: [
        Lottie.asset(
          'assets/lottie/getstartedbg.json',
          fit: BoxFit
              .cover, // Ensures the animation covers the entire background
          width: double.infinity,
          height: double.infinity,
        ),
        Container(
          width: MediaQuery.of(context).size.width,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ZoomIn(
                duration: Duration(seconds: 2),
                child: FadeIn(
                  duration: Duration(seconds: 2),
                  child: Text(
                      AppLocalizations.of(context)!.welcomeToApp(appName),
                      style: Theme.of(context).textTheme.displayLarge),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              FadeIn(
                duration: Duration(seconds: 4),
                delay: Duration(seconds: 1),
                child: Text(AppLocalizations.of(context)!.goalIsToHelpYou,
                    style: Theme.of(context).textTheme.titleLarge),
              ),
            ],
          ),
        ),
        Positioned(
          bottom: 15,
          left: 20,
          right: 20,
          child: Column(
            children: [
              Row(
                children: [
                  Checkbox(
                    side: BorderSide(color: Colors.white),
                    activeColor: primaryColor,
                    value: _isChecked,
                    onChanged: _onCheckboxChanged,
                  ),
                  Expanded(
                    child: RichText(
                      text: TextSpan(
                        text: AppLocalizations.of(context)!.acceptTerms,
                        style: getFontStyle(context).copyWith(),
                        children: [
                          TextSpan(
                            text: AppLocalizations.of(context)!.terms_title,
                            style: const TextStyle(
                              color: Colors.blue,
                              decoration: TextDecoration.underline,
                            ),
                            recognizer: TapGestureRecognizer()
                              ..onTap = _navigateToTerms,
                          ),
                          TextSpan(
                            text: AppLocalizations.of(context)!.and,
                            style: const TextStyle(
                              color: Colors.white,
                              decoration: TextDecoration.underline,
                            ),
                            // recognizer: TapGestureRecognizer()
                            //   ..onTap = _navigateToTerms,
                          ),
                          TextSpan(
                            text: AppLocalizations.of(context)!.privacyPolicy,
                            style: const TextStyle(
                              color: Colors.blue,
                              decoration: TextDecoration.underline,
                            ),
                            recognizer: TapGestureRecognizer()
                              ..onTap = _navigateToPrivacy,
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 20,
              ),
              PrimaryButton(
                enabled: _isChecked,
                isBold: true,
                text: AppLocalizations.of(context)!.getStarted,
                onPressed: () {
                  setFalseFirstLaunch();
                  context.goNamed(RouteNames.signup);
                },
              ),
              const SizedBox(
                height: 10,
              ),
              PrimaryButton(
                enabled: _isChecked,
                isBold: true,
                text: AppLocalizations.of(context)!.signIn,
                onPressed: () {
                  setFalseFirstLaunch();
                  context.goNamed(RouteNames.signin);
                },
                color: primaryColor.withOpacity(0.1),
                borderWith: 1.0,
              ),
            ],
          ),
        )
      ],
    ));
  }
}
