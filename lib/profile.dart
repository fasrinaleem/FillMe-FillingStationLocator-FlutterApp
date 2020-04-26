import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import 'navigation/navigation_bloc.dart';

class ProfilePage extends StatelessWidget with NavigationStates {
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Profile(),
    );
  }
}

class Profile extends StatefulWidget {
  _ProfileState createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  FirebaseUser currentUser;

  String _name;
  String _uid;
  String _email;

  @override
  initState() {
    this.getCurrentUser();
    super.initState();
  }

  void getCurrentUser() async {
    currentUser = await FirebaseAuth.instance.currentUser();
    // data = Firestore.instance
    //     .collection("users")
    //     .document(currentUser.uid)
    //     .snapshots();
    //     bil
    //     //  builder(BuildContext context,
    //     //           AsyncSnapshot<QuerySnapshot> snapshot)
    // _name = currentUser.displayName;
    // _uid = currentUser.uid;
    // _email = currentUser.email;
    // print(_name);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Profile"),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            FutureBuilder(
              future: FirebaseAuth.instance.currentUser(),
              builder: (BuildContext context, AsyncSnapshot user) {
                if (user.connectionState == ConnectionState.waiting) {
                  return Container();
                } else {
                  return Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      SizedBox(
                        height: 60,
                      ),
                      Text(
                        "Welcome ",
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 20,
                        ),
                      ),
                      Text(
                        user.data.displayName.toString() + "!",
                        style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                          fontStyle: FontStyle.italic,
                          fontSize: 20,
                        ),
                      )
                    ],
               
                  );
                 //  Row(
                  //    mainAxisAlignment: MainAxisAlignment.center,
                  //  children: <Widget>[

                  //                    SizedBox(
                  //       height: 60,
                  //     ),
                  //     Text(
                  //       "123 ",
                  //       style: TextStyle(
                  //         color: Colors.black,
                  //         fontSize: 20,
                  //       ),
                  //     ),
                  //  ],
                  // );
                }
              },
            ),
          ],
          mainAxisAlignment: MainAxisAlignment.start,
        ),
      ),
    );
  }
}
