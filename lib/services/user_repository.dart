import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:illimited_app/data/tasks.dart';
import 'package:illimited_app/utils/utils.dart';

class UserRepository {
  String getUserUid() {
    return FirebaseAuth.instance.currentUser!.uid;
  }

  Future<void> createUser(User? user,
      {String? firstName = "NONAME", String? lastName = "NONAME"}) async {
    log("IN CREATE USER");
    DateTime serverTime = await getServerTime();

    // Start a Firestore batch
    WriteBatch batch = FirebaseFirestore.instance.batch();

    // Reference to the user's document in the 'users' collection
    DocumentReference<Map<String, dynamic>> userDoc =
        FirebaseFirestore.instance.collection('users').doc(user!.uid);

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

    // User basic data
    Map<String, dynamic> userData = {
      "age": "",
      "country": "",
      "firstname": firstName,
      "lastname": lastName,
      "gender": "",
      "improvement_preference": "",
      "isQuestionsAnswered": false,
    };

    // Set the user data in the batch
    batch.set(userDoc, userData);

    DateTime dayUnlockTime = serverTime;

    // Reference to 'weeks' subcollection under the user document
    CollectionReference<Map<String, dynamic>> weeksCollection =
        userDoc.collection('weeks');

    // Loop through 8 weeks
    for (int weekNum = 1; weekNum <= 8; weekNum++) {
      // Reference for the current week (week number is the document ID)
      DocumentReference<Map<String, dynamic>> weekDoc =
          weeksCollection.doc(weekNum.toString());

      // Initialize data for the week
      DateTime weekUnlockTime = (weekNum == 1)
          ? serverTime
          : serverTime.add(Duration(days: (weekNum - 1) * 7));
          
      Map<String, dynamic> weekData;
      if (weekNum == 8) {
        weekData = {
          'unlockedTime': Timestamp.fromDate(weekUnlockTime),
          'isNotified': false,
          'isCompleted': false,
          'day4GeneratedVideoUrl': "",
          'day5GeneratedVideoUrl': "",
          'day6GeneratedVideoUrl': "",
          'day7GeneratedVideoUrl': ""
        };
      } else {
        weekData = {
          'unlockedTime': Timestamp.fromDate(weekUnlockTime),
          'isNotified': false,
          'isCompleted': false,
          'generatedVideoUrl': ""
        };
      }

      // Add the week data to the batch
      batch.set(weekDoc, weekData);

      // Reference to 'days' subcollection under the current week
      CollectionReference<Map<String, dynamic>> daysCollection =
          weekDoc.collection('days');

      // Loop through 7 days in a week
      for (int dayNum = 1; dayNum <= 7; dayNum++) {
        // Reference for the current day (day number is the document ID)
        DocumentReference<Map<String, dynamic>> dayDoc =
            daysCollection.doc(dayNum.toString());

        dayUnlockTime = (dayNum == 1 && weekNum == 1)
            ? serverTime
            : serverTime.add(Duration(days: (weekNum - 1) * 7 + (dayNum - 1)));

        // Initialize data for the day
        Map<String, dynamic> dayData = {
          'unlockedTime': Timestamp.fromDate(dayUnlockTime),
          'isNotified': false,
          'isCompleted': false,
        };

        // Add the day data to the batch
        batch.set(dayDoc, dayData);

        // Reference to 'tasks' subcollection under the current day
        CollectionReference<Map<String, dynamic>> tasksCollection =
            dayDoc.collection('tasks');

        // Fetch tasks for the current day
        log("week$weekNum | day$dayNum");
        Map<String, dynamic> tasksForDay =
            tasksOf["week$weekNum"]?["day$dayNum"]["tasks"];

        if (tasksForDay.isNotEmpty) {
          int taskIndex = 1;
          Map<String, dynamic> taskData;
          // Loop through tasks and create them in Firestore
          tasksForDay.forEach((taskKey, task) {
            log("ITER $taskKey");
            log("task type = ${tasksForDay[taskKey]["en"]["type"]}");
            switch (tasksForDay[taskKey]["en"]["type"] as Tasks) {
              case Tasks.takePhoto:
                taskData = {
                  'isLocked': taskIndex > 1, // Only the first task is unlocked
                  'isCompleted': false,
                  "photos": {"p1": "", "p2": ""}
                };
                break;
              case Tasks.questions:
                taskData = {
                  'isLocked': taskIndex > 1, // Only the first task is unlocked
                  'isCompleted': false,
                  "introText": tasksForDay[taskKey]["en"]["introText"],
                  'questions': tasksForDay[taskKey]["en"]["questions"],
                  'answers': {},
                  "moodAnswer": ""
                };
                break;
              case Tasks.reading:
                taskData = {
                  'isLocked': taskIndex > 1, // Only the first task is unlocked
                  'isCompleted': false,
                  "goal": tasksForDay[taskKey]["en"]["goal"],
                  "materials": tasksForDay[taskKey]["en"]["materials"],
                  "text": tasksForDay[taskKey]["en"]["text"]
                };
                break;
              case Tasks.quote:
                taskData = {
                  'isLocked': taskIndex > 1, // Only the first task is unlocked
                  'isCompleted': false,
                  "text": tasksForDay[taskKey]["en"]["text"]
                };
              case Tasks.video:
                taskData = {
                  'isLocked': taskIndex > 1, // Only the first task is unlocked
                  'isCompleted': false,
                  "videoUrl": tasksForDay[taskKey]["en"]["videoUrl"]
                };
              case Tasks.generatedVideo:
                taskData = {
                  'isLocked': taskIndex > 1, // Only the first task is unlocked
                  'isCompleted': false,
                  "videoUrl": tasksForDay[taskKey]["en"]["videoUrl"]
                };
                break;
              default:
                taskData = {};
            }

            // if (tasksForDay[taskKey]["type"] == Tasks.takePhoto) {}

            // Map<String, dynamic> taskData = {
            //   'isLocked': taskIndex > 1, // Only the first task is unlocked
            //   'isCompleted': false,
            // };

            // Add the task to the batch
            DocumentReference<Map<String, dynamic>> taskDoc =
                tasksCollection.doc(taskIndex.toString());
            batch.set(taskDoc, taskData);

            taskIndex++;
          });
        }
      }
    }

    // Commit the batch
    await batch.commit();
    log("User data with nested collections created successfully with batching!");
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
    // Reference to the specific week for the user
    DocumentReference weekRef = FirebaseFirestore.instance
        .collection('users')
        .doc(getUserUid())
        .collection('weeks')
        .doc(week);

    // Update the isNotified field in the specific week
    await weekRef.update({
      'isNotified': isNotified,
    });
  }

  void updateIsDayNotified(
      {required CollectionReference<Map<String, dynamic>> weekDays,
      required String day,
      required bool isNotified}) async {
    // Reference to the specific day inside the week
    DocumentReference dayRef = weekDays.doc(day);

    // Update the isNotified field for the specific day
    await dayRef.update({
      'isNotified': isNotified,
    });
  }
}
