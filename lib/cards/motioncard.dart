import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class MotionCard extends StatelessWidget {

  final String apiUrl = "http://192.168.0.26:8090/pc_last_moving";

  Future<List<dynamic>> fetchPc1TodaysEvents() async {
    var result = await http.get(Uri.parse(apiUrl));
    print(json.decode(result.body)['pc_last_moving']);
    return json.decode(result.body)['pc_last_moving'];
  }



  @override
  Widget build(BuildContext context) {
    return Card(
      borderOnForeground: true,
      color: Colors.purple[600],
      child: InkWell(
        splashColor: Colors.lightGreen[400] ,
        onTap: () {
          print('Card tapped.');
        },
        child: SizedBox(
          width: 275,
          height: 100,
          child: FutureBuilder<List<dynamic>>(
            future: fetchPc1TodaysEvents(),
            builder: (BuildContext context, AsyncSnapshot snapshot) {
              print(snapshot.data);
              if(snapshot.hasData){
                print(snapshot.data);
                // print(snapshot.data[1]['Time']);
                return ListView(
                children: <Widget>[
                  
                  Center(
                    child: Text('MOTION', style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold, fontSize: 22.0,)),
                  ),
                  Center(
                    child: Text('${snapshot.data[0]}', style: TextStyle(color: Colors.amber, fontWeight: FontWeight.bold, fontSize: 26.0,)),
                  ),
                  Center(
                    child: Text('${snapshot.data[1]}', style: TextStyle(color: Colors.amber, fontWeight: FontWeight.bold, fontSize: 26.0,)),
                    ),
                  ]
                );
              } else {
              return CircularProgressIndicator();
            }
            }
            ),
          ),
        ),
    );
  }
}