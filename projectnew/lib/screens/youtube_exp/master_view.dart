import 'package:flutter/material.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:projectnew/screens/flutter_youtube.dart';
import 'dart:convert';
//import 'package:projectnew/screens/video_app_page.dart';

//flutube imports
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutube/flutube.dart';


class MasterView extends StatefulWidget {
  MasterView({Key key}) : super(key: key);

  createState() => MasterViewState();
}

class MasterViewState extends State<MasterView>{

final Map<String, String> data1 = {
  'title': 'Shubhra D',
  'description': 'Amazon SDE1'
};
 final Map<String, String> data2 = {
   'title': 'Shrivatsa D',
   'description': 'Getting there'
 };
final Map<String, bool> score = {};

  List<String> imageList = [
    "https://assets.pokemon.com/assets/cms2/img/pokedex/full/001.png",
    "https://assets.pokemon.com/assets/cms2/img/pokedex/full/004.png",
    "https://assets.pokemon.com/assets/cms2/img/pokedex/full/007.png",
    "https://assets.pokemon.com/assets/cms2/img/pokedex/full/010.png",
    "https://assets.pokemon.com/assets/cms2/img/pokedex/full/012.png",
    "https://assets.pokemon.com/assets/cms2/img/pokedex/full/014.png",
    "https://assets.pokemon.com/assets/cms2/img/pokedex/full/009.png"
  ];

 List<String> secondList =[
    "https://assets.pokemon.com/assets/cms2/img/pokedex/full/809.png",
    "https://assets.pokemon.com/assets/cms2/img/pokedex/full/807.png",
    "https://assets.pokemon.com/assets/cms2/img/pokedex/full/800.png",
    "https://assets.pokemon.com/assets/cms2/img/pokedex/full/802.png"
  ];

