// import 'dart:convert';
// import 'dart:developer';
// import 'dart:typed_data';
// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:flutter/material.dart';
// import 'package:firebase_storage/firebase_storage.dart';
// import 'package:flutter/widgets.dart';
// import 'package:flutter_spinkit/flutter_spinkit.dart';
// import 'package:google_fonts/google_fonts.dart';
// import 'package:http/http.dart' as http;
// import 'package:illimited_app/constant/const.dart';
// import 'package:illimited_app/widget/primary_button.dart';
// import 'package:lottie/lottie.dart';
// import 'package:video_player/video_player.dart';

// class VideoGenerationScreen extends StatefulWidget {
//   final DocumentReference weekRef;

//   VideoGenerationScreen({required this.weekRef});

//   @override
//   _VideoGenerationScreenState createState() => _VideoGenerationScreenState();
// }

// enum GeneratingStatus {
//   idle,
//   gettingPhotos,
//   generating,
//   processing,
//   saving,
//   completed
// }

// class _VideoGenerationScreenState extends State<VideoGenerationScreen>
//     with SingleTickerProviderStateMixin {
//   late AnimationController _animationController;
//   GeneratingStatus status = GeneratingStatus.idle;
//   bool _loading = true;
//   String? generatedVideoUrl;
//   bool isGenerating = false;
//   double? progress = 0;
//   String percentage = "";
//   String progressText = "";
//   bool isCompleted = false;

//   // Video player controller
//   VideoPlayerController? _controller;

//   @override
//   void initState() {
//     super.initState();
//     _animationController = AnimationController(vsync: this);
//     _animationController.value = 0.15;
//     _animationController.duration = const Duration(milliseconds: 1500);
//     _checkGeneratedVideoUrl();
//   }

//   Future<void> _checkGeneratedVideoUrl() async {
//     DocumentSnapshot doc = await widget.weekRef.get();

//     if (doc.exists &&
//         doc['generatedVideoUrl'] != null &&
//         doc['generatedVideoUrl'].isNotEmpty) {
//       setState(() {
//         generatedVideoUrl = doc['generatedVideoUrl'];
//       });
//       _initializeVideoPlayer(generatedVideoUrl!);
//     } else {
//       setState(() {
//         _loading = false;
//       });
//     }
//   }

//   Future<void> _initializeVideoPlayer(String url) async {
//     _controller = VideoPlayerController.network(url)
//       ..initialize().then((_) {
//         setState(() {
//           isGenerating = false;
//           _loading = false;
//         }); // Ensure the video player UI updates
//       });
//   }

//   void _startVideoGeneration() async {
//     setState(() {
//       isGenerating = true;
//     });

//     await fetchAllPhotos(widget.weekRef);
//   }

//   // Functions to track the progress
//   Future<void> fetchAllPhotos(DocumentReference week) async {
//     setState(() {
//       progress = 0.0;
//       progressText = "Gathering the photos...";
//       status = GeneratingStatus.gettingPhotos;
//     });

//     // Actual fetch logic
//     List<Map<String, String>> photosList = [];
//     for (int day = 1; day <= 6; day++) {
//       setState(() {
//         progress = day / 6.0;
//         percentage = "${(progress! * 100).truncate()}";
//         progressText = "Gathering Photos: Day $day/6";
//       });

//       DocumentSnapshot taskDoc;
//       if (day == 1) {
//         taskDoc = await week
//             .collection('days')
//             .doc(day.toString())
//             .collection('tasks')
//             .doc("1")
//             .get();
//       } else {
//         QuerySnapshot taskCollection = await week
//             .collection('days')
//             .doc(day.toString())
//             .collection('tasks')
//             .get();

//         int taskCount = taskCollection.size;
//         taskDoc = await week
//             .collection('days')
//             .doc(day.toString())
//             .collection('tasks')
//             .doc(taskCount.toString())
//             .get();
//       }

//       if (taskDoc.exists) {
//         Map<String, String>? photos =
//             Map<String, String>.from(taskDoc['photos'] ?? {});

//         if (photos.containsKey('p1') && photos.containsKey('p2')) {
//           photosList.add({'p1': photos['p1']!, 'p2': photos['p2']!});
//         }
//       }
//     }

//     List<String> fetchedImages = [];
//     for (var photoMap in photosList) {
//       fetchedImages.add(photoMap['p1']!);
//       fetchedImages.add(photoMap['p2']!);
//     }

//     await generateVideo(fetchedImages);
//   }

