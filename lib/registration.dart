import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'animations/FadeAnimation.dart';
import 'package:flutter/material.dart';

import 'package:fillme/login.dart';
//import 'package:fillme/mapHome.dart';
import 'home_sidebar.dart';

class RegistrationPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _RegistrationPage();
  }
}

class _RegistrationPage extends State<RegistrationPage> {
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;

  final TextEditingController _passwordController = new TextEditingController();
  final TextEditingController _emailController = new TextEditingController();
  final TextEditingController _vPasswordController =
      new TextEditingController();
  final TextEditingController _nameController = new TextEditingController();

  String errorMessage = "";
  String _email;
  String _password;
  String _verifyPwd;
  String _errorMsg;
  String _successMsg = "";
  String _name;

  void _submitForm() async {
    if (validate()) {
      try {
        print(_email);
        print(_password);

        AuthResult result = await _firebaseAuth.createUserWithEmailAndPassword(
            email: _email, password: _password);

        UserUpdateInfo userUpdateInfo = new UserUpdateInfo();

        userUpdateInfo.displayName = _name;
        FirebaseUser user = result.user;
        String userId = user.uid;
        print("new user  =" + userId);

        user.updateProfile(userUpdateInfo).then((onValue) {
          Firestore.instance.collection('users').document().setData({
            'uid': userId,
            'email': _email,
            'displayName': _name
          }).then((onValue) {
            _errorMsg = "Successfully Register";
            _successMsg = "Successfully Register";
            showAlertDialog();
          });
        });
      } catch (e) {
        print("EError = " + e.toString());
        print("Err = " + e.toString());
        _errorMsg = e.toString();
        showAlertDialog();
      }
    } else {
      showAlertDialog();
    }
  }

  Widget _nameField() {
    return TextFormField(
      decoration: InputDecoration(
        hintText: "Name",
        hintStyle: TextStyle(color: Colors.grey),
        border: InputBorder.none,
      ),
      textAlign: TextAlign.center,
      keyboardType: TextInputType.emailAddress,
      style: TextStyle(fontSize: 16, color: Colors.black),
      controller: _nameController,
    );
  }

  Widget _emailField() {
    return TextFormField(
      decoration: InputDecoration(
        hintText: "Email",
        hintStyle: TextStyle(color: Colors.grey),
        border: InputBorder.none,
      ),
      textAlign: TextAlign.center,
      keyboardType: TextInputType.emailAddress,
      style: TextStyle(fontSize: 16, color: Colors.black),
      controller: _emailController,
      onSaved: (input) => setState(() {
        _email = input;
      }),
    );
  }

  Widget _passwordField() {
    return TextFormField(
      decoration: InputDecoration(
        hintText: "Password",
        hintStyle: TextStyle(color: Colors.grey),
        border: InputBorder.none,
      ),
      textAlign: TextAlign.center,
      style: TextStyle(fontSize: 16, color: Colors.black),
      obscureText: true,
      controller: _passwordController,
      onSaved: (input) => setState(() {
        _password = input;
      }),
    );
  }

