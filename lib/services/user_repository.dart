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
    DateTime serverTime = await getServerTime();
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
    } else {
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
    Map<String, Map<String, dynamic>> weekData = {};
  DateTime dayUnlockTime = serverTime;
    int day = 0;
    for (int i = 0; i < 8; i++) {
      //SETTING USER WEEK DAY
      DocumentReference<Map<String, dynamic>> dayDoc =
          FirebaseFirestore.instance.collection('userDays').doc();
      Map<String, Map<String, dynamic>> weekDays = {};
      
      for (int j = 0; j < 7; j++) {
        if (j == 0 && day == 0) {
          dayUnlockTime = serverTime;
        } else {
          dayUnlockTime = serverTime.add(Duration(days: day));
        }

        weekDays['day${j + 1}'] = {
          'unlockedTime': Timestamp.fromDate(dayUnlockTime),
          'isNotified': false,
          'isCompleted': false,
        };
        day++;
      }

      weekDays.forEach(
        (key, value) {
          log("'$key' : $value");
        },
      );

      await dayDoc.set(weekDays).then(
        (value) {
          log("DAYS SAVED");
        },
      ).onError(
        (error, stackTrace) {
          log("$error");
        },
      );
      ////Finishing user week days/////

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
        'days': dayDoc
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

  void updateIsWeekNotified(
      {required String week, required bool isNotified}) async {
    DocumentReference userWeeksRef =
        FirebaseFirestore.instance.collection('userWeeks').doc(getUserUid());

    await userWeeksRef.update({
      '$week.isNotified': isNotified,
    });
  }

  void updateIsDayNotified({
    required DocumentReference<Map<String, dynamic>> weekDays,
    required String day,
    required bool isNotified,
  }) async {
    await weekDays.update({
      '$day.isNotified': isNotified,
    });
  }
}
