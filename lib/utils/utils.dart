import 'dart:developer';
import 'dart:typed_data';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:illimited_app/constant/const.dart';
import 'package:illimited_app/utils/email_verification_dialog.dart';
import 'package:illimited_app/utils/level_unlocked_dialog.dart';
import 'package:illimited_app/widget/primary_button.dart';
import 'package:lottie/lottie.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

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
Future<void> fetchAllPhotos(DocumentReference week) async {
  log("IN fetchAllPhotos");
  List<Map<String, String>> photosList = [];

  for (int day = 1; day <= 6; day++) {
    log("$day");
    DocumentSnapshot taskDoc;

    if (day == 1) {
      taskDoc = await week
          .collection('days')
          .doc(day.toString())
          .collection('tasks')
          .doc("1")
          .get();
    } else {
      QuerySnapshot taskCollection = await week
          .collection('days')
          .doc(day.toString())
          .collection('tasks')
          .get();

      int taskCount = taskCollection.size;
      taskDoc = await week
          .collection('days')
          .doc(day.toString())
          .collection('tasks')
          .doc(taskCount.toString())
          .get();
    }

    if (taskDoc.exists) {
      Map<String, String>? photos =
          Map<String, String>.from(taskDoc['photos'] ?? {});

      if (photos.containsKey('p1') && photos.containsKey('p2')) {
        photosList.add({'p1': photos['p1']!, 'p2': photos['p2']!});
      }
    }
  }
  List<String> fetchedImages = [];
    for (var photoMap in photosList) {
      fetchedImages.add(photoMap['p1']!); 
      fetchedImages.add(photoMap['p2']!); 
    }
  generateVideo(fetchedImages);
} // For http requests

Future<void> generateVideo(List<String> imageUrls) async {
  log("IN generateVideo");

  // API endpoint
  final String apiUrl = 'https://api.shotstack.io/edit/stage/render';

  // Headers
  var headers = {
    'x-api-key': 'LFfnJVLq61WTtJDPxK1QxQOlD2mcJunscai2MYQJ',
    'Content-Type': 'application/json',
  };

  // Build the clips array using image URLs from the list
  List<Map<String, dynamic>> clips = [];
  for (int i = 0; i < imageUrls.length; i++) {
    clips.add({
      "asset": {
        "type": "image",
        "src": imageUrls[i],
      },
      "start": i * 4, // Assuming each clip starts every 4 seconds
      "length": 5, // Each clip is 5 seconds long
      "effect":
          i % 2 == 0 ? "zoomIn" : "slideLeft", // Alternate effects for variety
      "transition": {"out": "fade"}
    });
  }

  // JSON body for the request
  var body = {
    "timeline": {
      "soundtrack": {
        "src":
            "https://shotstack-assets.s3-ap-southeast-2.amazonaws.com/music/freepd/advertising.mp3",
        "effect": "fadeInFadeOut"
      },
      "tracks": [
        {"clips": clips}
      ]
    },
    "output": {"format": "mp4", "resolution": "sd"}
  };

  try {
    // Send the POST request
    final response = await http.post(
      Uri.parse(apiUrl),
      headers: headers,
      body: jsonEncode(body),
    );

    if (response.statusCode == 201) {
      print("Video render request successful");
      var jsonResponse = jsonDecode(response.body);
      String renderId = jsonResponse["response"]["id"];
      print("Render ID: $renderId");

      // Call the function to poll render status and get video URL
      await pollRenderStatus(renderId);
    } else {
      print("Failed to render video. Status code: ${response.statusCode}");
      print(response.body);
    }
  } catch (e) {
    print("Error occurred: $e");
  }
}

Future<void> pollRenderStatus(String renderId) async {
  log("IN pollRenderStatus");

  // API endpoint for getting render status
  final String statusApiUrl =
      'https://api.shotstack.io/edit/stage/render/$renderId';

  // Headers
  var headers = {
    'x-api-key': 'LFfnJVLq61WTtJDPxK1QxQOlD2mcJunscai2MYQJ',
    'Content-Type': 'application/json',
  };

  bool isDone = false; // Flag to track if rendering is complete

  while (!isDone) {
    try {
      // Send the GET request to check render status
      final response = await http.get(
        Uri.parse(statusApiUrl),
        headers: headers,
      );

      if (response.statusCode == 200) {
        var jsonResponse = jsonDecode(response.body);
        String status = jsonResponse["response"]["status"];
        print("Render Status: $status");

        // Check if the render is done
        if (status == "done") {
          String videoUrl = jsonResponse["response"]["url"];
          log("Video URL: $videoUrl");
          getVideoFromUrl(videoUrl);
          isDone = true; // Stop the loop once done
        } else {
          print("Render is still processing. Waiting for 3 seconds...");
          await Future.delayed(
              Duration(seconds: 3)); // Wait 3 seconds before checking again
        }
      } else {
        print(
            "Failed to get render status. Status code: ${response.statusCode}");
        print(response.body);
        isDone = true; // Exit the loop if the request fails
      }
    } catch (e) {
      print("Error occurred while fetching video URL: $e");
      isDone = true; // Exit the loop in case of an error
    }
  }
}

Future<void> getVideoFromUrl(String videoUrl) async {
  log("IN getVideoFromUrl");

  try {

    // Step 1: Create an HTTP client
    final client = http.Client();

    // Step 2: Start the request and get the streamed response
    final request = http.Request('GET', Uri.parse(videoUrl));
    final streamedResponse = await client.send(request);

    // Step 3: Get the total file size from the content-length header
    final int contentLength =
        int.parse(streamedResponse.headers['content-length']!);

    // Step 4: Create a buffer to hold the video data
    List<int> bytes = [];

    // Track the number of bytes downloaded
    int bytesDownloaded = 0;

    // Step 5: Listen to the response stream and receive data in chunks
    await for (var chunk in streamedResponse.stream) {
      // Add each chunk to the buffer
      bytes.addAll(chunk);

      // Track the total downloaded so far
      bytesDownloaded += chunk.length;

      // Calculate the progress
      double progress = (bytesDownloaded / contentLength) * 100;
      print('Download progress: $progress%');
    }
    uploadToFirbase(bytes);
  } catch (e) {
    print('Error: $e');
  }
  
}

Future<void> uploadToFirbase(List<int> bytes) async {
  log("IN uploadToFirbase");

  // Step 6: Once the download is complete, convert the buffer into Uint8List (byte data)
  Uint8List videoBytes = Uint8List.fromList(bytes);

  // Step 7: Upload to Firebase Storage
  final String firebaseStoragePath = "uploads/videos/generated_video.mp4";
  final Reference storageRef =
      FirebaseStorage.instance.ref().child(firebaseStoragePath);

  final UploadTask uploadTask = storageRef.putData(videoBytes);

  // Optional: Track upload progress to Firebase
  uploadTask.snapshotEvents.listen((TaskSnapshot snapshot) {
    print(
        'Upload progress: ${(snapshot.bytesTransferred / snapshot.totalBytes) * 100} %');
  });

  // Get the download URL after upload completes
  final TaskSnapshot taskSnapshot = await uploadTask;
  final String downloadUrl = await taskSnapshot.ref.getDownloadURL();
  print('Video uploaded successfully! Download URL: $downloadUrl');
}