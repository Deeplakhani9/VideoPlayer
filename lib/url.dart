import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  if (Platform.isAndroid) {
    await AndroidInAppWebViewController.setWebContentsDebuggingEnabled(true);
  }

  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
  ));
}

class url extends StatefulWidget {
  const url({Key? key}) : super(key: key);

  @override
  State<url> createState() => _urlState();
}

class _urlState extends State<url> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Url"),
      ),
      body: InAppWebView(
        initialUrlRequest: URLRequest(
          url: Uri.parse("https://www.google.com"),
        ),
      ),
    );
  }
}
