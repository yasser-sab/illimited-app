import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:illimited_app/utils/utils.dart';

class UserRepository {
  String getUserUid() {
    return FirebaseAuth.instance.currentUser!.uid;
  }

  Future<void> createUser(User? user,
      {String? firstName = "NONAME", String? lastName = "NONAME"}) async {
    log("Creatingf User");
    DocumentReference<Map<String, dynamic>> userDoc =
        FirebaseFirestore.instance.collection('users').doc(user!.uid);
    DocumentReference<Map<String, dynamic>> weekDoc =
        FirebaseFirestore.instance.collection('userWeeks').doc(user.uid);

    if (user.displayName != null) {
      if (user.displayName!.split(" ").length == 1) {
        firstName = user.displayName!.split(" ")[0];
      } else {
        
        firstName = user.displayName!.split(" ")[0];
        lastName = user.displayName!.split(" ")[1];
      }
    }
    else{
        user.updateDisplayName("$firstName $lastName");
      
    }


    Map<String, dynamic> userData = {
      "age": "",
      "country": "",
      "firstname": firstName,
      "lastname": lastName,
      "gender": "",
      "improvement_preference": "",
      "isQuestionsAnswered": false,
    };

    await userDoc.set(userData);

    //SETTING USER WEEKS
    DateTime serverTime = await getServerTime();

    Map<String, Map<String, dynamic>> weekData = {};

    for (int i = 0; i < 8; i++) {
      DateTime weekUnlockTime;

      if (i == 0) {
        weekUnlockTime = serverTime;
      } else {
        weekUnlockTime = serverTime.add(Duration(days: i * 7));
      }

      weekData['week${i + 1}'] = {
        'unlockedTime': Timestamp.fromDate(weekUnlockTime),
        'isNotified': false,
        'isCompleted': false,
      };
    }

    weekData.forEach(
      (key, value) {
        log("'$key' : $value");
      },
    );

    await weekDoc.set(weekData).then(
      (value) {
        log("WEEKS SAVED");
      },
    ).onError(
      (error, stackTrace) {
        log("$error");
      },
    );
  }

  Future<bool> getQuestionFlag() async {
    final DocumentSnapshot<Map<String, dynamic>> userDoc =
        await FirebaseFirestore.instance
            .collection('users')
            .doc(getUserUid())
            .get();

    if (userDoc.exists) {
      return await userDoc.data()!['isQuestionsAnswered'];
    } else {
      throw Exception('User document does not exist !');
    }
  }

  Future<void> setQuestionFlag(bool flag) async {
    final DocumentSnapshot<Map<String, dynamic>> userDoc =
        await FirebaseFirestore.instance
            .collection('users')
            .doc(getUserUid())
            .get();

    if (userDoc.exists) {
      userDoc.data()!['isQuestionsAnswered'] = true;
    } else {
      throw Exception('User document does not exist !');
    }
  }

  Future<void> update(Map<String, dynamic> userData) async {
    DocumentReference<Map<String, dynamic>> userDoc =
        FirebaseFirestore.instance.collection('users').doc(getUserUid());

    return await userDoc.update(userData);
  }

  void updateIsWeekNotified({required String week, required bool isNotified}) async {
    DocumentReference userWeeksRef =
        FirebaseFirestore.instance.collection('userWeeks').doc(getUserUid());

    await userWeeksRef.update({
      '$week.isNotified': isNotified,
    });
  }
}
