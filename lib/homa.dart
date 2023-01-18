import 'package:flutter/material.dart';

import 'global.dart';

class homa extends StatefulWidget {
  const homa({Key? key}) : super(key: key);

  @override
  State<homa> createState() => _homaState();
}

class _homaState extends State<homa> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Video Player"),
        centerTitle: true,
      ),
      body: ListView(
        children: Global.video
            .map((e) => GestureDetector(
                  onTap: () {
                    setState(() {
                      Navigator.of(context).pushNamed('1');
                      Global.url = e['src'];
                    });
                  },
                  child: ListTile(
                    leading: Image.network(
                      '${e['images']}',
                      height: 70,
                      width: 70,
                    ),
                    title: Text('${e['name']}'),
                    subtitle: Text('${e['desc']}'),
                  ),
                ))
            .toList(),
      ),
    );
  }
}
