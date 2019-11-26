import 'package:flutter/material.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class YoutubeEmbedding extends StatefulWidget{

  YoutubeEmbeddingState createState()=> YoutubeEmbeddingState();
}

class YoutubeEmbeddingState extends State<YoutubeEmbedding>{
  //YoutubePlayerController _controller;
  YoutubePlayerController _controller;

  @override
  void initState(){
    _controller = YoutubePlayerController(
      initialVideoId: 'iH8KePJS5DY',
      flags: YoutubePlayerFlags(
        mute: false,
        autoPlay: true,
        forceHideAnnotation: true,
      ),
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context){
    return YoutubePlayer(
      controller: _controller,
      showVideoProgressIndicator: true,

      onReady: () {
        print('Player is ready.');
      },
    );
  }

}