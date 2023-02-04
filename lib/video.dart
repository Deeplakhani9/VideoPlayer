import 'package:chewie/chewie.dart';
import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

import 'global.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
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
      // allowFullScreen: false
    );
  }

  @override
  void initState() {
    loadvideo();
    // SystemChrome.setPreferredOrientations([DeviceOrientation.landscapeLeft]);
    super.initState();
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
