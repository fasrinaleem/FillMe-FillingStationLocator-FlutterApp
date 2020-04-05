import 'package:flutter/material.dart';
import 'animations/FadeAnimation.dart';

void main() => runApp(
    MaterialApp(debugShowCheckedModeBanner: false, home: SplashScreen()));

class SplashScreen extends StatefulWidget {
  _SpachScreenState createState() => _SpachScreenState();
}

class _SpachScreenState extends State<SplashScreen> {
  Widget build(BuildContext context) {
    final double width = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: Color.fromRGBO(3, 15, 10, 1),
      // backgroundColor: Color.fromRGBO(100, 122, 162, 50),
      // backgroundColor: Colors.white,
      body: Container(
        width: double.infinity,
        child: Stack(
          children: <Widget>[
            Positioned(
              top: -50,
              left: 0,
              child: FadeAnimation(
                  1,
                  Container(
                    width: width,
                    height: 400,
                    decoration: BoxDecoration(
                        image: DecorationImage(
                            image: AssetImage('assets/images/one5.png'),
                            fit: BoxFit.cover)),
                  )),
            ),
            //same image for background shadow
            Positioned(
              top: -100,
              left: 0,
              child: FadeAnimation(
                  1.3,
                  Container(
                    width: width,
                    height: 400,
                    decoration: BoxDecoration(
                        image: DecorationImage(
                            image: AssetImage('assets/images/one5.png'),
                            fit: BoxFit.cover)),
                  )),
            ),
            //same image for background shadow
            Positioned(
              top: -150,
              left: 0,
              child: FadeAnimation(
                  1.6,
                  Container(
                    width: width,
                    height: 400,
                    decoration: BoxDecoration(
                        image: DecorationImage(
                            image: AssetImage('assets/images/one5.png'),
                            fit: BoxFit.cover)),
                  )),
            ),
            Container(
              padding: EdgeInsets.all(20.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  FadeAnimation(
                      1,
                      Text("Welcome",
                          style: TextStyle(color: Colors.white, fontSize: 40))),
                  SizedBox(
                    height: 15,
                  ),
                  FadeAnimation(
                      1.3,
                      Text(
                        "Testing text comes here.. we can add what ever we wants to",
                        style: TextStyle(
                            color: Colors.white.withOpacity(.7), height: 1.4),
                      )),
                  SizedBox(
                    height: 180,
                  ),
                  FadeAnimation(
                      1.6,
                      Center(
                        child: Container(
                          width: 80,
                          height: 80,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(50),
                              color: Color.fromRGBO(0, 214, 227, 1)
                                  .withOpacity(.4)),
                        ),
                      ))
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