//   Future<void> generateVideo(List<String> imageUrls) async {
//     setState(() {
//       progress = null;
//       percentage = ""; // Indeterminate progress
//       progressText = "Organizing...";
//     });

//     // API endpoint
//     final String apiUrl = 'https://api.shotstack.io/edit/stage/render';
//     var headers = {
//       'x-api-key': 'LFfnJVLq61WTtJDPxK1QxQOlD2mcJunscai2MYQJ',
//       'Content-Type': 'application/json',
//     };

//     List<Map<String, dynamic>> clips = [];
//     for (int i = 0; i < imageUrls.length; i++) {
//       clips.add({
//         "asset": {
//           "type": "image",
//           "src": imageUrls[i],
//         },
//         "start": i * 4, // Assuming each clip starts every 4 seconds
//         "length": 5, // Each clip is 5 seconds long
//         "effect": i % 2 == 0 ? "zoomIn" : "slideLeft", // Alternate effects
//         "transition": {"out": "fade"}
//       });
//     }

//     var body = {
//       "timeline": {
//         "soundtrack": {
//           "src":
//               "https://shotstack-assets.s3-ap-southeast-2.amazonaws.com/music/freepd/advertising.mp3",
//           "effect": "fadeInFadeOut"
//         },
//         "tracks": [
//           {"clips": clips}
//         ]
//       },
//       "output": {"format": "mp4", "resolution": "sd"}
//     };

//     final response = await http.post(
//       Uri.parse(apiUrl),
//       headers: headers,
//       body: jsonEncode(body),
//     );

//     if (response.statusCode == 201) {
//       var jsonResponse = jsonDecode(response.body);
//       String renderId = jsonResponse["response"]["id"];
//       await pollRenderStatus(renderId);
//     } else {
//       setState(() {
//         progressText = "Failed to generate video.";
//       });
//     }
//   }

//   Future<void> pollRenderStatus(String renderId) async {
//     setState(() {
//       progress = 0.0;
//       percentage = "0"; // Indeterminate progress
//       progressText = "Processing...";
//       status = GeneratingStatus.processing;
//     });

//     final String statusApiUrl =
//         'https://api.shotstack.io/edit/stage/render/$renderId';
//     var headers = {
//       'x-api-key': 'LFfnJVLq61WTtJDPxK1QxQOlD2mcJunscai2MYQJ',
//       'Content-Type': 'application/json',
//     };

//     bool isDone = false;
//     double i = 0;
//     while (!isDone) {
//       final response =
//           await http.get(Uri.parse(statusApiUrl), headers: headers);

//       if (response.statusCode == 200) {
//         var jsonResponse = jsonDecode(response.body);
//         String status = jsonResponse["response"]["status"];

//         if (status == "done") {
//           String videoUrl = jsonResponse["response"]["url"];
//           await getVideoFromUrl(videoUrl);
//           isDone = true;
//         } else {
//           await Future.delayed(Duration(seconds: 2));
//         }
//       } else {
//         setState(() {
//           progressText = "Failed to render video.";
//         });
//         break;
//       }
//       setState(() {
//         i = i + 4;
//         progress = i / 30;
//         percentage = "${(progress! * 100).truncate()}";
//       });
//     }
//   }

//   Future<void> getVideoFromUrl(String videoUrl) async {
//     setState(() {
//       progress = 0.0;
//       percentage = "0";
//       progressText = "Generating...";
//       status = GeneratingStatus.generating;
//     });

//     final client = http.Client();
//     final request = http.Request('GET', Uri.parse(videoUrl));
//     final streamedResponse = await client.send(request);
//     final int contentLength =
//         int.parse(streamedResponse.headers['content-length']!);

//     List<int> bytes = [];
//     int bytesDownloaded = 0;

//     await for (var chunk in streamedResponse.stream) {
//       bytes.addAll(chunk);
//       bytesDownloaded += chunk.length;

//       setState(() {
//         progress = bytesDownloaded / contentLength;
//         percentage = "${(progress! * 100).truncate()}";
//         progressText = "Generating...";
//       });
//     }

//     await uploadToFirebase(bytes);
//   }

//   Future<void> uploadToFirebase(List<int> bytes) async {
//     setState(() {
//       progress = 0.0;
//       percentage = "0";
//       progressText = "Saving Your Video...";
//       status = GeneratingStatus.saving;
//     });

