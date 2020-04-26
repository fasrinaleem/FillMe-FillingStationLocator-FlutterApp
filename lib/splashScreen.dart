import 'package:flutter/material.dart';
import 'animations/FadeAnimation.dart';
import 'package:page_transition/page_transition.dart';
import 'package:fillme/login.dart';

// void main() => runApp(
//     MaterialApp(debugShowCheckedModeBanner: false, home: SplashScreen()));

class SplashScreen extends StatefulWidget {
  _SpachScreenState createState() => _SpachScreenState();
}

//FadeAnimation.dart class is used just only for fading from top to down
//In Here Same image 3 times appear and text contents

//There are 5 animations which are listed below,
//1. Content coming from top to down (FadeAnimation.dart)
//2. Icon button become small when we press it
//3. Icon button goes to the left
//4. Icon button goest to left to right
//5. Hide the arrow icon after 4 (come to right)

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

//Hide the arrow icon after pressing the button -->11
  bool hideIcon = false;

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

// addd a listener to anim --> 7
// Circle button will go to right side corner from left side when button is pressed
    _widthAnimation =
        Tween<double>(begin: 80.0, end: 300.0).animate(_widthController)
          ..addStatusListener((status) {
            if (status == AnimationStatus.completed) {
              _positionController.forward();
            }
          });

//set another controller and animation --> 6
    _positionController = AnimationController(
        vsync: this, duration: Duration(milliseconds: 1000));

    _positionAnimation =
        Tween<double>(begin: 0.0, end: 215.0).animate(_positionController)
          ..addStatusListener((status) {
            if (status == AnimationStatus.completed) {
              setState(() {
                //hide the icon after second anim (btn goes left to right)
                hideIcon = true;
              });
              //add a scale2 controller listner --> 9
              _scale2Controller.forward();
            }
          });
// --> 8
    _scale2Controller = AnimationController(
        vsync: this, duration: Duration(milliseconds: 1000));

    _scale2Animation =
        Tween<double>(begin: 1.0, end: 32.0).animate(_scale2Controller)
          ..addStatusListener((status) {
            if (status == AnimationStatus.completed) {
              //Hiding the blank splash screeen and navigate to the Second screen
              //Get the use of page_transition dependency --> 12
              //Import the page transition package at top

              Navigator.push(
                  context,
                  PageTransition(
                      type: PageTransitionType.fade, child: LoginPage()));
            }
          });
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
                        "The official app for the largest chain of \n filling stations in Sri Lanka",
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
                                          AnimatedBuilder(
                                            animation: _positionController,
                                            builder: (context, child) =>
                                                Positioned(
                                              left: _positionAnimation
                                                  .value, //change based on anim size ---> 7
                                              //  0, //Place the circle button into left side corner when it pressed --> 5
                                              child: AnimatedBuilder(
                                                animation: _scale2Controller,
                                                builder: (context, child) =>
                                                    Transform.scale(
                                                        //hide the icon --> 10
                                                        scale: _scale2Animation
                                                            .value,
                                                        child: Container(
                                                          width: 60,
                                                          height: 60,
                                                          decoration:
                                                              BoxDecoration(
                                                                  shape: BoxShape
                                                                      .circle,
                                                                  color: Color
                                                                      .fromRGBO(
                                                                          0,
                                                                          214,
                                                                          227,
                                                                          1)),
                                                          //hide the icon after second ani (left btn goes to right)
                                                          child: hideIcon ==
                                                                  false
                                                              ? Icon(
                                                                  Icons
                                                                      .arrow_forward,
                                                                  color: Colors
                                                                      .white)
                                                              : Container(),
                                                        )),
                                              ),
                                            ),
                                          ),
                                        ]),
                                      ),
                                    ),
                                  ),
                                ),
                              ))),
                  //put the text to the top
                  // SizedBox(
                  //   height: 60,
                  // ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
