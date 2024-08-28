import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class UserRepository {
  String getUserUid() {
    return FirebaseAuth.instance.currentUser!.uid;
  }

  Future<void> createUser(User? user,
      {String? firstName = "NONAME", String? lastName = "NONAME"}) async {
    log("Creatingf User");
    DocumentReference<Map<String, dynamic>> userDoc =
        FirebaseFirestore.instance.collection('users').doc(user!.uid);

    if (user.displayName != null) {
      if (user.displayName!.split(" ").length == 1) {
        firstName = user.displayName!.split(" ")[0];
      } else {
        firstName = user.displayName!.split(" ")[0];
        lastName = user.displayName!.split(" ")[1];
      }
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
}
