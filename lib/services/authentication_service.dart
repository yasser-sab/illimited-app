import 'dart:developer';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:illimited_app/models/sign_in_result.dart';
import 'package:illimited_app/providers/logbook_provider.dart';
import 'package:illimited_app/providers/progress_provider.dart';
import 'package:illimited_app/providers/questions_provider.dart';
import 'package:illimited_app/services/notification_service.dart';
import 'package:illimited_app/widget/top_snackbar.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AuthService {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final GoogleSignIn googleSignIn = GoogleSignIn();
  GoogleSignInAccount? googleSignInAccount;

  bool isSignedIn() {
    return _auth.currentUser != null;
  }

  Future<SignInResult?> signInWithGoogle() async {
    try {
      googleSignInAccount = await googleSignIn.signIn();

      final GoogleSignInAuthentication googleSignInAuthentication =
          await googleSignInAccount!.authentication;
      final AuthCredential credential = GoogleAuthProvider.credential(
        accessToken: googleSignInAuthentication.accessToken,
        idToken: googleSignInAuthentication.idToken,
      );

      final UserCredential authResult =
          await _auth.signInWithCredential(credential);
      final User? user = authResult.user;
      final bool isNewUser = authResult.additionalUserInfo!.isNewUser;

      if (isNewUser) {
        print("THE USER ACCOUNT IS NEW");
      } else {
        print("THE USER ACCOUNT IS EXIST");
      }
      return SignInResult(user: user, isNewUser: isNewUser);
    } catch (error) {
      log(error.toString());
      return null;
    }
  }
  Future<void> setNotificationScheduled(bool val) async {
    final prefs = await SharedPreferences.getInstance();
    prefs.setBool("isScheduled", val);
  }
  void signOut() async {
    try {
      setNotificationScheduled(false);
      NotificationService().cancelAllNotifications();
      LogbookProvider().resetProvider();
      UserProgressProvider().resetProvider();
      QuestionProvider().resetProvider();

      await _auth.signOut();
      log("USER SIGNED OUT");
      googleSignIn.isSignedIn().then(
        (value) async {
          if (value) {
            await googleSignIn.disconnect();
            log("USER DISCONNECTED (Google)");
          }
        },
      );
    } catch (error) {
      log("Error during Google sign-in: $error");
      return null;
    }
  }

  Future<UserCredential?> signInWithEmailAndPassword(
      BuildContext context, String emailAddress, String password) async {
    try {
      final credential = await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: emailAddress,
        password: password,
      );
      return credential;
    } on FirebaseAuthException catch (e) {
      log(e.code);
      if (e.code == 'user-not-found') {
        mySnackBar(context: context, message: "No user found for that email", snackBarType: SnackBarType.failure);
      } else if (e.code == 'wrong-password') {
        mySnackBar(context: context, message: "Wrong password", snackBarType: SnackBarType.failure);
      } else if (e.code == 'invalid-credential') {
        mySnackBar(context: context, message: "Invalid Credentials", snackBarType: SnackBarType.failure);
      }
       else if (e.code == 'too-many-requests') {
        mySnackBar(context: context, message: "Too Many Requests, Please try again later", snackBarType: SnackBarType.failure);
      }
      else {
        mySnackBar(context: context, message: "Something Went wrong, Please try again later", snackBarType: SnackBarType.failure);
      }
    } catch (e) {
      print(e);
    }
    return null;
  }

  Future<UserCredential?> signUpWithEmailAndPassword(
      BuildContext context, String emailAddress, String password) async {
    try {
      final credential =
          await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: emailAddress,
        password: password,
      );
      log("Returning Creds");
      return credential;
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        mySnackBar(
            context: context, message: 'The password provided is too weak', snackBarType: SnackBarType.failure);
      } else if (e.code == 'email-already-in-use') {
        mySnackBar(context: context, message: 'This email already exists', snackBarType: SnackBarType.failure);
      }
    } catch (e) {
      print(e);
    }
    return null;
  }
}
