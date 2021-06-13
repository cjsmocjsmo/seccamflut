import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class Pc2View extends StatelessWidget {

  final String lastFiftyUrl = "http://192.168.0.26:8090/pc2_last_fifty_pics";

  Future<List<dynamic>> fetchPc1View() async {
    var pc1view_results = await http.get(Uri.parse(lastFiftyUrl));
    print(json.decode(pc1view_results.body));
    return json.decode(pc1view_results.body)['plist'];

  }

  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: BoxDecoration(
          color: Colors.purple.shade400,
        ),
        child: FutureBuilder<List<dynamic>>(
          future: fetchPc1View(),
          builder: (BuildContext context, AsyncSnapshot snapshot) {
            print(snapshot);
            if(snapshot.hasData){
              print(snapshot.data);
              return GridView.builder(
                gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
                  maxCrossAxisExtent: 300,
                  childAspectRatio: 16 / 9,
                  crossAxisSpacing: 20,
                  mainAxisSpacing: 20,
                ),
                itemCount: snapshot.data.length,
                itemBuilder: (BuildContext context, index) {
                  return Container(
                    padding: const EdgeInsets.all(8),
                    child: GestureDetector(                       
                      onTap: () {
                        Navigator.push(context, MaterialPageRoute<void>(
                          builder: (BuildContext context) {
                          return Scaffold(
                            appBar: AppBar(
                              title: Text("PiCam2 View"),
                              backgroundColor: Colors.purple.shade700,
                            ),
                            body: Container(
                              decoration: BoxDecoration(
                                color: Colors.purple.shade400,
                              ),
                              child: Center(
                                child: Image.network(snapshot.data[index],
                                  fit: BoxFit.contain,
                                    // height: 400.0,
                                    width: 600.0,
                                ),
                              ),
                            ),
                          );
                        }
                      )
                    );
                        // final String ap = _movfspath(snapshot.data[index]);
                        // final String apiPU = "http://192.168.0.42:8181/OmxplayerPlayMediaReact?medPath=" + ap;
                        // print(apiPU);
                        // final String apiPlayUrl = apiPU;
                        
                        // foo(apiPlayUrl);
                        // Navigator.pop(context);
                      },
                      child: Image.network(snapshot.data[index],
                        fit: BoxFit.contain,
                          // height: 400.0,
                          width: 400.0,
                      )
                    )
                  );
              }
            );
            }else {
              return Center(child: CircularProgressIndicator());
            }
          },
        ),
      );

  }
}