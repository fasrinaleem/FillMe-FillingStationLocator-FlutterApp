import 'animations/FadeAnimation.dart';
import 'package:flutter/material.dart';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:fillme/registration.dart';
import 'home_sidebar.dart';

class LoginPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _LoginPage();
  }
}

class _LoginPage extends State<LoginPage> {
  final TextEditingController _passwordController = new TextEditingController();
  final TextEditingController _emailController = new TextEditingController();
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;

  String _email;
  String _password;
  String _message = "";
  String _successMsg = "";

  Future _submit() async {
    if (validate()) {
      try {
        print(_email);
        print(_password);

        AuthResult result = await _firebaseAuth.signInWithEmailAndPassword(
            email: _email, password: _password);
        FirebaseUser user = result.user;
        String userId = user.uid;

        print("login user  =" + userId);
        _successMsg = "Successfully Login";
        _message = "Successfully Login";
        showAlertDialog();
      } catch (e) {
        print("Error = " + e.toString());
        _message = e.message;
        showAlertDialog();
      }
    } else {
      showAlertDialog();
    }
  }

  Future _forgotPwd() async {
    _email = _emailController.text;
    if (_email.isEmpty) {
      _message = "Please Add your email.";
      showAlertDialog();
    } else {
      try {
        await _firebaseAuth.sendPasswordResetEmail(email: _email);
        _message = "Check your email & add the new password.";
        showAlertDialog();
      } catch (e) {
        _message = e.message;
        showAlertDialog();
      }
    }
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // Main container for login screen (Background container - Sky blue one)
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
              height: 80,
            ),
            Padding(
              padding: EdgeInsets.all(10),
              child: Column(
                // Put the Login and welcome message on top of main container (Bakground - Sky blue one)
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  FadeAnimation(
                      // Set the animation effect to input text field
                      // Brigining the FadeAnimation from FadeAnimation.dart class
                      1,
                      Text(
                        "Login",
                        style: TextStyle(color: Colors.white, fontSize: 40),
                      )),
                  SizedBox(
                    height: 10,
                  ),
                  FadeAnimation(
                      1.3,
                      Text(
                        "Welcome Back",
                        style: TextStyle(color: Colors.white, fontSize: 18),
                      )),
                ],
              ),
            ),
            SizedBox(height: 20),
            Expanded(
              // Put another container (second container) on top of main container
              child: Container(
                // Setting the box radius as circular (Box decorations)
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(40),
                        topRight: Radius.circular(40))),
                child: SingleChildScrollView(
                  // set the paddings for login ui
                  child: Padding(
                    padding: EdgeInsets.all(20),
                    child: Column(
                      children: <Widget>[
                        // set the heigh from the top (from main container top)
                        SizedBox(
                          height: 55,
                        ),
                        FadeAnimation(
                          // Set the animation effect to input text field
                          // Brigining the FadeAnimation from FadeAnimation.dart class
                          1.4,
                          Container(
                            decoration: BoxDecoration(
                                // Design the input text field as circular one and showing the sky blue shadow on it - email field
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(50),
                                boxShadow: [
                                  BoxShadow(
                                      color: Color.fromRGBO(0, 200, 220, 10),
                                      blurRadius: 20,
                                      offset: Offset(0, 5))
                                ]),
                            child: Column(
                              children: <Widget>[_emailField()],
                            ),
                          ),
                        ),
                        SizedBox(
                          // Set space after email input text field
                          height: 10,
                        ),
                        FadeAnimation(
                          // Set the animation effect to input text field
                          // Brigining the FadeAnimation from FadeAnimation.dart class
                          1.4,
                          Container(
                            decoration: BoxDecoration(
                                // Design the input text field as circular one and showing the sky blue shadow on it - Password field
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(50),
                                boxShadow: [
                                  BoxShadow(
                                      color: Color.fromRGBO(0, 200, 220, 10),
                                      blurRadius: 20,
                                      offset: Offset(0, 5))
                                ]),
                            child: Column(
                              children: <Widget>[_passwordField()],
                            ),
                          ),
                        ),
                        SizedBox(
                          // Set space after password input text field
                          height: 10,
                        ),
                        FadeAnimation(
                            // Set the animation effect to input text field
                            // Brigining the FadeAnimation from FadeAnimation.dart class
                            1.5,
                            Row(
                              children: <Widget>[
                                Padding(
                                  // set the forgot password link
                                  padding: const EdgeInsets.only(
                                    left: 160,
                                    right: 5,
                                    bottom: 10,
                                  ),
                                  child: FlatButton(
                                    child: Text(
                                      "Forgot Password?",
                                      style: TextStyle(
                                        color: Colors.grey,
                                        fontWeight: FontWeight.normal,
                                      ),
                                    ),
                                    onPressed: _forgotPwd,
                                  ),
                                ),
                              ],
                            )),
                        SizedBox(
                          //set the space after forgot password link
                          height: 40,
                        ),
                        FadeAnimation(
                            // Set the animation effect to input text field
                            // Brigining the FadeAnimation from FadeAnimation.dart class
                            1.6,
                            Container(
                              height: 45,
                              width: 150,
                              margin: EdgeInsets.symmetric(horizontal: 45),
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(45),
                                  color: Color.fromRGBO(0, 214, 227, 1)),
                              child: FlatButton(
                                // Design the login button as circular one and showing the sky blue shadow on it
                                child: Text(
                                  "Login",
                                  style: TextStyle(color: Colors.white),
                                ),
                                onPressed: _submit,
                              ),
                            )),
                        SizedBox(
                          // Set space after login button
                          height: 10,
                        ),
                        FadeAnimation(
                            // Set the animation effect to input text field
                            // Brigining the FadeAnimation from FadeAnimation.dart class
                            1.7,
                            Padding(
                              padding: const EdgeInsets.only(
                                left: 50,
                                right: 10,
                                bottom: 10,
                              ),
                              child: Row(
                                children: <Widget>[
                                  Text(
                                    "Don't have an account? ",
                                    style: TextStyle(color: Colors.grey),
                                  ),
                                  Container(
                                    child: FlatButton(
                                      child: Text(
                                        // Set the Register link
                                        "Register",
                                        style: TextStyle(color: Colors.blue),
                                      ),
                                      onPressed: () {
                                        Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                              builder: (BuildContext context) =>
                                                  RegistrationPage(),
                                            ));
                                      },
                                    ),
                                  ),
                                ],
                              ),
                            )),
                        SizedBox(
                          // Set space after register link
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
    });
    if ((_email.isEmpty && _password.isEmpty) ||
        _email.isEmpty ||
        _password.isEmpty) {
      _message = "Missing Required Fields";
      return false;
    } else if (!RegExp(
            r"[a-z0-9!#$%&'*+/=?^_`{|}~-]+(?:\.[a-z0-9!#$%&'*+/=?^_`{|}~-]+)*@(?:[a-z0-9](?:[a-z0-9-]*[a-z0-9])?\.)+[a-z0-9](?:[a-z0-9-]*[a-z0-9])?")
        .hasMatch(_email)) {
      _message = "Please enter a valid email address";
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