  List<String> thirdList =[
    "https://assets.pokemon.com/assets/cms2/img/pokedex/full/460.png",
    "https://assets.pokemon.com/assets/cms2/img/pokedex/full/306.png",
    "https://assets.pokemon.com/assets/cms2/img/pokedex/full/063.png",
    "https://assets.pokemon.com/assets/cms2/img/pokedex/full/698.png",
    "https://assets.pokemon.com/assets/cms2/img/pokedex/full/024.png",
    "https://assets.pokemon.com/assets/cms2/img/pokedex/full/681.png"

  ];
  List<String> tempp=["abv", "nihiu", "bhbi"];
  List<String> removedImages =[];
  List<Widget> dragTargetList=[];
  List<String> youtubeUrls=["https://www.youtube.com/watch?v=x2qIz5FaH34","https://www.youtube.com/watch?v=yt6_i7gQfCk" ,"https://www.youtube.com/watch?v=2ep92qmo1YY", "https://www.youtube.com/watch?v=jPBxuUjDSzg",
  "https://www.youtube.com/watch?v=S46c-vygIoA",];
  List<String> secondListY =["https://www.youtube.com/watch?v=JUgaM_IbZ0U", "https://www.youtube.com/watch?v=2T_-eMJXq4g",
  "https://www.youtube.com/watch?v=eKRFKYkn_A4","https://www.youtube.com/watch?v=uEmhcYWlSC4"];
  List<String> thirdListY = ["https://www.youtube.com/watch?v=ejs1FekF7fs", "https://www.youtube.com/watch?v=P5hH9YiGLrQ",
  "https://www.youtube.com/watch?v=_ltz0nMXvR0"];
  var labels = new Map();
  var count =0;

final databaseReference = FirebaseDatabase.instance.reference();
int seed = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: Text("Distance learning cluster"),//Text('Score ${score.length} / 6'),
          backgroundColor: Colors.pink),
      floatingActionButton: FloatingActionButton(
        focusColor: Color.fromRGBO(	208, 239, 255 , 1.0),
        foregroundColor: Colors.white70,
        backgroundColor: Color.fromRGBO(	255,157,171 , 1.0),
        child: Icon(Icons.refresh),
        onPressed: () {
          setState(() {
            imageList=imageList;
            removedImages.clear();
            dragTargetList.clear();
            labels.clear();
            score.clear();
            seed++;
          });
        },
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [

          //***code for showing the flutub demo */

          // Container(height: 310, width: MediaQuery.of(context).size.width,
          // child: new ListView.builder
          //     (
          //       itemCount: youtubeUrls.length,
          //       scrollDirection: Axis.horizontal,
          //       itemBuilder: (BuildContext ctxt, int index) {
          //       return Padding(
          //         padding: const EdgeInsets.all(4.0),
          //         child: new SizedBox( height: 300, width:300,
          //   child: FluTube(
          //     youtubeUrls[index],
          //     aspectRatio: 4 /3,
          //     autoPlay: false,
          //     looping: true,
          //     onVideoStart: () {},
          //     onVideoEnd: () {},
          //   ),
          // ),
          //       );
          //       }
          //     ),),


          Container(height: 310, width: MediaQuery.of(context).size.width, color: Color.fromRGBO(255, 241, 234, 0.9),
            child: Padding(
              padding: const EdgeInsets.only(top:20.0),
              child: new ListView.builder
                (
                  itemCount: youtubeUrls.length,
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (BuildContext ctxt, int index) {
                    return _getDraggable(youtubeUrls[index]);
                  }
              ),
            ),
          ),


          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.only(left:80.0),
                child: FloatingActionButton(
                  focusColor: Color.fromRGBO(	208, 239, 255 , 1.0),
                  foregroundColor: Colors.white70,
                  backgroundColor: Color.fromRGBO(	255,157,171, 1.0),
                  child: Icon(Icons.add),
                  onPressed: (){
                    setState(() {
                      dragTargetList.add(_getDragTarget());
                      count ++;
                    });
                  },
                ),
              ),

             Padding(
               padding: const EdgeInsets.all(8.0),
               child: Column(
                  children: <Widget>[
                    RaisedButton(
                      child: Text('Create Record'),
                      onPressed: () {
                        createRecord();
                      },
                    ),
                    RaisedButton(
                      child: Text('View Record'),
                      onPressed: () {
                        getData();
                      },
                    )
                  ],
                ),
             ),

              Padding(
                padding: const EdgeInsets.only(right: 80.0),
                child: FloatingActionButton(
                  focusColor: Color.fromRGBO(	208, 239, 255 , 1.0),
                  foregroundColor: Colors.white70,
                  backgroundColor: Color.fromRGBO(255,157,171 , 1.0),
                  child: Text("Submit"),
                  onPressed: (){
                    print(labels);
                    _showDialog(context);
                  },
                ),
              )
            ],
          ),
          Container( height: 250, width: MediaQuery.of(context).size.width,
            child: new ListView.builder
              (
                itemCount: dragTargetList.length,
                scrollDirection: Axis.horizontal,
                itemBuilder: (BuildContext ctxt, int index) {
                  return dragTargetList[index];
                }
            ),
          ),


