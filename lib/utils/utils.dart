import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:illimited_app/constant/const.dart';
import 'package:illimited_app/utils/email_verification_dialog.dart';
import 'package:illimited_app/utils/level_unlocked_dialog.dart';
import 'package:illimited_app/widget/primary_button.dart';
import 'package:lottie/lottie.dart';

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
  required int weekNB,
}) {
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return LevelUnlockedDialog(
        weekNumber: weekNB,
      );
    },
  );
}

