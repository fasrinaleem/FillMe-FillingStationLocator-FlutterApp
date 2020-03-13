import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  Widget build(BuildContext context) {
    return new MainText();
  }
}

class MainText extends StatelessWidget {
  Widget build(BuildContext context) {
    return new Center(
        child: new Text("Welcome to FillMe",
            textDirection: TextDirection.ltr,
            style: new TextStyle(fontSize: 48.0, fontWeight: FontWeight.bold)));
  }
}
