import 'package:flutter/material.dart';
//import 'package:FillMe/pages/home_sidebar.dart';
import 'pages/welcome.dart';
void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
     home: WelcomePage(),
    );
  }
}