//          Row(
//            mainAxisAlignment: MainAxisAlignment.spaceAround,
//            crossAxisAlignment: CrossAxisAlignment.start,
//            children:
//            tempp.map((y_url) => _buildDragTarget()).toList()
//              ..shuffle(Random(seed)),
//          )
        ],
      ),
    );
  }

 Widget _getDraggable(y_url){
   print("++++=======+++ the url is: "+ y_url);
    return Draggable<String>(
      data: y_url,
      //child: y_url(y_url: score[y_url] == true ? '✅' : y_url),
      child: removedImages.contains(y_url) == true ?Container(height:0, width: 0,):
      Stack(
        children: <Widget>[

          Container( height:300, width: 350,
            child:
            Padding(
                  padding: const EdgeInsets.all(4.0),
                  child: new SizedBox( height: 300, width:300,
            child: FluTube(
             y_url,
               aspectRatio: 4 /3,
             autoInitialize: true,
          
              allowMuting: false,
              looping: true,
              onVideoStart: () {},
              onVideoEnd: () {},
            ),
          ),
                ),
          ),

          Padding(
            padding: const EdgeInsets.only(left:60.0),
            child: IconButton(
              icon: Icon(Icons.clear,),alignment: Alignment.topRight,
              onPressed: (){
                setState(() {

                  removedImages.add(y_url);
                });
              },
            ),
          ),
          

        ],
      ),
      feedback: Container(height: 20, width: 20, child: Icon(Icons.favorite),),
      childWhenDragging:  Icon(Icons.pets,color: Colors.black45,),
    );
  }

  Widget _getDragTarget(){
    return _buildDragTarget();
  }
  Widget _buildDragTarget() {

    List<String> temppp= [];
    return DragTarget<String>(
      builder: (BuildContext context, List<String> incoming, List rejected) {
        print(incoming);
        labels[count] = temppp;
        print(labels);
        return Padding(
          padding: const EdgeInsets.all(2.0),
          child:
          Container(
              decoration: BoxDecoration(
                color: Color.fromRGBO(255, 208, 215,1.0 ),
                //shape: BoxShape.circle,
              ),
              child:
              Wrap(
                  children: List.generate(temppp.length, (e)=>

          Draggable<String>(
            data: temppp[e],
            child:
            Container(

              child:
              Wrap(
                children: List.generate(temppp.length, (e)=>
                    Container(height: 150, width: 150,
                      
                
                            child: FluTube(
                            temppp[e],
                              aspectRatio: 4 /3,
                              autoPlay: false,
                              
                              looping: true,
                              onVideoStart: () {},
                              onVideoEnd: () {},
                            ),
                          ),
                      
                      //child:_getCircularAvatar(droppedImages[e])
                      
                      
                      ),
              ),
              alignment: Alignment.center,
              height:250,
              width: 450,
            ),
            //child:_getCircularAvatar(droppedImages[e])

            feedback: Container(height: 20, width: 20,
              //child: Image.network(temppp[e])
              child:Icon(Icons.favorite)
              ,),
            childWhenDragging: Icon(Icons.pets,color: Colors.black45,) ,),
                  )),
              alignment: Alignment.center,
              height: 250,
              width: 450,
            ),



        );

      },
//      onWillAccept: (data){
//        return true;},
      //=> data == y_url,

      onAccept: (data) {
        setState(() {
          temppp.add(data);
          removedImages.add(data);
        });
      },
      onLeave: (data) {
        setState(() {
          temppp.remove(data);
        });
      },
    );

  }

  void _showVideoDialog() {
    // flutter defined function
    showDialog(
      context: context,
      builder: (BuildContext context) {
        // return object of type Dialog
        return AlertDialog(

          actions: <Widget>[
            // usually buttons at the bottom of the dialog
            Container(height: 350,
                width: 300,child: FlutterYoutubeA()),

          ],
        );
      },
    );
  }

 void createRecord(){
   databaseReference.child("3").set({
     'title' : data1['title'],
     'description': data1['description']
   });
   databaseReference.child("4").set({
     'title' :data2['title'],
     'description': data2['description']
   });
 }
 void getData(){
   databaseReference.once().then((DataSnapshot snapshot) {
// var parsedJson = json.decode(snapshot);
// print('${parsedJson.runtimeType} : $parsedJson');     
print('Data : ${snapshot.value}');
   //  print("++++++============+++++++++++==========="+ data[Genre]);
   });
 }
  void _showDialog(context) {
    // flutter defined function
    showDialog(
      context: context,
      builder: (BuildContext context) {
        // return object of type Dialog
        return AlertDialog(
          title: new Text("You are about to submit"),
          content: new Text("Want to see new List? "),
          actions: <Widget>[
            Row(
              children: <Widget>[
                new FlatButton(
                  child: new Text("No"),
                  onPressed: () {
                   // GetCentralView(data: data1,);
                    Navigator.of(context).pop();
                  },
                ),
                new FlatButton(
                  child: new Text("Yes"),
                  onPressed: () {
                    //GetCentralView(data: data2);
                    setState(() {
                      if(youtubeUrls==secondList){
                        youtubeUrls=thirdListY;
                      }else{
                        youtubeUrls = secondListY;}
                    });
                    Navigator.of(context).pop();


                  },
                ),
              ],
            ),

            // usually buttons at the bottom of the dialog
            new FlatButton(
              child: new Text("Close"),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

}