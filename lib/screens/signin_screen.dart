import 'package:flutter/material.dart';
import 'package:illimited_app/constant/const.dart';
import 'package:illimited_app/screens/sign_up_screen.dart';
import 'package:illimited_app/utils/utils.dart';
import 'package:illimited_app/widget/google_sign_button.dart';
import 'package:illimited_app/widget/primary_button.dart';
import 'package:lottie/lottie.dart';
import 'package:modern_textfield/modern_textfield.dart';

class SignInScreen extends StatefulWidget {
  const SignInScreen({super.key});

  @override
  State<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Sign In",
                  style: getFontStyle(context)
                      .copyWith(fontSize: 40, fontWeight: FontWeight.w800),
                ),
                SizedBox(
                  height: getScreenHeight(context) * 0.1,
                ),
                ModernTextField(
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
                    onPressed: () {},
                  ),
                ),
                SizedBox(
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
                    onPressed: () {},
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
        ],
      ),
    );
  }
}
