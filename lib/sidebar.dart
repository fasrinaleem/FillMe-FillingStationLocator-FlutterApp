import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rxdart/rxdart.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import 'login.dart';
import 'navigation/navigation_bloc.dart';
import 'menu.dart';

class SideBar extends StatefulWidget {
  @override
  _SideBarState createState() => _SideBarState();
}

class _SideBarState extends State<SideBar>
    with SingleTickerProviderStateMixin<SideBar> {
  AnimationController _animationController;
  StreamController<bool> isSidebarOpenedStreamController;
  Stream<bool> isSidebarOpenedStream;
  StreamSink<bool> isSidebarOpenedSink;

  final _animationDuration = const Duration(milliseconds: 500);
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
  FirebaseUser currentUser;

  String _uid = "";
  String _name = "";

  ///***set the initState **
  /// using AnimationController is check the side bar is open or not
  /// get logged person name & id in firestore
  @override
  void initState() {
    super.initState();
    _animationController =
        AnimationController(vsync: this, duration: _animationDuration);
    isSidebarOpenedStreamController = PublishSubject<bool>();
    isSidebarOpenedStream = isSidebarOpenedStreamController.stream;
    isSidebarOpenedSink = isSidebarOpenedStreamController.sink;
    this.getCurrentUser();
  }

// get the logged user id & name
  Future getCurrentUser() async {
    currentUser = await _firebaseAuth.currentUser();
    _uid = currentUser.uid;

    Firestore.instance
        .collection('users')
        .where('uid', isEqualTo: _uid)
        .snapshots()
        .listen((data) =>
            data.documents.forEach((doc) => _name = doc["displayName"]));
  }

//sidebar stream, sink animation controllers
  @override
  void dispose() {
    _animationController.dispose();
    isSidebarOpenedStreamController.close();
    isSidebarOpenedSink.close();
    super.dispose();
  }

// navigation icon
  void onIconPressed() {
    final animationStatus = _animationController.status;
    final isAnimationCompleted = animationStatus == AnimationStatus.completed;

    if (isAnimationCompleted) {
      isSidebarOpenedSink.add(false);
      _animationController.reverse();
    } else {
      isSidebarOpenedSink.add(true);
      _animationController.forward();
    }
  }

//sidebar contents
  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    var assetImage = new AssetImage('assets/images/app_logo.png');
    var image = new Image(image: assetImage);

    return StreamBuilder<bool>(
      initialData: false,
      stream: isSidebarOpenedStream,
      builder: (context, isSideBarOpenedAsync) {
        return AnimatedPositioned(
          duration: _animationDuration,
          top: 0,
          bottom: 0,
          // side bar screen size adjustments
          left: isSideBarOpenedAsync.data ? 0 : -screenWidth,
          right: isSideBarOpenedAsync.data ? 0 : screenWidth - 35,
          child: Row(
            children: <Widget>[
              Expanded(
                child: Container(
                  padding: const EdgeInsets.symmetric(horizontal: 1),
                  color: Color.fromRGBO(3,15,10,1),
                  child: Column(
                    children: <Widget>[
                      SizedBox(
                        height: 70,
                      ),
                      ListTile(
                        title: Text(
                          "FillMe",
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 30,
                              fontWeight: FontWeight.w800),
                        ),
                        subtitle: Text(
                          _name,
                          style: TextStyle(
                            color: Color(0xFF262AAA),
                            fontSize: 16,
                            fontStyle: FontStyle.italic,
                          ),
                        ),
                        leading: CircleAvatar(
                          child: (image),
                          radius: 40,
                        ),
                      ),
                      Divider(
                        height: 40,
                        thickness: 0.5,
                        color: Colors.white.withOpacity(0.3),
                        indent: 32,
                        endIndent: 32,
                      ),
                      // use the menu.dart GestureDetector for menulist
                      MenuList(
                        icon: Icons.local_gas_station,
                        title: "Map",
                        onTap: () {
                          onIconPressed();
                          //bloc provider navigation event -> link to navigation_bloc.dart
                          // link the relavent pages
                          BlocProvider.of<NavigationBloc>(context)
                              .add(NavigationEvents.DisplayMapEvent);
                        },
                      ),
                      MenuList(
                        icon: Icons.assignment,
                        title: "Feedback",
                        onTap: () {
                          onIconPressed();
                          BlocProvider.of<NavigationBloc>(context)
                              .add(NavigationEvents.FeedbackEvent);
                        },
                      ),
                      MenuList(
                        icon: Icons.lock_outline,
                        title: "Log Out",
                        onTap: () {
                          _firebaseAuth.signOut().then((onValue) {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (BuildContext context) =>
                                      LoginPage(),
                                ));
                          });
                        },
                      ),
                      Divider(
                        height: 40,
                        thickness: 0.5,
                        color: Colors.white.withOpacity(0),
                        indent: 30,
                        endIndent: 32,
                      ),
                    ],
                  ),
                ),
              ),
              Align(
                alignment: Alignment(1, -0.9),
                child: GestureDetector(
                  onTap: () {
                    onIconPressed();
                  },
                  //Sidebar indicator
                  child: ClipPath(
                    child: Container(
                      width: 37,
                      height: 56,
                      color: Colors.transparent,
                      alignment: Alignment.centerLeft,
                      // animated menu icon
                      child: AnimatedIcon(
                        progress: _animationController.view,
                        icon: AnimatedIcons.menu_close,
                        color: Color(0xFF262AAA),
                        size: 40,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}

// menu clipper paths -> use the ClipPath
class CustomMenuClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    Paint paint = Paint();
    paint.color = Colors.white;

    Path path = Path();
    path.moveTo(0, 0);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) {
    return true;
  }
}
