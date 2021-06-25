import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class Pc2LastStillCard extends StatelessWidget {

  final String apiUrl = "http://192.168.0.26:8090/pc2_last_still";

  Future<List<dynamic>> fetchPc2TodaysEvents() async {
    var result = await http.get(Uri.parse(apiUrl));
    print(json.decode(result.body)['pc2_last_still']);
    return json.decode(result.body)['pc2_last_still'];
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
          width: 250,
          height: 100,
          child: FutureBuilder<List<dynamic>>(
            future: fetchPc2TodaysEvents(),
            builder: (BuildContext context, AsyncSnapshot snapshot) {
              print(snapshot.data);
              if(snapshot.hasData){
                print(snapshot.data);
                // print(snapshot.data[1]['Time']);
                return ListView(
                  children: <Widget>[
                    Center(
                      child: Text('PC2 STILL', style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold, fontSize: 22.0,)),
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
              return SizedBox(
                width: 50,
                height: 50,
                child: CircularProgressIndicator(),
              );
            }
            }
            ),
          ),
        ),
    );
  }
}