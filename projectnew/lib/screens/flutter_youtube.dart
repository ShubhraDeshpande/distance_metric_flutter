import 'package:flutter/material.dart';
import 'package:flutter_youtube/flutter_youtube.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class FlutterYoutubeA extends StatefulWidget{


 FlutterYoutubeState createState()=> FlutterYoutubeState();
}

class FlutterYoutubeState extends State<FlutterYoutubeA>{
  //YoutubePlayerController _controller;
  

  @override
  void initState(){
   
    
    super.initState();
  }

  @override
  Widget build(BuildContext context){
    return Scaffold(
      body: Container(
        
         child: FlutterYoutube.playYoutubeVideoByUrl(
            apiKey: "AIzaSyARwPYIoqY7lOsKz5-RsIlNXePWpn2czZo",
            //videoUrl: "https://www.youtube.com/watch?v=2ep92qmo1YY", //manjar cha
            videoUrl: "https://www.youtube.com/watch?v=8gBXFsK57Q0",
            //autoPlay: false, //default falase
            //fullScreen: true //default false
        ),
      ),
    );


  }

}