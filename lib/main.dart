import 'package:flutter/material.dart';
import 'package:v/url.dart';
import 'package:v/video.dart';

import 'csp.dart';
import 'homa.dart';

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    routes: {
      '/': (context) => video(),
      '2': (context) => homa(),
      '1': (context) => deep(),
      '3': (context) => csp(),
      '4': (context) => url(),
    },
  ));
}

class video extends StatefulWidget {
  const video({Key? key}) : super(key: key);

  @override
  State<video> createState() => _videoState();
}

class _videoState extends State<video> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Home page"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
                onPressed: () {
                  setState(() {
                    Navigator.of(context).pushNamed('2');
                  });
                },
                child: Text("Go to Video Player")),
            // ElevatedButton(
            //     onPressed: () {
            //       Navigator.of(context).pushNamed("3");
            //     },
            //     child: Text("Go to carousel slider page")),
            // ElevatedButton(
            //     onPressed: () {
            //       Navigator.of(context).pushNamed("4");
            //     },
            //     child: Text("Go to URL")),
          ],
        ),
      ),
    );
  }
}
