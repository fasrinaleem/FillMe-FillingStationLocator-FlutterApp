import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import 'navigation/navigation_bloc.dart';

class FeedbackPage extends StatelessWidget with NavigationStates {
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Feedback(),
    );
  }
}

class Feedback extends StatefulWidget {
  _FeedbackState createState() => _FeedbackState();
}

class _FeedbackState extends State<Feedback> {
  final TextEditingController _addFeedBackContrl = new TextEditingController();
  final firestore = Firestore.instance;

  String _uid = "";
  String _message = "";
  String count = "0";
  String feedback = "";

// 1st get the logged user id
  @override
  initState() {
    this.getCurrentUser();
    super.initState();
  }

  void getCurrentUser() async {
    //current user
    FirebaseUser currentUser = await FirebaseAuth.instance.currentUser();
    _uid = currentUser.uid;
    // get the count of feedback count for user
    // try {
    //   count = Firestore.instance
    //       .collection('feedbacks')
    //       .where('uid', isEqualTo: _uid)
    //       .snapshots()
    //       .length
    //       .toString();

    //   print("document count" + count);
    //   print(_uid);
    // } catch (e) {
    //   print("error " + e.code);
    // }
  }

//submit newly added feedback
  void _submitFeedback() async {
    feedback = _addFeedBackContrl.text;

// check the input is empty or null
    if (feedback == null || feedback == "") {
      _message = "Please fill and submit";
      showAlertDialog();
    } else {
      try {
        // send json data to firestore
        Firestore.instance
            .collection('feedbacks')
            .document()
            .setData({'uid': _uid, 'feedback': feedback}).then((onValue) {
          _addFeedBackContrl.text = "";
          _message = "Successfully Added";

          showAlertDialog();
        });
      } catch (e) {
        _message = e.code;
        showAlertDialog();
      }
    }
  }

// feedback update function
  void _updateFeedback(DocumentSnapshot doc) async {
    feedback = _addFeedBackContrl.text;
    //check feedback
    if (feedback == "" || feedback == null) {
      _message = "Please add the updated feedback";
      showAlertDialog();
    } else {
      try {
        //update the document feedback field
        await firestore
            .collection('feedbacks')
            .document(doc.documentID)
            .updateData({'feedback': feedback});
        _addFeedBackContrl.text = "";
        _message = "Updated successfully";
        showAlertDialog();
      } catch (e) {
        _message = e.code;
        showAlertDialog();
      }
    }
  }

  /// ****update data dialog box input *******/
  ///
// use the DocumentSnapshot and get the selected document field data
// display the entered feedback hint text
// editing controller use the update the view field & get the data into database
  void updateData(DocumentSnapshot doc) async {
    await showDialog<String>(
        builder: (context) {
          return AlertDialog(
            content: Row(
              children: <Widget>[
                Expanded(
                  child: TextFormField(
                    controller: _addFeedBackContrl,
                    autofocus: true,
                    decoration: InputDecoration(
                      hintText: feedback,
                      hintStyle: TextStyle(color: Colors.grey),
                    ),
                  ),
                ),
              ],
            ),
            // dialog box has two buttons
            actions: <Widget>[
              FlatButton(
                  child: Text("Cancel"),
                  onPressed: () {
                    Navigator.of(context, rootNavigator: true).pop();
                  }),
              // after press save botton pass the document instance id and firestore field update
              FlatButton(
                child: Text("Save"),
                onPressed: () {
                  _updateFeedback(doc);
                },
              ),
            ],
          );
        },
        context: context);
  }

  /// *************** document delete function ************************
  ///
  void deleteData(DocumentSnapshot doc) async {
    try {
      await firestore.collection('feedbacks').document(doc.documentID).delete();
      _addFeedBackContrl.text = "";
      _message = "Feedback Delete Successfully";
       showAlertDialog();
    } catch (e) {
      _message = e.code;
      showAlertDialog();
    }
  }

