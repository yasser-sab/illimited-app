import 'package:flutter/material.dart';
import 'package:illimited_app/constant/const.dart';
import 'package:illimited_app/widget/primary_button.dart';
import 'package:lottie/lottie.dart'; // Import your AppProvider
import 'package:just_audio/just_audio.dart';

class LevelUnlockedDialog extends StatefulWidget {
  final int number;
  final bool isDay;
  const LevelUnlockedDialog({
    super.key,
    required this.number, this.isDay = false,
  });

  @override
  State<LevelUnlockedDialog> createState() => _LevelUnlockedDialogState();
}

class _LevelUnlockedDialogState extends State<LevelUnlockedDialog> {
  final soundPlayer = AudioPlayer();

  @override
  void initState() {
    super.initState();
    soundPlayer.setAsset(widget.isDay ? 'assets/sounds/levelUnlocked2.mp3'
        :'assets/sounds/levelUnlocked.mp3');
    soundPlayer.play();
  }

  @override
  void dispose() {
    soundPlayer.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    Widget okButton = PrimaryButton(
      text: "Ok",
      isBold: true,
      onPressed: () {
        Navigator.of(context).pop();
      },
      width: MediaQuery.of(context).size.width * 0.30,
    );

    return Stack(
      alignment: Alignment.center,
      children: [
        AlertDialog(
          actionsOverflowButtonSpacing: 20,
          backgroundColor: Color.fromARGB(255, 213, 236, 255),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(widget.isDay ? "DAY ${widget.number}":
                "WEEK ${widget.number}",
                style: getFontStyle(context).copyWith(
                  fontSize: 26,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
                textAlign: TextAlign.center,
              ),
              Lottie.asset(
                "assets/lottie/levelUpStar.json",
                height: 200,
                repeat: false,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "UNLOCKED",
                    style: getFontStyle(context).copyWith(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(bottom: 10),
                    child: Image.asset(
                      "assets/icon/openedLock.png",
                      width: 33,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 2),
            ],
          ),
          actions: [okButton],
          actionsAlignment: MainAxisAlignment.center,
        ),
        Lottie.asset(
          "assets/lottie/levelUpBrilliant.json",
          // height: 400,
        ),
      ],
    );
  }
}
