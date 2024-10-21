import 'dart:convert';
import 'dart:developer';
import 'dart:typed_data';
import 'package:animate_do/animate_do.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:http/http.dart' as http;
import 'package:illimited_app/constant/const.dart';
import 'package:illimited_app/providers/progress_provider.dart';
import 'package:illimited_app/services/notification_service.dart';
import 'package:illimited_app/services/user_repository.dart';
import 'package:illimited_app/utils/utils.dart';
import 'package:illimited_app/widget/primary_button.dart';
import 'package:just_audio/just_audio.dart';
import 'package:lottie/lottie.dart';
import 'package:provider/provider.dart';
import 'package:video_player/video_player.dart';
import 'package:percent_indicator/percent_indicator.dart';
import 'package:uuid/uuid.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class VideoGenerationTask extends StatefulWidget {
  final DocumentReference weekRef;
  final DocumentReference dayRef;
  final Map<String, dynamic> taskData;
  final bool isLastDay;
  final bool isLastTask;
  VideoGenerationTask(
      {required this.weekRef,
      required this.taskData,
      required this.isLastDay,
      required this.isLastTask,
      required this.dayRef});

  @override
  _VideoGenerationTaskState createState() => _VideoGenerationTaskState();
}

enum GeneratingStatus {
  idle,
  gettingPhotos,
  generating,
  processing,
  saving,
  completed
}

