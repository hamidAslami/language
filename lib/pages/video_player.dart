import 'package:chewie/chewie.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:video_player/video_player.dart';

class ChewieDemo extends StatefulWidget {
  ChewieDemo({this.title = 'Chewie Demo'});

  final String title;

  @override
  State<StatefulWidget> createState() {
    return _ChewieDemoState();
  }
}

class _ChewieDemoState extends State<ChewieDemo> {
  TargetPlatform _platform;
  VideoPlayerController _videoPlayerController1;

  ChewieController _chewieController;

  @override
  void initState() {
    super.initState();
    this.initializePlayer();
  }

  @override
  void dispose() {
    _videoPlayerController1.dispose();
    _chewieController.dispose();
    super.dispose();
  }

  Future<void> initializePlayer() async {
    _videoPlayerController1 = VideoPlayerController.network(
        'https://dl.cspmelal.com/videos/motevaset/web-site.mp4');
    await _videoPlayerController1.initialize();

    _chewieController = ChewieController(
      videoPlayerController: _videoPlayerController1,
      autoPlay: true,
      looping: true,
      // fullScreenByDefault: true,
      allowFullScreen: true,
      customControls: Container(
        color: Colors.white,
        child: Row(
          children: [
            _chewieController.isPlaying ? IconButton(
                icon: Icon(Icons.pause), onPressed: () {
              _videoPlayerController1.pause();
            }) : IconButton(
                icon: Icon(Icons.play_arrow_rounded), onPressed: () {
              _videoPlayerController1.play();
            })
          ],
        ),
      ),
      deviceOrientationsAfterFullScreen: [
        DeviceOrientation.portraitDown,
        DeviceOrientation.portraitUp,
      ],

      deviceOrientationsOnEnterFullScreen: [
        DeviceOrientation.landscapeLeft,
        DeviceOrientation.landscapeRight,
      ],

      cupertinoProgressColors: ChewieProgressColors(
        playedColor: Theme
            .of(context)
            .accentColor,
        handleColor: Theme
            .of(context)
            .accentColor,
        backgroundColor: Colors.white,
        bufferedColor: Colors.grey,
      ),
      // Try playing around with some of these other options:

      // showControls: false,
      materialProgressColors: ChewieProgressColors(
        playedColor: Theme
            .of(context)
            .accentColor,
        handleColor: Theme
            .of(context)
            .accentColor,
        backgroundColor: Colors.white,
        bufferedColor: Colors.grey,
      ),
      // placeholder: Container(
      //   color: Colors.grey,
      // ),
      // autoInitialize: true,
    );
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: SystemUiOverlayStyle(statusBarColor: Colors.transparent),
      child: Scaffold(
        backgroundColor: Colors.black87,
        appBar: AppBar(
          backgroundColor: Colors.black87,
          brightness: Brightness.dark,
          leading: IconButton(
            icon: Icon(Icons.arrow_back_ios),
            onPressed: () {},
            color: Colors.white,
          ),
        ),
        body: Center(
          child: _chewieController != null &&
              _chewieController.videoPlayerController.value.initialized
              ? Chewie(
            controller: _chewieController,
          )
              : Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              CircularProgressIndicator(),
              SizedBox(height: 20),
              Text('Loading'),
            ],
          ),
        ),
      ),
    );
  }
}
