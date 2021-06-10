import 'package:flutter/material.dart';

class StillCard extends StatelessWidget {





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
          child:  ListView(
                children: <Widget>[
                  Center(
                    child: Text('STILL', style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold, fontSize: 22.0,)),
                  ),
                  Center(
                    child: Text('08-08', style: TextStyle(color: Colors.amber, fontWeight: FontWeight.bold, fontSize: 26.0,)),
                  ),
                  Center(
                    child: Text('08-15', style: TextStyle(color: Colors.amber, fontWeight: FontWeight.bold, fontSize: 26.0,)),
                  ),
                ]
            ),
          ),
        ),
      
    );
  }
}