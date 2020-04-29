import 'package:fillme/splashScreen.dart';
import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter',
      theme: ThemeData(
        appBarTheme: AppBarTheme(
          color:Color.fromRGBO(0, 214, 227, 1),
         )
      ),
      debugShowCheckedModeBanner: false,
      home: SplashScreen(),
    );
  }
}