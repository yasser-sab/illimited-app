import 'dart:developer';
import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/animation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:illimited_app/constant/const.dart';
import 'package:illimited_app/providers/progress_provider.dart';
import 'package:illimited_app/router/router_names.dart';
import 'package:illimited_app/utils/utils.dart';
import 'package:illimited_app/widget/PictureTask/photo_taker.dart';
import 'package:illimited_app/widget/PictureTask/photo_viewer.dart';
import 'package:illimited_app/widget/end_drawer.dart';
import 'package:illimited_app/widget/primary_button.dart';
import 'package:image_picker/image_picker.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:lottie/lottie.dart';
import 'package:just_audio/just_audio.dart';
import 'package:provider/provider.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class PhotoTask extends StatefulWidget {
  const PhotoTask(
      {super.key,
      required this.taskData,
      required this.isLastTask,
      required this.isLastDay});
  final Map<String, dynamic> taskData;
  final bool isLastTask;
  final bool isLastDay;

  @override
  PhotoTaskState createState() => PhotoTaskState();
}

class PhotoTaskState extends State<PhotoTask> with TickerProviderStateMixin {
  late AnimationController _controller;
  final _soundPlayer = AudioPlayer();
  late Future<Map<String, dynamic>> _futurePhotos;
  late DocumentReference<Map<String, dynamic>> taskRef;
  bool isUploaded = false;
  bool isLoading = true;
  bool isTaskCompleted = false;
  String btnText = "";
  Widget? btnIcon;
  bool isUploading = false;

  @override
  initState() {
    super.initState();
    if (context.read<UserProgressProvider>().currentDayRef == null) {
      log("DAY REF NOT FOUND");
      context.replaceNamed(RouteNames.dashboard);
    }
    taskRef = FirebaseFirestore.instance
        .collection('users')
        .doc(FirebaseAuth.instance.currentUser!.uid)
        .collection('weeks')
        .doc(widget.taskData['weekKey'])
        .collection("days")
        .doc(widget.taskData['dayKey'])
        .collection('tasks')
        .doc(widget.taskData['taskNumber']);

    _futurePhotos = getPhotos();
    _soundPlayer.setAsset('assets/sounds/taskCompleted.mp3');
  }

  @override
  void dispose() {
    _soundPlayer.dispose();
    _controller.dispose();
    super.dispose();
  }

  Future<Map<String, dynamic>> getPhotos() async {
    Map<String, dynamic>? task;

    try {
      var taskSnapshot = await taskRef.get();

      task = taskSnapshot.data();
    } catch (e) {
      log(e.toString());
    }

    if (task!['photos']['p1'] != "" && task['photos']['p2'] != "") {
      log("photo is available");

      setState(() {
        btnText = AppLocalizations.of(context)!.completed;
        isTaskCompleted = true;
        btnIcon = Image.asset(
          "assets/icon/check1.png",
          color: Colors.white,
        );
      });
      isLoading = false;
      return task['photos'];
    } else {
      isLoading = false;
      return {};
    }
  }

  bool _isFirstPhotoTaken = false;
  bool _isSecondPhotoTaken = false;
  File? _firstPhoto;
  File? _secondPhoto;

  void isPhoto1Taken(bool isTaken, File? photo) {
    setState(() {
      _isFirstPhotoTaken = isTaken;
      _firstPhoto = photo;
    });
  }

  void isPhoto2Taken(bool isTaken, File? photo) {
    setState(() {
      _isSecondPhotoTaken = isTaken;
      _secondPhoto = photo;
    });
  }

  Future<void> _updateTask(String p1Url, String p2Url) async {
    try {
      await taskRef.update({'photos.p1': p1Url, 'photos.p2': p2Url});
      log('Image URL updated in Firestore');
    } catch (e) {
      log('Error updating Firestore: $e');
    }
  }

