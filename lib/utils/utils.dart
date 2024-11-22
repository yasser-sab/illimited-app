import 'dart:developer';
import 'dart:typed_data';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:illimited_app/constant/const.dart';
import 'package:illimited_app/providers/language_provider.dart';
import 'package:illimited_app/router/router_names.dart';
import 'package:illimited_app/utils/email_verification_dialog.dart';
import 'package:illimited_app/utils/level_unlocked_dialog.dart';
import 'package:illimited_app/widget/primary_button.dart';
import 'package:illimited_app/widget/purchase_buttomsheet.dart';
import 'package:lottie/lottie.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

enum Status { locked, inProgress, completed }

enum Tasks { takePhoto, questions, video, generatedVideo, quote, reading }

final Map<String, List<String>> moodButtonsData = {
  "en": [
    "happy",
    "joy",
    "proud",
    "sad",
    "fear",
    "shy",
    "worry",
    "angry",
    "upset"
  ],
  "fr": [
    "heureux",
    "joie",
    "fier",
    "triste",
    "peur",
    "timide",
    "inquiétude",
    "en colère",
    "contrarié"
  ],
  "es": [
    "feliz",
    "alegría",
    "orgulloso",
    "triste",
    "miedo",
    "tímido",
    "preocupación",
    "enojado",
    "molesto"
  ],
  "ar": ["سعيد", "فرح", "فخور", "حزين", "خوف", "خجول", "قلق", "غاضب", "منزعج"]
};

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

