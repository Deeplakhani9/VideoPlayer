import 'package:chewie/chewie.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:video_player/video_player.dart';

import 'global.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations(
      [DeviceOrientation.landscapeLeft, DeviceOrientation.landscapeRight]);
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
      autoPlay: true,
    );
  }

  @override
  void initState() {
    loadvideo();
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
      body: Column(
        children: [
          Container(
            child: AspectRatio(
              aspectRatio: videos.value.aspectRatio,
              child: Chewie(controller: chewie),
            ),
          ),
        ],
      ),
    );
  }
}