  ///************* using cards display inserted feedback ***********/
  Card buildFeedback(DocumentSnapshot doc) {
    // assiging the selected document feedback field data
    feedback = doc.data['feedback'];
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            //display feedback
            Text(
              '${doc.data['feedback']}',
              style: TextStyle(fontSize: 24),
            ),
            SizedBox(height: 12),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: <Widget>[
                // update button
                FlatButton(
                    child:
                        Text('Update', style: TextStyle(color: Colors.white)),
                    color: Colors.green,
                    onPressed: () {
                      updateData(doc);
                    }),
                SizedBox(width: 8),
                //delete button
                FlatButton(
                  onPressed: () => deleteData(doc),
                  child: Text('Delete'),
                  color: Colors.red,
                ),
              ],
            )
          ],
        ),
      ),
    );
  }

  // //display fields function
  // Widget displayFeedBacks() {
  //   // if count is 0 ; user can add the new feedback
  //   //if (count == '0') {
  //     return ListView(
  //         child: Padding(
  //             padding: const EdgeInsets.all(8.0),
  //                     Row(
  //           mainAxisAlignment: MainAxisAlignment.spaceEvenly,
  //               crossAxisAlignment: CrossAxisAlignment.center,
  //               children: <Widget>[
  //                 SizedBox(
  //                   height: 20,
  //                 ),
  //                 TextFormField(
  //                   decoration: InputDecoration(
  //                     hintText: "Add Feedback...",
  //                     hintStyle: TextStyle(color: Colors.grey),
  //                   ),
  //                   style: TextStyle(fontSize: 12, color: Colors.black),
  //                   cursorColor: Colors.black,
  //                   controller: _addFeedBackContrl,
  //                 ),
  //                 SizedBox(
  //                   height: 10,
  //                 ),
  //                 FlatButton(
  //                   child: Text(
  //                     "Submit",
  //                     style: TextStyle(color: Colors.white),
  //                   ),
  //                   color: Colors.green,
  //                   onPressed: _submitFeedback,
  //                 ),
  //                 SizedBox(
  //                   height: 100,
  //                 ),
  //               ],
  //             ),
  //  // } else {
  //     //get the logged user entered feedback
  //      StreamBuilder<QuerySnapshot>(
  //         stream: firestore
  //             .collection('feedbacks')
  //             .where('uid', isEqualTo: _uid)
  //             .snapshots(),
  //         builder: (context, snapshot) {
  //           if (snapshot.hasData) {
  //             return Column(
  //                 children: snapshot.data.documents
  //                     .map((doc) => buildFeedback(doc))
  //                     .toList());
  //           } else {
  //             return SizedBox();
  //           }
  //         }),

  //         ),
  //     )
  // //  }
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Feedback"),
          centerTitle: true,
        ),
        body: SingleChildScrollView(
            child: Container(
          height: MediaQuery.of(context).size.height,
          child: Stack(
            children: <Widget>[
              Container(
                padding: EdgeInsets.symmetric(horizontal: 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    SizedBox(
                      height: 12,
                    ),
                    TextFormField(
                      decoration: InputDecoration(
                        hintText: "Add Feedback...",
                        hintStyle: TextStyle(color: Colors.grey),
                      ),
                      style: TextStyle(fontSize: 12, color: Colors.black),
                      cursorColor: Colors.black,
                      controller: _addFeedBackContrl,
                    ),
                    SizedBox(
                      height: 12,
                    ),
                    FlatButton(
                      child: Text(
                        "Submit",
                        style: TextStyle(color: Colors.white),
                      ),
                      color: Colors.green,
                      onPressed: _submitFeedback,
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    Container(
                      padding: EdgeInsets.symmetric(vertical: 10),
                      alignment: Alignment.centerRight,
                    ),
                    Expanded(
                      flex: 0,
                      child: SizedBox(),
                    ),

                    //get the logged user entered feedback
                    StreamBuilder<QuerySnapshot>(
                        stream: firestore
                            .collection('feedbacks')
                            .where('uid', isEqualTo: _uid)
                            .snapshots(),
                        builder: (context, snapshot) {
                          if (snapshot.hasData) {
                            return Column(
                                children: snapshot.data.documents
                                    .map((doc) => buildFeedback(doc))
                                    .toList());
                          } else {
                            return SizedBox();
                          }
                        }),
                  ],
                ),
              ),
            ],
          ),
        )));
  }

  ///***** Message display dialog box */
  showAlertDialog() {
    Widget okButton = FlatButton(
      child: Text("OK"),
      onPressed: () {
        Navigator.of(context, rootNavigator: true).pop();
      },
    );

    AlertDialog alert = AlertDialog(
      title: Text('Message'),
      content: Text(_message),
      actions: <Widget>[
        okButton,
      ],
    );
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return alert;
      },
    );
  }
}