  Widget _verifyPasswordField() {
    return TextFormField(
      decoration: InputDecoration(
        hintText: "Verify Password",
        hintStyle: TextStyle(color: Colors.grey),
        border: InputBorder.none,
      ),
      textAlign: TextAlign.center,
      style: TextStyle(fontSize: 16, color: Colors.black),
      obscureText: true,
      controller: _vPasswordController,
      onSaved: (input) => setState(() {
        _verifyPwd = input;
      }),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        decoration: BoxDecoration(
            gradient: LinearGradient(begin: Alignment.topCenter, colors: [
          Color.fromRGBO(0, 214, 227, 1),
          Colors.blue[300],
          Colors.blue[700]
        ])),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            SizedBox(
              height: 60,
            ),
            Padding(
              padding: EdgeInsets.all(20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  FadeAnimation(
                      1,
                      Text(
                        "Registration",
                        style: TextStyle(color: Colors.white, fontSize: 40),
                      )),
                  SizedBox(
                    height: 10,
                  ),
                  FadeAnimation(
                      1.3,
                      Text(
                        "Join with us",
                        style: TextStyle(color: Colors.white, fontSize: 18),
                      )),
                ],
              ),
            ),
            SizedBox(height: 20),
            Expanded(
              child: Container(
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(40),
                        topRight: Radius.circular(40))),
                child: SingleChildScrollView(
                  child: Padding(
                    padding: EdgeInsets.all(20),
                    child: Column(
                      children: <Widget>[
                        SizedBox(
                          height: 10,
                        ),
                        FadeAnimation(
                            1.4,
                            Container(
                              child: Column(
                                children: <Widget>[
                                  SizedBox(
                                    height: 20,
                                  ),
                                  FadeAnimation(
                                    1.4,
                                    Container(
                                      decoration: BoxDecoration(
                                          color: Colors.white,
                                          borderRadius:
                                              BorderRadius.circular(50),
                                          boxShadow: [
                                            BoxShadow(
                                                color: Color.fromRGBO(
                                                    0, 200, 220, 10),
                                                blurRadius: 20,
                                                offset: Offset(0, 5))
                                          ]),
                                      child: Column(
                                        children: <Widget>[_nameField()],
                                      ),
                                    ),
                                  ),
                                  SizedBox(
                                    height: 10,
                                  ),
                                  FadeAnimation(
                                    1.4,
                                    Container(
                                      decoration: BoxDecoration(
                                          color: Colors.white,
                                          borderRadius:
                                              BorderRadius.circular(50),
                                          boxShadow: [
                                            BoxShadow(
                                                color: Color.fromRGBO(
                                                    0, 200, 220, 10),
                                                blurRadius: 20,
                                                offset: Offset(0, 5))
                                          ]),
                                      child: Column(
                                        children: <Widget>[_emailField()],
                                      ),
                                    ),
                                  ),
                                  SizedBox(
                                    height: 10,
                                  ),
                                  FadeAnimation(
                                    1.4,
                                    Container(
                                      decoration: BoxDecoration(
                                          color: Colors.white,
                                          borderRadius:
                                              BorderRadius.circular(50),
                                          boxShadow: [
                                            BoxShadow(
                                                color: Color.fromRGBO(
                                                    0, 200, 220, 10),
                                                blurRadius: 20,
                                                offset: Offset(0, 5))
                                          ]),
                                      child: Column(
                                        children: <Widget>[_passwordField()],
                                      ),
                                    ),
                                  ),
                                  SizedBox(
                                    height: 10,
                                  ),
                                  FadeAnimation(
                                    1.4,
                                    Container(
                                      decoration: BoxDecoration(
                                          color: Colors.white,
                                          borderRadius:
                                              BorderRadius.circular(50),
                                          boxShadow: [
                                            BoxShadow(
                                                color: Color.fromRGBO(
                                                    0, 200, 220, 10),
                                                blurRadius: 20,
                                                offset: Offset(0, 5))
                                          ]),
                                      child: Column(
                                        children: <Widget>[
                                          _verifyPasswordField()
                                        ],
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            )),
                        SizedBox(
                          height: 35,
                        ),
                        FadeAnimation(
                            1.6,
                            Container(
                              height: 45,
                              width: 150,
                              margin: EdgeInsets.symmetric(horizontal: 45),
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(45),
                                  color: Color.fromRGBO(0, 214, 227, 1)),
                              child: FlatButton(
                                child: Text(
                                  "Register",
                                  style: TextStyle(color: Colors.white),
                                ),
                                onPressed: _submitForm,
                              ),
                            )),
                        SizedBox(
                          height: 5,
                        ),
                        FadeAnimation(
                            1.7,
                            Padding(
                              padding: const EdgeInsets.only(
                                left: 50,
                                right: 10,
                                bottom: 10,
                              ),
                              child: Center(
                                child: Row(
                                  children: <Widget>[
                                    Text(
                                      "Already have an account? ",
                                      style: TextStyle(color: Colors.grey),
                                    ),
                                    Container(
                                      child: FlatButton(
                                        child: Text(
                                          "Login",
                                          style: TextStyle(color: Colors.blue),
                                        ),
                                        onPressed: () {
                                          Navigator.push(
                                              context,
                                              MaterialPageRoute(
                                                builder:
                                                    (BuildContext context) =>
                                                        LoginPage(),
                                              ));
                                        },
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            )),
                        SizedBox(
                          height: 5,
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  bool validate() {
    setState(() {
      _email = _emailController.text;
      _password = _passwordController.text;
      _verifyPwd = _vPasswordController.text;
      _name = _nameController.text;
    });
    print(_name);
    if (_email.isEmpty || _password.isEmpty || _name.isEmpty) {
      _errorMsg = "Missing Required Fields";
      return false;
    } else if (!RegExp(
            r"[a-z0-9!#$%&'*+/=?^_`{|}~-]+(?:\.[a-z0-9!#$%&'*+/=?^_`{|}~-]+)*@(?:[a-z0-9](?:[a-z0-9-]*[a-z0-9])?\.)+[a-z0-9](?:[a-z0-9-]*[a-z0-9])?")
        .hasMatch(_email)) {
      _errorMsg = "Please enter a valid email address";
      return false;
    } else if (_password.length < 6) {
      _errorMsg = "Password must be 6 characters";
      return false;
    } else if (_verifyPwd != _password) {
      _errorMsg = "Passwords do not match";
      return false;
    } else {
      return true;
    }
  }

  showAlertDialog() {
    Widget okButton = FlatButton(
      child: Text("OK"),
      onPressed: () {
        if (_successMsg != "") {
          Navigator.push(
              context,
              MaterialPageRoute(
                builder: (BuildContext context) => HomePageWithSideBar(),
              ));
        } else {
          Navigator.pop(context);
        }
      },
    );

    AlertDialog alert = AlertDialog(
      title: Text('Message'),
      content: Text(_errorMsg),
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
