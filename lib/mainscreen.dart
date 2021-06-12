import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'maincolumn.dart';
import 'cameras/pc1view.dart';

class MainScreen extends StatelessWidget {

  Future<void> stopMov(stopURL) async {
    
    var resultStop = await http.get(Uri.parse(stopURL));
    return json.decode(resultStop.body);

  }

  Future<void> nextMov(nextURL) async {
    
    var resultNext = await http.get(Uri.parse(nextURL));
    return json.decode(resultNext.body);

  }

  Future<void> previousMov(previousURL) async {
    
    var resultPrevious = await http.get(Uri.parse(previousURL));
    return json.decode(resultPrevious.body);

  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          title: Text("SecCams"),
          backgroundColor: Colors.purple[900],
          bottom: TabBar(
            tabs: [
              Tab(icon: Icon(Icons.videocam)),
              Tab(icon: Icon(Icons.security)),
              Tab(icon: Icon(Icons.video_camera_front)),
            ],
          ),
        ),
        body: Container(
          decoration: BoxDecoration(
            color: Colors.purple[300],
          ),
          child: TabBarView(
            children: [
              Pc1View(),
              mainColumn,
              mainColumn,
            ],
          ),
        ),
      )
    );
  }
  void stop(apath) async{
    final stop = await stopMov(apath);
    return stop;
  }
}
