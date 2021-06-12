import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class HealthCard extends StatelessWidget {

  final String apiUrl = "http://192.168.0.26:8090/health";

  Future<List<dynamic>> fetchHealthEvents() async {

    var result = await http.get(Uri.parse(apiUrl));
    return json.decode(result.body)['health'];

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
            future: fetchHealthEvents(),
            builder: (BuildContext context, AsyncSnapshot snapshot) {
              if(snapshot.hasData){
                return ListView(
                  shrinkWrap: true,
                  children: <Widget>[
                    Center(
                      child: Text('HEALTH', style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold, fontSize: 22.0,)),
                    ),
                    Center(
                      child: Text('${snapshot.data[0]}', style: TextStyle(color: Colors.amber, fontWeight: FontWeight.bold, fontSize: 26.0,)),
                    ),
                  ]
              );
              } else {
              return CircularProgressIndicator();
            }}
          ),
        ),
      ),
    );
  }
}