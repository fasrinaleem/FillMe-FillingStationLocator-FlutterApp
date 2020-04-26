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
  String _errorMsg = "";
  String _successMsg = "";

  void _submit() async {
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
        _errorMsg = "Successfully Login";
        showAlertDialog();
      } catch (e) {
        print("Error = " + e.toString());
        _errorMsg = e.code;
        showAlertDialog();
      }
    } else {
      showAlertDialog();
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
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  FadeAnimation(
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
                          height: 55,
                        ),
                        FadeAnimation(
                          1.4,
                          Container(
                            decoration: BoxDecoration(
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
                          height: 10,
                        ),
                        FadeAnimation(
                          1.4,
                          Container(
                            decoration: BoxDecoration(
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
                          height: 10,
                        ),
                        FadeAnimation(
                            1.5,
                            Padding(
                              padding: const EdgeInsets.only(
                                left: 200,
                                right: 5,
                                bottom: 10,
                              ),
                              child: Text(
                                "Forgot Password?",
                                style: TextStyle(color: Colors.grey),
                              ),
                            )),
                        SizedBox(
                          height: 40,
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
                                  "Login",
                                  style: TextStyle(color: Colors.white),
                                ),
                                onPressed: _submit,
                              ),
                            )),
                        SizedBox(
                          height: 10,
                        ),
                        FadeAnimation(
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
