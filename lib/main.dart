import 'package:flutter/material.dart';
import 'package:gplayer/gplayer.dart';
import 'package:screen/screen.dart';


void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  GPlayer player;

  @override
  void initState() {
    super.initState();
    //1.create & init player
    Screen.keepOn(true);


    player = GPlayer(uri: 'rtmp://124.41.243.254:1935/live/osn')
      ..init()
      ..addListener((_) {
        //update control button out of player
        setState(() {});
      });
    setState(() {
      player.start();
    });
  }

  @override
  void dispose() {
    player?.dispose(); //2.release player
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: player.display,

    );
  }
}
