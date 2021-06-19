import 'package:flutter/material.dart';
import 'mainscreen.dart';

void main() => runApp(SecCam());

class SecCam extends StatelessWidget {
  const SecCam({Key? key}) : super(key: key);

  static const String _title = "SecCam";

  Widget build(BuildContext context) {
    return MaterialApp(title: _title, initialRoute: '/', routes: {
      '/': (context) => MainScreen(),
    });
  }
}