class _VideoGenerationTaskState extends State<VideoGenerationTask>
    with TickerProviderStateMixin {
  late DocumentReference<Map<String, dynamic>> taskRef;
  late AnimationController _controller;
  final _soundPlayer = AudioPlayer();
  bool isUploaded = false;
  bool isUploading = false;
  bool isTaskCompleted = false;
  bool isBtnEnabled = false;
  String btnText = "";
  Widget? btnIcon;
  //---------//
  late AnimationController _animationController;
  GeneratingStatus status = GeneratingStatus.idle;
  bool _loading = true;
  bool _isLoading = true;
  String? generatedVideoUrl;
  bool isGenerating = false;
  double? progress = 0;
  String percentage = "";
  String progressText = "";
  bool isCompleted = false;
  bool isReadyToGenerate = false;

  VideoPlayerController? _videoController;
  bool isVideoWatched = false;

  @override
  void initState() {
    super.initState();
    taskRef = FirebaseFirestore.instance
        .collection('users')
        .doc(FirebaseAuth.instance.currentUser!.uid)
        .collection('weeks')
        .doc(widget.taskData['weekKey'])
        .collection("days")
        .doc(widget.taskData['dayKey'])
        .collection('tasks')
        .doc(widget.taskData['taskNumber']);

    _animationController = AnimationController(vsync: this);
    _animationController.value = 0.15;
    _animationController.duration = const Duration(milliseconds: 1500);
    _soundPlayer.setAsset('assets/sounds/taskCompleted.mp3');
    _checkGeneratedVideoUrl().then(
      (value) {},
    );
  }

  Future<void> _completeTask() async {
    await taskRef.update({
      'isCompleted': true,
    });

    if (widget.isLastTask) {
      await context.read<UserProgressProvider>().currentDayRef!.update({
        'isCompleted': true,
      });
      if (widget.isLastDay) {
        await context.read<UserProgressProvider>().currentWeekRef!.update({
          'isCompleted': true,
        });

        if (context.read<UserProgressProvider>().currentWeekRef!.id == "8") {
          NotificationService().cancelAllNotifications();
          NotificationService().instantNotification(context);
        }
      }
    }
    return;
  }

  Future<void> _checkGeneratedVideoUrl() async {
    Map<String, dynamic>? task;
    try {
      var taskSnapshot = await taskRef.get();

      task = taskSnapshot.data();
    } catch (e) {
      log(e.toString());
    }
    if (task != null) {
      if (task['isCompleted']) {
        isTaskCompleted = true;
        setState(() {
          btnText = AppLocalizations.of(context)!.completed;
          btnIcon = Image.asset(
            "assets/icon/check1.png",
            color: Colors.white,
          );
        });
        _isLoading = false;
      } else {
        setState(() {
          btnText = AppLocalizations.of(context)!.done;
          _isLoading = false;
        });
      }
    }
    //----------//
    DocumentSnapshot doc = await widget.weekRef.get();

    if (widget.weekRef.id == "8") {
      if (doc.exists) {
        if (widget.dayRef.id == "4") {
          if (doc['day4GeneratedVideoUrl'] != null &&
              doc['day4GeneratedVideoUrl'].isNotEmpty) {
            setState(() {
              generatedVideoUrl = doc['day4GeneratedVideoUrl'];
            });
            _initializeVideoPlayer(generatedVideoUrl!);
          } else {
            // setState(() {
            //   _loading = false;
            // });
            checkPhotosAvailability(widget.weekRef, int.parse(widget.dayRef.id))
                .then(
              (photosAvailable) {
                if (photosAvailable) {
                  setState(() {
                    isReadyToGenerate = true;
                  });
                }
                setState(() {
                  _loading = false;
                });
              },
            );
          }
        } else if (widget.dayRef.id == "5") {
          if (doc['day5GeneratedVideoUrl'] != null &&
              doc['day5GeneratedVideoUrl'].isNotEmpty) {
            setState(() {
              generatedVideoUrl = doc['day5GeneratedVideoUrl'];
            });
            _initializeVideoPlayer(generatedVideoUrl!);
          } else {
            checkPhotosAvailability(widget.weekRef, int.parse(widget.dayRef.id))
                .then(
              (photosAvailable) {
                if (photosAvailable) {
                  setState(() {
                    isReadyToGenerate = true;
                  });
                }
                setState(() {
                  _loading = false;
                });
              },
            );
          }
        } else if (widget.dayRef.id == "6") {
          if (doc['day6GeneratedVideoUrl'] != null &&
              doc['day6GeneratedVideoUrl'].isNotEmpty) {
            setState(() {
              generatedVideoUrl = doc['day6GeneratedVideoUrl'];
            });
            _initializeVideoPlayer(generatedVideoUrl!);
          } else {
            checkPhotosAvailability(widget.weekRef, int.parse(widget.dayRef.id))
                .then(
              (photosAvailable) {
                if (photosAvailable) {
                  setState(() {
                    isReadyToGenerate = true;
                  });
                }
                setState(() {
                  _loading = false;
                });
              },
            );
          }
        } else if (widget.dayRef.id == "7") {
          if (doc['day7GeneratedVideoUrl'] != null &&
              doc['day7GeneratedVideoUrl'].isNotEmpty) {
            setState(() {
              generatedVideoUrl = doc['day7GeneratedVideoUrl'];
            });
            _initializeVideoPlayer(generatedVideoUrl!);
          } else {
            checkPhotosAvailability(widget.weekRef, int.parse(widget.dayRef.id))
                .then(
              (photosAvailable) {
                if (photosAvailable) {
                  setState(() {
                    isReadyToGenerate = true;
                  });
                }
                setState(() {
                  _loading = false;
                });
              },
            );
          }
        }
      } else {
        checkPhotosAvailability(widget.weekRef, int.parse(widget.dayRef.id))
            .then(
          (photosAvailable) {
            if (photosAvailable) {
              setState(() {
                isReadyToGenerate = true;
              });
            }
            setState(() {
              _loading = false;
            });
          },
        );
      }
    } else {
      if (doc.exists &&
          doc['generatedVideoUrl'] != null &&
          doc['generatedVideoUrl'].isNotEmpty) {
        setState(() {
          generatedVideoUrl = doc['generatedVideoUrl'];
        });
        _initializeVideoPlayer(generatedVideoUrl!);
      } else {
        checkPhotosAvailability(widget.weekRef, int.parse(widget.dayRef.id))
            .then(
          (photosAvailable) {
            if (photosAvailable) {
              setState(() {
                isReadyToGenerate = true;
              });
            }
            setState(() {
              _loading = false;
            });
          },
        );
      }
    }
  }

  Future<void> _initializeVideoPlayer(String url) async {
    _videoController = VideoPlayerController.network(url)
      ..initialize().then((_) {
        setState(() {
          isGenerating = false;
          _loading = false;
        }); // Ensure the video player UI updates
      });
    _videoController?.addListener(() {
      if (_videoController!.value.position ==
          _videoController!.value.duration) {
        setState(() {
          isVideoWatched = true;
        });
      }
    });
  }

  void _startVideoGeneration() async {
    setState(() {
      isGenerating = true;
    });

    await fetchAllPhotos(widget.weekRef, widget.dayRef);
  }

  Future<void> fetchAllPhotos(
      DocumentReference weekRef, DocumentReference dayRef) async {
    log("IN fetchAllPhotos");
    setState(() {
      progress = 0.0;
      progressText = AppLocalizations.of(context)!.gatheringThePhotos;
      status = GeneratingStatus.gettingPhotos;
    });

    // Determine which week and day we're working with
    int weekNumber = int.parse(weekRef.id);
    int dayNumber = int.parse(dayRef.id); // The current day we're on

    List<Map<String, String>> photosList = [];

    if (weekNumber <= 7) {
      // For weeks 1-7, use the original logic
      await _fetchPhotosForWeek(weekRef, photosList);
    } else if (weekNumber == 8) {
      // For week 8, we have special cases depending on the current day
      if (dayNumber == 4) {
        // Fetch from day 2 and day 3 of weeks 1-7
        await _fetchPhotosFromWeeks([2, 3], dayNumber, photosList);
      } else if (dayNumber == 5) {
        // Fetch from day 4 and day 5 of weeks 1-7
        await _fetchPhotosFromWeeks([4, 5], dayNumber, photosList);
      } else if (dayNumber == 6) {
        // Fetch from day 6 of weeks 1-7
        await _fetchPhotosFromWeeks([6], dayNumber, photosList);
      } else if (dayNumber == 7) {
        // Fetch from day 1 of weeks 1-7
        await _fetchPhotosFromWeeks([1], dayNumber, photosList);
      }
    }

    // Flatten the photos into a list
    List<String> fetchedImages = [];
    for (var photoMap in photosList) {
      fetchedImages.add(photoMap['p1']!);
      fetchedImages.add(photoMap['p2']!);
    }

    // Generate the video from fetched images
    await generateVideo(fetchedImages);
  }

// Helper function for weeks 1-7 to fetch photos for all days (1-6)
  Future<void> _fetchPhotosForWeek(
      DocumentReference weekRef, List<Map<String, String>> photosList) async {
    setState(() {
      progress = 0.0;
      progressText = AppLocalizations.of(context)!.gatheringThePhotos;
      status = GeneratingStatus.gettingPhotos;
    });
    for (int day = 1; day <= 6; day++) {
      setState(() {
        progress = day / 6.0;
        percentage = "${(progress! * 100).truncate()}";
        progressText = AppLocalizations.of(context)!.gatheringPhotosDay(day);
      });
      DocumentSnapshot taskDoc;

      if (day == 1) {
        // Fetch from the first task in day 1
        taskDoc = await weekRef
            .collection('days')
            .doc(day.toString())
            .collection('tasks')
            .doc("1")
            .get();
      } else {
        // Fetch from the last task in days 2-6
        QuerySnapshot taskCollection = await weekRef
            .collection('days')
            .doc(day.toString())
            .collection('tasks')
            .get();

        int taskCount = taskCollection.size;
        taskDoc = await weekRef
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
  }

// Helper function to fetch photos from specific days across all weeks 1-7
  Future<void> _fetchPhotosFromWeeks(List<int> daysToFetch, int dayNumber,
      List<Map<String, String>> photosList) async {
    String userId = FirebaseAuth.instance.currentUser!.uid;

    // Loop through weeks 1 to 8
    for (int weekNum = 1; weekNum <= 8; weekNum++) {
      // Only include week 8 if dayNumber is 4 or 7
      if (weekNum == 8 && (dayNumber != 4 && dayNumber != 7)) {
        continue; // Skip week 8 if dayNumber is not 4 or 7
      }

      setState(() {
        progress = weekNum / 8.0; // Including week 8 for dayNumber 4 or 7
        percentage = "${(progress! * 100).truncate()}";
        progressText = AppLocalizations.of(context)!.gatheringThePhotos;
      });

      DocumentReference weekRef = FirebaseFirestore.instance
          .collection('users/$userId/weeks')
          .doc(weekNum.toString());

      // Fetch photos for each day in daysToFetch
      for (int day in daysToFetch) {
        await _fetchPhotosForSpecificDay(weekRef, day, photosList);
      }
    }
  }

// Helper function to fetch photos for a specific day
  Future<void> _fetchPhotosForSpecificDay(DocumentReference weekRef, int day,
      List<Map<String, String>> photosList) async {
    DocumentSnapshot taskDoc;

    if (day == 1) {
      // Fetch from the first task in day 1
      taskDoc = await weekRef
          .collection('days')
          .doc(day.toString())
          .collection('tasks')
          .doc("1")
          .get();
    } else {
      // Fetch from the last task in days 2-7
      QuerySnapshot taskCollection = await weekRef
          .collection('days')
          .doc(day.toString())
          .collection('tasks')
          .get();

      int taskCount = taskCollection.size;
      taskDoc = await weekRef
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

  Future<void> generateVideo(List<String> imageUrls) async {
    setState(() {
      progress = null;
      percentage = ""; // Indeterminate progress
      progressText = AppLocalizations.of(context)!.organizing;
    });

    // API endpoint
    final String apiUrl = 'https://api.shotstack.io/edit/stage/render';
    var headers = {
      'x-api-key': 'LFfnJVLq61WTtJDPxK1QxQOlD2mcJunscai2MYQJ',
      'Content-Type': 'application/json',
    };

    List<Map<String, dynamic>> clips = [];
    for (int i = 0; i < imageUrls.length; i++) {
      clips.add({
        "asset": {
          "type": "image",
          "src": imageUrls[i],
        },
        "start": i * 4, // Assuming each clip starts every 4 seconds
        "length": 5, // Each clip is 5 seconds long
        "effect": i % 2 == 0 ? "zoomIn" : "slideLeft", // Alternate effects
        "transition": {"out": "fade"}
      });
    }

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
      "output": {
        "format": "mp4",
        // "resolution": "mobile",
        "size": {"width": 500, "height": 500}
      }
    };

    final response = await http.post(
      Uri.parse(apiUrl),
      headers: headers,
      body: jsonEncode(body),
    );

    if (response.statusCode == 201) {
      var jsonResponse = jsonDecode(response.body);
      String renderId = jsonResponse["response"]["id"];
      await pollRenderStatus(renderId);
    } else {
      setState(() {
        progressText = AppLocalizations.of(context)!.failedToRenderVideo;
      });
    }
  }

  Future<void> pollRenderStatus(String renderId) async {
    setState(() {
      progress = 0.0;
      percentage = "0"; // Indeterminate progress
      progressText = AppLocalizations.of(context)!.processing;
      status = GeneratingStatus.processing;
    });

    final String statusApiUrl =
        'https://api.shotstack.io/edit/stage/render/$renderId';
    var headers = {
      'x-api-key': 'LFfnJVLq61WTtJDPxK1QxQOlD2mcJunscai2MYQJ',
      'Content-Type': 'application/json',
    };

    bool isDone = false;
    double i = 0;
    while (!isDone) {
      final response =
          await http.get(Uri.parse(statusApiUrl), headers: headers);

      if (response.statusCode == 200) {
        var jsonResponse = jsonDecode(response.body);
        String status = jsonResponse["response"]["status"];

        if (status == "done") {
          String videoUrl = jsonResponse["response"]["url"];
          await getVideoFromUrl(videoUrl);
          isDone = true;
        } else {
          await Future.delayed(Duration(seconds: 2));
        }
      } else {
        setState(() {
          progressText = AppLocalizations.of(context)!.failedToRenderVideo;
        });
        break;
      }
      setState(() {
        i = i + 4;
        if (i > 30) {
          i = 30;
        }
        progress = i / 30;
        percentage = "${(progress! * 100).truncate()}";
      });
    }
  }

  Future<void> getVideoFromUrl(String videoUrl) async {
    setState(() {
      progress = 0.0;
      percentage = "0";
      progressText = AppLocalizations.of(context)!.generating;
      status = GeneratingStatus.generating;
    });

    final client = http.Client();
    final request = http.Request('GET', Uri.parse(videoUrl));
    final streamedResponse = await client.send(request);
    final int contentLength =
        int.parse(streamedResponse.headers['content-length']!);

    List<int> bytes = [];
    int bytesDownloaded = 0;

    await for (var chunk in streamedResponse.stream) {
      bytes.addAll(chunk);
      bytesDownloaded += chunk.length;

      setState(() {
        progress = bytesDownloaded / contentLength;
        percentage = "${(progress! * 100).truncate()}";
        progressText = AppLocalizations.of(context)!.generating;
      });
    }

    await uploadToFirebase(bytes);
  }

  Future<void> uploadToFirebase(List<int> bytes) async {
    String userName = FirebaseAuth.instance.currentUser!.displayName!;
    var uuid = const Uuid();
    String uuid_v4 = uuid.v4();

    setState(() {
      progress = 0.0;
      percentage = "0";
      progressText = AppLocalizations.of(context)!.savingYourVideo;
      status = GeneratingStatus.saving;
    });

    Uint8List videoBytes = Uint8List.fromList(bytes);
    final storageRef = FirebaseStorage.instance
        .ref()
        .child("GeneratedVideos/$userName/$uuid_v4.mp4");
    final uploadTask = storageRef.putData(videoBytes);

    uploadTask.snapshotEvents.listen((snapshot) {
      setState(() {
        progress = snapshot.bytesTransferred / snapshot.totalBytes;
        if (progress! > 100) {
          percentage = "100";
        } else {
          percentage = "${(progress! * 100).truncate()}";
        }

        progressText = AppLocalizations.of(context)!.savingYourVideo;
      });
    });
    final TaskSnapshot taskSnapshot = await uploadTask;
    final String downloadUrl = await taskSnapshot.ref.getDownloadURL();

    setState(() {
      progressText = AppLocalizations.of(context)!.videoCompleted;
      percentage = "100";
      generatedVideoUrl = downloadUrl;
      isCompleted = true;
      // isGenerating = false;
    });

    // Update Firestore document with the generated video URL
    if (widget.weekRef.id == "8") {
      if (widget.dayRef.id == "4") {
        await widget.weekRef.update({'day4GeneratedVideoUrl': downloadUrl});
      } else if (widget.dayRef.id == "5") {
        await widget.weekRef.update({'day5GeneratedVideoUrl': downloadUrl});
      } else if (widget.dayRef.id == "6") {
        await widget.weekRef.update({'day6GeneratedVideoUrl': downloadUrl});
      } else if (widget.dayRef.id == "7") {
        await widget.weekRef.update({'day7GeneratedVideoUrl': downloadUrl});
      }
    } else {
      await widget.weekRef.update({'generatedVideoUrl': downloadUrl});
    }

    // Initialize the video player to play the uploaded video
    _initializeVideoPlayer(downloadUrl);
  }

  @override
  Widget build(BuildContext context) {
    log("_loading = $_loading");
    if (btnText == "") {
      btnText = AppLocalizations.of(context)!.done;
    }
    _controller = AnimationController(vsync: this);
    _controller.duration = Duration(milliseconds: 1800);
    _controller.forward();

    return PopScope(
      canPop: false,
      onPopInvoked: (didPop) {
        if (didPop) {
          return;
        }
        log("isGenerating = $isGenerating | isUploading = $isUploading | _isLoading = $_isLoading");
        if (isGenerating || isUploading || _isLoading) {
        } else {
          context.pop();
        }
      },
      // canPop: false,
      // onPopInvoked: (didPop) {
      //   log("isGenerating = $isGenerating | isUploading = $isUploading");
      //   if (isGenerating || isUploading) {
      //   } else {
      //     context.pop();
      //   }
      // },
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          foregroundColor: Colors.white,
          toolbarHeight: 80,
          backgroundColor: primaryColor,
          centerTitle: true,
          title: InkWell(
            child: Text(
              AppLocalizations.of(context)!.bestOfVideo,
              style: GoogleFonts.roboto()
                  .copyWith(fontSize: 27, letterSpacing: 1.5),
            ),
          ),
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        floatingActionButton: PrimaryButton(
          icon: btnIcon,
          enabled: isVideoWatched && !isTaskCompleted,
          borderRadius: 0,
          text: btnText,
          onPressed: () async {
            showUploadingContent(context);
            await _completeTask();

            setState(() {
              isUploaded = true;
            });
            context.pop();
            await Future.delayed(
              const Duration(milliseconds: 800),
            );
            _soundPlayer.play();

            await Future.delayed(
              const Duration(milliseconds: 1400),
            );
            context.pop(true);
          },
        ),
        body: Stack(
          children: [
            _loading
                ? const Center(
                    child: SpinKitFoldingCube(
                      color: primaryColor,
                      size: 50.0,
                    ),
                  )
                : SingleChildScrollView(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        if (generatedVideoUrl != null &&
                            _videoController?.value.isInitialized == true)
                          Stack(
                            children: [
                              Column(
                                children: [
                                  AspectRatio(
                                    aspectRatio:
                                        _videoController!.value.aspectRatio,
                                    child: VideoPlayer(_videoController!),
                                  ),
                                ],
                              ),
                              Positioned(
                                bottom: 50,
                                left: getScreenWidth(context) * 0.4,
                                right: getScreenWidth(context) * 0.4,
                                child: ElevatedButton(
                                  style: ElevatedButton.styleFrom(
                                      backgroundColor: primaryColor,
                                      foregroundColor: Colors.white),
                                  onPressed: () {
                                    setState(() {
                                      _videoController!.value.isPlaying
                                          ? _videoController!.pause()
                                          : _videoController!.play();
                                    });
                                  },
                                  child: Icon(
                                    _videoController!.value.isPlaying
                                        ? Icons.pause
                                        : Icons.play_arrow,
                                  ),
                                ),
                              ),
                            ],
                          )
                        else if (!isGenerating &&
                            (_videoController?.value.isInitialized == false ||
                                _videoController?.value.isInitialized == null))
                          Padding(
                            padding: const EdgeInsets.all(16),
                            child: Column(
                              children: [
                                ZoomIn(
                                  child: Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Lottie.asset(
                                      "assets/lottie/Gen_${GeneratingStatus.idle.name}.json",
                                      repeat: false,
                                      controller: _animationController
                                        ..forward(),
                                    ),
                                  ),
                                ),
                                Center(
                                  child: PrimaryButton(
                                      enabled: isReadyToGenerate,
                                      text: AppLocalizations.of(context)!
                                          .generateVideo,
                                      onPressed: _startVideoGeneration),
                                ),
                                Visibility(
                                  visible: !isReadyToGenerate,
                                  child: Text(
                                    AppLocalizations.of(context)!
                                        .takeRemainingPhotosBeforeGenerating,
                                    textAlign: TextAlign.center,
                                    style: getFontStyle(context).copyWith(
                                      color: Colors.black.withOpacity(0.5),
                                      fontSize: 15,
                                    ),
                                  ),
                                )
                              ],
                            ),
                          )
                        else
                          Padding(
                            padding: const EdgeInsets.all(16),
                            child: Column(
                              children: [
                                Text(
                                  progressText,
                                  style: GoogleFonts.roboto(
                                      color: Colors.black.withOpacity(0.75),
                                      fontSize: 25),
                                ),
                                ZoomIn(
                                  child: SizedBox(
                                    height: 400,
                                    child: Padding(
                                      padding: EdgeInsets.all(status ==
                                              GeneratingStatus.processing
                                          ? 40
                                          : status == GeneratingStatus.saving
                                              ? 90
                                              : 0),
                                      child: Lottie.asset(
                                        "assets/lottie/Gen_${status.name}.json",
                                      ),
                                    ),
                                  ),
                                ),

                                // const SizedBox(height: 25),

                                Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 12),
                                  child: Align(
                                    alignment: Alignment.bottomRight,
                                    child: Text(
                                      "$percentage%",
                                      style: const TextStyle(
                                        color: Colors.cyan,
                                      ),
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 12),
                                  child: LinearProgressIndicator(
                                    value: progress,
                                    color: Colors.cyan,
                                    minHeight: 30,
                                    borderRadius: BorderRadius.circular(20),
                                  ),
                                ),

                                isCompleted
                                    ? const SizedBox(
                                        width: 40,
                                        height: 40,
                                        child: CircularProgressIndicator(),
                                      )
                                    : Container(),
                                SizedBox(
                                  height: 30,
                                ),
                                Text(
                                  AppLocalizations.of(context)!
                                      .pleaseDoNotNavigateAway,
                                  textAlign: TextAlign.center,
                                  style: GoogleFonts.roboto(
                                      color: errorColor.withOpacity(0.5),
                                      fontSize: 20),
                                ),
                              ],
                            ),
                          ),
                      ],
                    ),
                  ),
            Visibility(
              visible: isUploaded,
              child: Positioned.fill(
                child: Container(
                  color: Colors.black.withOpacity(0.5),
                  child: Center(
                    child: Center(
                      child: SizedBox(
                        width: 250,
                        child: Lottie.asset(
                          "assets/lottie/taskChecked.json",
                          repeat: false,
                          controller: _controller,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  void dispose() {
    _videoController?.dispose();
    _soundPlayer.dispose();
    _controller.dispose();
    super.dispose();
  }
}
