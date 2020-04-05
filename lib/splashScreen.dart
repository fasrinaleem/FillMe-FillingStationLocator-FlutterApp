import 'package:flutter/material.dart';
import 'animations/FadeAnimation.dart';

void main() => runApp(
    MaterialApp(debugShowCheckedModeBanner: false, home: SplashScreen()));

class SplashScreen extends StatefulWidget {
  _SpachScreenState createState() => _SpachScreenState();
}

class _SpachScreenState extends State<SplashScreen>
    with TickerProviderStateMixin {
  AnimationController _scaleController;
  AnimationController _scale2Controller;
  AnimationController _widthController;
  AnimationController _positionController;

  Animation<double> _scaleAnimation;
  Animation<double> _scale2Animation;
  Animation<double> _widthAnimation;
  Animation<double> _positionAnimation;

  @override
  void initState() {
    super.initState();

    _scaleController =
        AnimationController(vsync: this, duration: Duration(milliseconds: 300));

    _scaleAnimation =
        Tween<double>(begin: 1.0, end: 0.8).animate(_scaleController)
          ..addStatusListener((status) {
            //keep the button small size when it pressed --> 3
            if (status == AnimationStatus.completed) {
              _widthController.forward();
            }
          });

    _widthController =
        AnimationController(vsync: this, duration: Duration(milliseconds: 600));

    _widthAnimation =
        Tween<double>(begin: 80.0, end: 300.0).animate(_widthController);
  }

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
                        "Testing text comes here.. we can add what \n ever we wants to",
                        style: TextStyle(
                            color: Colors.white.withOpacity(.7), height: 1.4),
                      )),
                  SizedBox(
                    height: 180,
                  ),
                  FadeAnimation(
                      1.6,
                      //Refoctoring centor into wrap padding to add the animation --> 1
                      // Center(
                      AnimatedBuilder(
                          animation: _scaleController,
                          builder: (context, child) => Transform.scale(
                                scale: _scaleAnimation.value,
                                child: Center(
                                  child: AnimatedBuilder(
                                    animation: _widthController,
                                    builder: (context, child) => Container(
                                      //Change the width based on animation (width size becomes bigger from 60 to 80) --> 4
                                      // child: Container(
                                      // width: 80,
                                      width: _widthAnimation.value,
                                      height: 80,
                                      padding: EdgeInsets.all(10),
                                      decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(50),
                                          color: Color.fromRGBO(0, 214, 227, 1)
                                              .withOpacity(.4)),
                                      child: InkWell(
                                        //button is animated to forward (Button size getting smaller)  --> 2
                                        onTap: () {
                                          _scaleController.forward();
                                        },
                                        child: Stack(children: <Widget>[
                                          Positioned(
                                            left:
                                                0, //Place the circle button into left side corner when it pressed --> 5
                                            child: Container(
                                              width: 60,
                                              height: 60,
                                              decoration: BoxDecoration(
                                                  shape: BoxShape.circle,
                                                  color: Color.fromRGBO(
                                                      0, 214, 227, 1)),
                                              child: Icon(Icons.arrow_forward,
                                                  color: Colors.white),
                                            ),
                                          ),
                                        ]),
                                      ),
                                    ),
                                  ),
                                ),
                              ))),
                  //put the text to the top
                  SizedBox(
                    height: 60,
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