//     Uint8List videoBytes = Uint8List.fromList(bytes);
//     final storageRef = FirebaseStorage.instance
//         .ref()
//         .child("uploads/videos/generated_video.mp4");
//     final uploadTask = storageRef.putData(videoBytes);

//     uploadTask.snapshotEvents.listen((snapshot) {
//       setState(() {
//         progress = snapshot.bytesTransferred / snapshot.totalBytes;
//         percentage = "${(progress! * 100).truncate() > 100 ? 100 : (progress! * 100).truncate()}";

//         progressText = "Saving Your Video...";
//       });
//     });
//     final TaskSnapshot taskSnapshot = await uploadTask;
//     final String downloadUrl = await taskSnapshot.ref.getDownloadURL();

//     setState(() {
//       progressText = "Video Completed!";
//       percentage = "100";
//       generatedVideoUrl = downloadUrl;
//       isCompleted = true;
//       // isGenerating = false;
//     });

//     // Update Firestore document with the generated video URL
//     await widget.weekRef.update({'generatedVideoUrl': downloadUrl});

//     // Initialize the video player to play the uploaded video
//     _initializeVideoPlayer(downloadUrl);
//   }

//   @override
//   Widget build(BuildContext context) {

//     return Scaffold(
//       backgroundColor: Colors.white,
//       appBar: AppBar(
//         title: Text("Video Generation"),
//       ),
      
//       body: Padding(
//         padding: const EdgeInsets.all(16.0),
//         child: _loading
//             ? const Center(
//                 child: SpinKitFoldingCube(
//                   color: primaryColor,
//                   size: 50.0,
//                 ),
//               )
//             : Column(
//                 crossAxisAlignment: CrossAxisAlignment.center,
//                 children: [
//                   if (generatedVideoUrl != null &&
//                       _controller?.value.isInitialized == true)
//                     Column(
//                       children: [
//                         AspectRatio(
//                           aspectRatio: _controller!.value.aspectRatio,
//                           child: VideoPlayer(_controller!),
//                         ),
//                         SizedBox(height: 10),
//                         ElevatedButton(
//                           onPressed: () {
//                             setState(() {
//                               _controller!.value.isPlaying
//                                   ? _controller!.pause()
//                                   : _controller!.play();
//                             });
//                           },
//                           child: Icon(
//                             _controller!.value.isPlaying
//                                 ? Icons.pause
//                                 : Icons.play_arrow,
//                           ),
//                         ),
//                       ],
//                     )
//                   else if (!isGenerating &&
//                       (_controller?.value.isInitialized == false ||
//                           _controller?.value.isInitialized == null))
//                     Column(
//                       children: [
//                         Padding(
//                           padding: const EdgeInsets.all(8.0),
//                           child: Lottie.asset(
//                             "assets/lottie/Gen_${status.name}.json",
//                             repeat: false,
//                             controller: _animationController..forward(),
//                           ),
//                         ),
//                         Center(
//                           child: PrimaryButton(
//                               text: "Generate Video",
//                               onPressed: _startVideoGeneration),
//                         ),
//                       ],
//                     )
//                   else
//                     Column(
//                       children: [
//                         SizedBox(
//                           height: 400,
//                           child: Padding(
//                             padding: EdgeInsets.all(
//                                 status == GeneratingStatus.processing
//                                     ? 40
//                                     : status == GeneratingStatus.saving
//                                         ? 90
//                                         : 0),
//                             child: Lottie.asset(
//                               "assets/lottie/Gen_${status.name}.json",
//                             ),
//                           ),
//                         ),

//                         // const SizedBox(height: 25),

//                         Align(
//                           alignment: Alignment.bottomRight,
//                           child: Text(
//                             "$percentage%",
//                             style: const TextStyle(
//                               color: Colors.cyan,
//                             ),
//                           ),
//                         ),
//                         LinearProgressIndicator(
//                           value: progress,
//                           color: Colors.cyan,
//                           minHeight: 20,
//                           borderRadius: BorderRadius.circular(20),
//                         ),
//                         Text(
//                           progressText,
//                           style: GoogleFonts.roboto(
//                               color: Colors.black.withOpacity(0.75),
//                               fontSize: 21),
//                         ),
//                         isCompleted
//                             ? const SizedBox(
//                                 width: 40,
//                                 height: 40,
//                                 child: CircularProgressIndicator(),
//                               )
//                             : Container()
//                       ],
//                     ),
//                 ],
//               ),
//       ),
//     );
//   }

//   @override
//   void dispose() {
//     _controller?.dispose();
//     super.dispose();
//   }
// }
