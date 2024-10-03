import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:illimited_app/constant/const.dart';
import 'package:illimited_app/utils/email_verification_dialog.dart';
import 'package:illimited_app/utils/level_unlocked_dialog.dart';
import 'package:illimited_app/widget/primary_button.dart';
import 'package:lottie/lottie.dart';

enum Status { locked, inProgress, completed }

enum Tasks { takePhoto, questions, video, generatedVideo, quote, reading }

final List<String> moodButtonsData = [
  "happy",
  "joy",
  "proud",
  "sad",
  "fear",
  "shy",
  "worry",
  "angry",
  "upset"
];

String capitalizeFirstLetter(String input) {
  if (input.isEmpty) {
    return input;
  }

  return input[0].toUpperCase() + input.substring(1);
}

double getScreenWidth(BuildContext context) {
  return MediaQuery.of(context).size.width;
}

double getScreenHeight(BuildContext context) {
  return MediaQuery.of(context).size.height;
}

void showEmailVerificationDialog({
  required BuildContext context,
  required String message,
  required String subtitle,
  required VoidCallback verifyButtonCallBack,
}) {
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return EmailVerificationDialog(
        message: message,
        subtitle: subtitle,
        verifyButtonCallBack: verifyButtonCallBack,
      );
    },
  );
}

Future<DateTime> getServerTime() async {
  DocumentReference serverTimeRef =
      FirebaseFirestore.instance.collection('serverTime').doc('currentTime');
  await serverTimeRef.set({'time': FieldValue.serverTimestamp()});
  DocumentSnapshot snapshot = await serverTimeRef.get();
  return (snapshot['time'] as Timestamp).toDate();
}

void showLevelUnlocked({
  required BuildContext context,
  required int nb,
  bool isDay = false,
}) {
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return LevelUnlockedDialog(
        number: nb,
        isDay: isDay,
      );
    },
  );
}

void showCreatingProfileDialog(BuildContext context) {
  showDialog(
    context: context,
    barrierDismissible: false,
    builder: (BuildContext context) {
      return PopScope(
        canPop: false,
        child: AlertDialog(
          icon: Text(
            "Your Account is Being Set Up",
            textAlign: TextAlign.center,
            style: GoogleFonts.roboto()
                .copyWith(color: Colors.black, fontSize: 21),
          ),
          title: Lottie.asset("assets/lottie/cubeLoading.json"),
          content: Text(
            'Please While Creating Your User Profile',
            textAlign: TextAlign.center,
            style: getFontStyle(context)
                .copyWith(color: Color.fromARGB(139, 0, 0, 0), fontSize: 17),
          ),
          // actions: <Widget>[
          //   TextButton(
          //     onPressed: () {
          //       Navigator.of(context)
          //           .pop(); // Optional close action
          //     },
          //     child: Text('OK'),
          //   ),
          // ],
        ),
      );
    },
  );
}

void showUploadingContent(BuildContext context) {
  showDialog(
    context: context,
    barrierDismissible: false,
    builder: (BuildContext context) {
      return PopScope(
        canPop: false,
        child: AlertDialog(
          insetPadding: EdgeInsets.symmetric(horizontal: 100),
          icon: Text(
            "Uploading...",
            textAlign: TextAlign.center,
            style: GoogleFonts.roboto()
                .copyWith(color: Colors.black, fontSize: 21),
          ),
          title: SizedBox(
              width: 60,
              height: 60,
              child: Lottie.asset("assets/lottie/loadingCubes.json")),
        ),
      );
    },
  );
}
