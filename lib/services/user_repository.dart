import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:illimited_app/models/sign_in_result.dart';

class UserRepository {
  Future<void> createUser(User? user) async {
    DocumentReference<Map<String, dynamic>> userDoc =
        FirebaseFirestore.instance.collection('users').doc(user!.uid);
    String firstName = "";
    String lastName = "";

    if (user.displayName!.split(" ").length == 1) {
      firstName = user.displayName!.split(" ")[0];
    } else {
      firstName = user.displayName!.split(" ")[0];
      lastName = user.displayName!.split(" ")[1];
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

  Future<bool> getQuestionFlag(User? user) async {
    final DocumentSnapshot<Map<String, dynamic>> userDoc =
        await FirebaseFirestore.instance
            .collection('users')
            .doc(user!.uid)
            .get();

    if (userDoc.exists) {
      return await userDoc.data()!['isQuestionsAnswered'];
    } else {
      throw Exception('User document does not exist !');
    }
  }

  Future<void> update(User? user, Map<String, dynamic> userData) async {
    DocumentReference<Map<String, dynamic>> userDoc =
        FirebaseFirestore.instance.collection('users').doc(user!.uid);

    return await userDoc.update(userData);
  }
}
