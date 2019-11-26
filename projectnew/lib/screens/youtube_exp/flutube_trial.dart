import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutube/flutube.dart';



class FlutubeTrial extends StatefulWidget {
  @override
  FlutubeTrialState createState() => FlutubeTrialState();
}

class FlutubeTrialState extends State<FlutubeTrial> {
  final List<String> playlist = <String>[
    'https://www.youtube.com/watch?v=2ep92qmo1YY',
     //   'https://www.youtube.com/watch?v=fq4N0hgOWzU',
    'https://youtu.be/IVTjpW3W33s',
  ];
  int currentPos;
  String stateText;

  @override
  void initState() {
    currentPos = 0;
    stateText = "Video not started";
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('FluTube Test'),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            //Text('Youtube video URL: ${playlist[currentPos]}', style: TextStyle(fontSize: 16.0),),
            FluTube.playlist(
              playlist,
              autoInitialize: true,
              aspectRatio: 16 / 9,
              allowMuting: false,
              looping: true,
              deviceOrientationAfterFullscreen: [
                DeviceOrientation.portraitUp,
                DeviceOrientation.landscapeLeft,
                DeviceOrientation.landscapeRight,
              ],
              systemOverlaysAfterFullscreen: SystemUiOverlay.values,
              onVideoStart: () {
                setState(() {
                  stateText = 'Video started playing!';
                });
              },
              onVideoEnd: () {
                setState(() {
                  stateText = 'Video ended playing!';
                  if((currentPos + 1) < playlist.length)
                    currentPos++;
                });
              },
            ),
            Text(stateText),
          SizedBox( height: 200, width: 200,
            child: FluTube(
              'https://www.youtube.com/watch?v=jPBxuUjDSzg',
              aspectRatio: 4 /3,
              autoPlay: true,
              looping: true,
              onVideoStart: () {},
              onVideoEnd: () {},
            ),
          )
          ],
        ),
      ),
    );
  }
}