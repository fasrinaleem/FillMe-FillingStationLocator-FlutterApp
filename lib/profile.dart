//import 'dart:async';
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
  final firestore = Firestore.instance;

  String _name = "";
  String _uid = "";
  String _email = "";

  @override
  initState() {
    this.getCurrentUser();
    super.initState();
  }

  void getCurrentUser() async {
    currentUser = await FirebaseAuth.instance.currentUser();
    _uid = currentUser.uid;
    _email = currentUser.email;
    _name = currentUser.displayName;
    print("test name"+_name);

    // try {
    //   Firestore.instance
    //       .collection('users')
    //       .where('uid', isEqualTo: _uid)
    //       .snapshots()
    //       .listen((data) =>
    //           data.documents.forEach((doc) => _name = doc["displayName"]));

    //   print("name" + _name);
    //   print(_email);
    //   print(currentUser);
    // } catch (e) {
    //   print(e.code);
    // }
  }

  ListTile displayDetails(DocumentSnapshot doc) {
    return ListTile(
      title: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Text(
              '${doc.data['displayName']}',
              style: TextStyle(fontSize: 24),
            ),
            SizedBox(height: 12),
            Text(
              '${doc.data['email']}',
              style: TextStyle(fontSize: 14),
            ),
          ],
          mainAxisAlignment: MainAxisAlignment.end,
        ),
      ),
    );
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
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            SizedBox(
              height: 20,
            ),
            Text(
              "Welcome ",
              style: TextStyle(
                color: Colors.black,
                fontSize: 20,
              ),
            ),
            StreamBuilder<QuerySnapshot>(
                stream: firestore
                    .collection('users')
                    .where('uid', isEqualTo: _uid)
                    .snapshots(),
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    return Column(
                        children: snapshot.data.documents
                            .map((doc) => displayDetails(doc))
                            .toList());
                  } else {
                    return SizedBox();
                  }
                }),
          ],
          mainAxisAlignment: MainAxisAlignment.start,
        ),
      ),
    );
  }
}
