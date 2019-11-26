import 'package:flutter/material.dart';
import 'package:projectnew/screens/central_view.dart';
import 'package:projectnew/screens/youtube_exp/master_view.dart';
import 'package:projectnew/screens/flutter_youtube.dart';
import 'package:projectnew/screens/youtube_embedding.dart';
import 'package:projectnew/screens/youtube_exp/flutube_trial.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        
        primarySwatch: Colors.blue,
      ),
      //use FlutubeTrial() for checking on video 
      home:MasterView(),
    );
  }
}


