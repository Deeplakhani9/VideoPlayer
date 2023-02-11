import 'package:chewie/chewie.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:video_player/video_player.dart';

import 'global.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations(
      [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]);
}

class deep extends StatefulWidget {
  const deep({Key? key}) : super(key: key);

  @override
  State<deep> createState() => _deepState();
}

class _deepState extends State<deep> {
  late VideoPlayerController videos;
  late ChewieController chewie;

  loadvideo() async {
    videos = VideoPlayerController.asset("${Global.url}");
    await videos.initialize();

    setState(() {});
    chewie = ChewieController(
      videoPlayerController: videos,
      fullScreenByDefault: true,
      autoPlay: true,
      allowFullScreen: true,
      looping: true,
    );
  }

  @override
  void initState() {
    loadvideo();
    super.initState();
    SystemChrome.setPreferredOrientations(
        [DeviceOrientation.portraitDown, DeviceOrientation.portraitUp]);
  }

  @override
  void dispose() {
    videos.dispose();
    chewie.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: RotationTransition(
        turns: AlwaysStoppedAnimation(0 / 360),
        child: Container(
          child: AspectRatio(
              aspectRatio: videos.value.aspectRatio,
              child: Chewie(controller: chewie)),
        ),
      ),
    );
  }
}
