import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:illimited_app/constant/const.dart';
import 'package:video_player/video_player.dart';

class VideoContainer extends StatefulWidget {
  final VideoPlayerController? videoController;
  final VoidCallback onPlayed;

  const VideoContainer(
      {super.key, required this.videoController, required this.onPlayed});

  @override
  State<VideoContainer> createState() => _VideoContainerState();
}

class _VideoContainerState extends State<VideoContainer> {
  bool _isPlaying = false;

  double videoBorderRadius = 25;

  void _playPause() {
    setState(() {
      if (widget.videoController!.value.isPlaying) {
        widget.videoController!.pause();
        _isPlaying = false;
      } else {
        widget.videoController!.play();
        widget.onPlayed();
        _isPlaying = true;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: widget.videoController!.value.isInitialized
          ? Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                decoration: BoxDecoration(
                  border: Border.all(
                      width: 10, color: Color.fromARGB(255, 197, 216, 179)),
                  borderRadius: BorderRadius.all(
                    Radius.circular(videoBorderRadius + 10),
                  ),
                ),
                child: ClipRRect(
                  borderRadius: BorderRadius.all(
                    Radius.circular(videoBorderRadius),
                  ),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      AspectRatio(
                        aspectRatio: widget.videoController!.value.aspectRatio,
                        child: VideoPlayer(widget.videoController!),
                      ),
                      // const SizedBox(height: 10),
                      Container(
                        width: double.infinity,
                        decoration: BoxDecoration(color: Color.fromARGB(255, 197, 216, 179)),
                        child: IconButton(
                          icon: Icon(
                            _isPlaying ? Icons.pause : Icons.play_arrow,
                            size: 50,
                            color: Colors.black,
                          ),
                          onPressed: _playPause,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            )
          : Container(),
    );
  }
}
