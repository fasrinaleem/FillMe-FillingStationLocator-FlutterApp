import 'package:FillMe/pages/home_sidebar.dart';
import 'package:flutter/material.dart';
import 'pages/welcome.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return MaterialApp(
      title: 'Flutter',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      debugShowCheckedModeBanner: false,
      home: WelcomePage(),
    );
  }
}
