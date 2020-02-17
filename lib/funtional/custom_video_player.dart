import 'dart:io';

import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

class VideoPlayerScreen extends StatefulWidget {
  String videoUrl;
  int isFrom = 1;

  VideoPlayerScreen.custom(this.videoUrl, this.isFrom);

  VideoPlayerScreen({Key key}) : super(key: key);

  @override
  _VideoPlayerScreenState createState() =>
      _VideoPlayerScreenState(videoUrl, isFrom);
}

class _VideoPlayerScreenState extends State<VideoPlayerScreen> {
  String videoUrl;
  int isFrom;

  _VideoPlayerScreenState(this.videoUrl, this.isFrom);

  VideoPlayerController _controller;
  Future<void> _initializeVideoPlayerFuture;

  @override
  void initState() {
    // Create and store the VideoPlayerController. The VideoPlayerController
    // offers several different constructors to play videos from assets, files,
    // or the internet.
    if (isFrom == VideoPlayerScreenInfo.from_internet) {
      _controller = VideoPlayerController.network(videoUrl);
    } else if (isFrom == VideoPlayerScreenInfo.from_local_storage) {
      _controller = VideoPlayerController.file(File(videoUrl));
    } else {
      _controller = VideoPlayerController.asset(videoUrl);
    }

    // Initialize the controller and store the Future for later use.
    _initializeVideoPlayerFuture = _controller.initialize();

    // Use the controller to loop the video.
    _controller.setLooping(true);

    super.initState();
  }

  @override
  void dispose() {
    // Ensure disposing of the VideoPlayerController to free up resources.
    _controller.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      // Use a FutureBuilder to display a loading spinner while waiting for the
      // VideoPlayerController to finish initializing.
      body: Stack(
        children: <Widget>[
          Container(
            alignment: Alignment.center,
            child: FutureBuilder(
              future: _initializeVideoPlayerFuture,
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.done) {
                  // If the VideoPlayerController has finished initialization, use
                  // the data it provides to limit the aspect ratio of the video.
                  return AspectRatio(
                    aspectRatio: _controller.value.aspectRatio,
                    // Use the VideoPlayer widget to display the video.
                    child: VideoPlayer(_controller),
                  );
                } else {
                  // If the VideoPlayerController is still initializing, show a
                  // loading spinner.
                  return Center(child: CircularProgressIndicator());
                }
              },
            ),
          ),
          Center(
            child: Container(
              child: IconButton(
                onPressed: () {
                  // Wrap the play or pause in a call to `setState`. This ensures the
                  // correct icon is shown.
                  setState(() {
                    // If the video is playing, pause it.
                    if (_controller.value.isPlaying) {
                      _controller.pause();
                    } else {
                      // If the video is paused, play it.
                      _controller.play();
                    }
                  });
                },
                // Display the correct icon depending on the state of the player.
                icon: Icon(
                  _controller.value.isPlaying ? Icons.pause : Icons.play_arrow,
                  color: _controller.value.isPlaying
                      ? Colors.transparent
                      : Colors.white,
                ),
              ),
            ),
          ),
        ],
      ),
      /*floatingActionButton: FloatingActionButton(
        onPressed: () {
          // Wrap the play or pause in a call to `setState`. This ensures the
          // correct icon is shown.
          setState(() {
            // If the video is playing, pause it.
            if (_controller.value.isPlaying) {
              _controller.pause();
            } else {
              // If the video is paused, play it.
              _controller.play();
            }
          });
        },
        // Display the correct icon depending on the state of the player.
        child: Icon(
          _controller.value.isPlaying ? Icons.pause : Icons.play_arrow,
        ),
      ),*/ // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}

class VideoPlayerScreenInfo {
  static const int from_assets_folder = 1;
  static const int from_local_storage = 2;
  static const int from_internet = 3;
}