void showUpgradeToPremium(BuildContext context) {
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        backgroundColor: const Color.fromARGB(255, 217, 251, 255),
        actionsOverflowButtonSpacing: 20,
        icon: Image.asset(
          "assets/icon/premium.png",
          width: 100,
          height: 100,
        ),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              textAlign: TextAlign.center,
              AppLocalizations.of(context)!.upgradeToPremium,
              style: GoogleFonts.roboto(
                  fontSize: 20,
                  fontWeight: FontWeight.w300,
                  color: Colors.black),
            ),
            SizedBox(height: 15,),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: PrimaryButton(
                fontSize: 18,
                height: 45,
                text: AppLocalizations.of(context)!.upgrade,
                onPressed: () {
                  context.pop();
                  showPurchaseBottomSheet(context);
                },
              ),
            )
          ],
        ),
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
            AppLocalizations.of(context)!.accountBeingSetUp,
            textAlign: TextAlign.center,
            style: GoogleFonts.roboto()
                .copyWith(color: Colors.black, fontSize: 21),
          ),
          title: Lottie.asset("assets/lottie/cubeLoading.json"),
          content: Text(
            AppLocalizations.of(context)!.pleaseWhileCreatingUserProfile,
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
            AppLocalizations.of(context)!.uploading,
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

void showConfirmationDialog(
    BuildContext context, String message, bool isPoping) {
  Widget yesButton = PrimaryButton(
    text: AppLocalizations.of(context)!.discard,
    onPressed: () async {
      context.pop();
      if (isPoping) {
        // await Future.delayed(Duration(milliseconds: 150));
        context.pop();
      }
    },
    width: getScreenWidth(context) * 0.30,
    color: errorColor,
  );

  Widget noButton = PrimaryButton(
    text: AppLocalizations.of(context)!.no,
    color: Colors.grey,
    onPressed: () {
      context.pop();
    },
    width: getScreenWidth(context) * 0.30,
  );

  AlertDialog alert = AlertDialog(
    actionsOverflowButtonSpacing: 20,
    icon: Lottie.asset(
      "assets/lottie/info.json",
      height: 100,
      // width: 10,
    ),
    backgroundColor: Color.fromARGB(255, 213, 236, 255),
    content: Text(
      message,
      style: getFontStyle(context).copyWith(
          fontSize: 20, fontWeight: FontWeight.bold, color: Colors.black),
      textAlign: TextAlign.center,
    ),
    actions: [noButton, yesButton],
    actionsAlignment: MainAxisAlignment.center,
  );

  showDialog(
    context: context,
    builder: (BuildContext context) {
      return alert;
    },
  );
}
// void showConfirmationDialog(
//       {required BuildContext context,
//       required String message,
//       required VoidCallback onPressed}) {
//     Widget yesButton = PrimaryButton(
//       text: "Yes",
//       onPressed: () {
//         onPressed();

//         context.pop();
//       },
//       width: getScreenWidth(context) * 0.30,
//       color: errorColor,
//     );

//     Widget noButton = PrimaryButton(
//       text: "No",
//       color: Colors.grey,
//       onPressed: () {
//         context.pop();
//       },
//       width: getScreenWidth(context) * 0.30,
//     );

//     AlertDialog alert = AlertDialog(
//       actionsOverflowButtonSpacing: 20,
//       icon: Lottie.asset(
//         "assets/lottie/info.json",
//         height: 100,
//         // width: 10,
//       ),
//       backgroundColor: Color.fromARGB(255, 213, 236, 255),
//       content: Text(
//         message,
//         style: getFontStyle(context).copyWith(
//             fontSize: 20, fontWeight: FontWeight.bold, color: Colors.black),
//         textAlign: TextAlign.center,
//       ),
//       actions: [noButton, yesButton],
//       actionsAlignment: MainAxisAlignment.center,
//     );

//     showDialog(
//       context: context,
//       builder: (BuildContext context) {
//         return alert;
//       },
//     );
//   }

saveLanguage(BuildContext context) async {
  String code = context.read<LanguageProvider>().selectedLanguage;
  SharedPreferences prefs = await SharedPreferences.getInstance();
  await prefs.setString('selectedLanguage', code);
}

Future<bool> checkPhotosAvailability(
    DocumentReference weekRef, int dayNumber) async {
  List<int> daysToCheck;

  // Special logic for Week 8
  if (weekRef.id == '8') {
    if (dayNumber == 4) {
      // Week 8, Day 4: Check photos for Day 2 and Day 3 of all weeks (1-8)
      return await _checkPhotosForMultipleDays([2, 3], includeWeek8: true);
    } else if (dayNumber == 5) {
      // Week 8, Day 5: Check photos for Day 4 and Day 5 of all weeks (1-7)
      return await _checkPhotosForMultipleDays([4, 5], includeWeek8: false);
    } else if (dayNumber == 6) {
      // Week 8, Day 6: Check photos for Day 6 of all weeks (1-7)
      return await _checkPhotosForMultipleDays([6], includeWeek8: false);
    } else if (dayNumber == 7) {
      // Week 8, Day 7: Check photos for Day 1 of all weeks (1-8)
      return await _checkPhotosForMultipleDays([1], includeWeek8: true);
    } else {
      return false; // Invalid day number for Week 8
    }
  } else {
    // Logic for Week 1-7: Check photos for all days 1-7
    daysToCheck = [1, 2, 3, 4, 5, 6];
    for (int day in daysToCheck) {
      bool photosAvailable = await _checkPhotosForDay(weekRef, day);
      if (!photosAvailable) {
        return false; // If any required day is missing photos
      }
    }
    return true; // All photos are available for this week
  }
}

Future<bool> _checkPhotosForMultipleDays(List<int> daysToFetch,
    {required bool includeWeek8}) async {
  String userId = FirebaseAuth.instance.currentUser!.uid;

  // Loop through weeks
  for (int weekNum = 1; weekNum <= (includeWeek8 ? 8 : 7); weekNum++) {
    DocumentReference weekRef = FirebaseFirestore.instance
        .collection('users/$userId/weeks')
        .doc(weekNum.toString());

    for (int day in daysToFetch) {
      bool photosAvailable = await _checkPhotosForDay(weekRef, day);
      if (!photosAvailable) {
        return false; // If any required day's photos are missing
      }
    }
  }

  return true; // All required photos are available across all weeks
}

Future<bool> _checkPhotosForDay(DocumentReference weekRef, int dayNum) async {
  DocumentReference dayRef = weekRef.collection('days').doc(dayNum.toString());

  DocumentSnapshot taskDoc;

  if (dayNum == 1) {
    // For Day 1: Fetch photos from the first task
    taskDoc = await dayRef.collection('tasks').doc('1').get();
  } else {
    // For Day 2-7: Fetch photos from the last task
    QuerySnapshot taskCollection = await dayRef.collection('tasks').get();
    int lastTaskNum = taskCollection.size;
    taskDoc =
        await dayRef.collection('tasks').doc(lastTaskNum.toString()).get();
  }

  if (!taskDoc.exists || taskDoc.data() == null) {
    log("FALSE FOR ++++ DATA NOT EXIST");

    return false; // Task document doesn't exist
  }

  Map<String, dynamic>? taskData = taskDoc.data() as Map<String, dynamic>?;
  // bool isCompleted = taskData?['isCompleted'] ?? false;
  String? p1Url = taskData?['photos']?['p1'];
  String? p2Url = taskData?['photos']?['p2'];

  // Check if task is completed and both photos (p1 and p2) are available
  log("----------------------------------");
  // log("isCompleted = $isCompleted");
  log("p1Url != null = ${p1Url != null}");
  log("p1Url.isNotEmpty = ${p1Url?.isNotEmpty}");
  log("p2Url != null = ${p2Url != null}");
  log("p2Url.isNotEmpty = ${p2Url?.isNotEmpty}");
  log("----------------------------------");

  if (p1Url != null && p1Url.isNotEmpty && p2Url != null && p2Url.isNotEmpty) {
    return true; // Photos are available
  }

  return false; // Photos are not available
}

void showPurchaseBottomSheet(BuildContext context) {
  showModalBottomSheet(
    context: context,
    isScrollControlled: true,
    enableDrag: false,
    backgroundColor: Colors.transparent,
    builder: (BuildContext context) {
      return BottomSheetContainer();
    },
  );
}

// BottomSheetContainer widget, responsible for setting up the AnimationController