  Future<void> _uploadImages() async {
    if (_secondPhoto != null && _firstPhoto != null) {
      try {
        final storageRefP1 = FirebaseStorage.instance
            .ref()
            .child('photos/-1-${DateTime.now().millisecondsSinceEpoch}.jpg');

        final storageRefP2 = FirebaseStorage.instance
            .ref()
            .child('photos/-2-${DateTime.now().millisecondsSinceEpoch}.jpg');

        UploadTask uploadTask1 = storageRefP1.putFile(_firstPhoto!);
        UploadTask uploadTask2 = storageRefP2.putFile(_secondPhoto!);

        TaskSnapshot snapshot1 = await uploadTask1;
        TaskSnapshot snapshot2 = await uploadTask2;
        String downloadUrlP1 = await snapshot1.ref.getDownloadURL();
        String downloadUrlP2 = await snapshot2.ref.getDownloadURL();

        await _updateTask(downloadUrlP1, downloadUrlP2).then(
          (value) async {
            log("TASK DONE");
            await taskRef.update({
              'isCompleted': true,
            });
            if (widget.isLastTask) {
              await context.read<UserProgressProvider>().currentDayRef!.update({
                'isCompleted': true,
              });
              if (widget.isLastDay) {
                await context
                    .read<UserProgressProvider>()
                    .currentWeekRef!
                    .update({
                  'isCompleted': true,
                });
              }
            }
          },
        );
      } catch (e) {
        log('Error uploading image: $e');
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    if (btnText == "") {
      btnText = AppLocalizations.of(context)!.done;
    }
    _controller = AnimationController(vsync: this);
    _controller.duration = Duration(milliseconds: 1800);
    _controller.forward();
    double borderRadius = 12;
    return PopScope(
      canPop: false,
      onPopInvoked: (didPop) {
        if (didPop) {
          return;
        }
        if ((_isFirstPhotoTaken || _isSecondPhotoTaken) &&
            !isTaskCompleted &&
            !isUploading &&
            !isLoading) {
          showConfirmationDialog(
            context,
            AppLocalizations.of(context)!.taskNotDoneYetDiscardAnyways,
            true,
          );
        } else if (isUploading) {
        } else {
          context.pop();
        }
      },
      child: Scaffold(
        backgroundColor: Colors.white,
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        floatingActionButton: PrimaryButton(
          icon: btnIcon,
          enabled: (!isUploading && _isFirstPhotoTaken && _isSecondPhotoTaken)
              ? true
              : false,
          borderRadius: 0,
          text: btnText,
          onPressed: () async {
            isUploading = true;
            showUploadingContent(context);
            await _uploadImages();
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
        appBar: AppBar(
          foregroundColor: Colors.white,
          toolbarHeight: 80,
          backgroundColor: primaryColor,
          centerTitle: true,
          title: InkWell(
            onTap: () async {
              log("message");
            },
            child: Text(
              widget.taskData['title'],
              style: GoogleFonts.roboto()
                  .copyWith(fontSize: 27, letterSpacing: 1.5),
            ),
          ),
        ),
        body: Stack(
          children: [
            FutureBuilder(
              future: _futurePhotos,
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return const Center(
                    child: SpinKitFoldingCube(
                      color: primaryColor,
                      size: 50.0,
                    ),
                  );
                }

                if (snapshot.hasError) {
                  log("error = ${snapshot.error}");
                  return Center(
                      child: Text(
                    AppLocalizations.of(context)!.somethingWentWrong,
                    style: TextStyle(color: Colors.black),
                  ));
                }

                if (snapshot.hasData) {
                  Map<String, dynamic> photos = snapshot.data!;
                  photos.forEach(
                    (key, value) {
                      log("$key = $value");
                    },
                  );
                  if (photos.isEmpty) {
                    return ListView(
                      shrinkWrap: true,
                      children: [
                        PhotoTaker(
                          isPhotoTaken: isPhoto1Taken,
                        ),
                        PhotoTaker(
                          isPhotoTaken: isPhoto2Taken,
                        ),
                        const SizedBox(
                          height: 100,
                        )
                      ],
                    );
                  } else {
                    List<Widget> lst = [];
                    for (int i = 1; i <= 2; i++) {
                      lst.add(
                        Padding(
                          padding: const EdgeInsets.all(12),
                          child: SingleChildScrollView(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                GestureDetector(
                                  onTap: () {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) =>
                                            FullScreenImageView(
                                          imageUrl: photos['p$i'],
                                          heroTag: 'image$i',
                                        ),
                                      ),
                                    );
                                  },
                                  child: Container(
                                    width: double.infinity,
                                    height: getScreenHeight(context) * 0.4,
                                    decoration: BoxDecoration(
                                        color: primaryColor.withOpacity(0.1),
                                        borderRadius:
                                            BorderRadius.circular(borderRadius),
                                        border: Border.all(
                                            width: 2, color: primaryColor)),
                                    child: ClipRRect(
                                      borderRadius: BorderRadius.circular(
                                          borderRadius - 2),
                                      child: Hero(
                                        tag: 'image$i',
                                        child: Image.network(
                                          photos['p$i'],
                                          frameBuilder: (BuildContext context,
                                              Widget child,
                                              int? frame,
                                              bool wasSynchronouslyLoaded) {
                                            if (wasSynchronouslyLoaded) {
                                              return child;
                                            }
                                            return frame == null
                                                ? const Center(
                                                    child: SpinKitPulse(
                                                      color: primaryColor,
                                                      size: 35,
                                                    ),
                                                  )
                                                : child;
                                          },
                                          fit: BoxFit.cover,
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      );
                    }
                    return Padding(
                      padding: const EdgeInsets.all(12),
                      child: SingleChildScrollView(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            ...lst,
                            const SizedBox(
                              height: 100,
                            )
                          ],
                        ),
                      ),
                    );
                  }
                }
                return Center(
                  child: Text(AppLocalizations.of(context)!.somethingWentWrong),
                );
              },
            ),
            Visibility(
              visible: isUploaded,
              child: Positioned(
                top: 0,
                bottom: 0,
                right: 0,
                left: 0,
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
            // Visibility(
            //   visible: isCompleted,
            //   child: Center(
            //     child: Center(
            //       child: SizedBox(
            //         width: 250,
            //         child: Lottie.asset(
            //           "assets/lottie/taskChecked.json",
            //           repeat: false,
            //           controller: _controller,
            //         ),
            //       ),
            //     ),
            //   ),
            // )
          ],
        ),
      ),
    );
  }
}
