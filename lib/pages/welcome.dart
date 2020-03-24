import 'package:flutter/material.dart';
import 'package:FillMe/pages/login.dart';
import 'package:FillMe/pages/signup.dart';
import 'navigation_bloc.dart';

class WelcomePage extends StatelessWidget with NavigationStates{
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Welcome Page',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: WelcomePage(),
    );
  }
}

class WelcomePageCont extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          image: DecorationImage(
              image: AssetImage(
                  "assets/images/background.jpeg"),fit: BoxFit.cover)),
      child: Scaffold(
          backgroundColor: Colors.transparent,
          appBar: AppBar(
            backgroundColor: Colors.transparent,
            elevation: 0,
            title: Text('Welcome to FillMe'),
            centerTitle: true,
          ),
          body: Container(
            padding: EdgeInsets.fromLTRB(10.0, 20.0, 10.0, 10.0),
            child: ListView(
              padding: EdgeInsets.all(40.0),
              children: <Widget>[
                SizedBox(
                  height: 40.0,
                ),
                Material(
                  elevation: 5.0,
                  color: Colors.transparent,
                  borderRadius: BorderRadius.circular(30.0),
                  child: OutlineButton(
                    padding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
                    disabledBorderColor: Colors.white,
                    shape: new RoundedRectangleBorder(
                        borderRadius: new BorderRadius.circular(30.0)),
                    onPressed: () {
                      navigateToSignUpPage(context);
                    },
                    borderSide: BorderSide(color: Colors.white),
                    child: Text("SignUp",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            fontWeight: FontWeight.bold, color: Colors.white)),
                  ),
                ),
                SizedBox(
                    height: 40.0,
                    child: Center(
                      child: Text(
                        'OR',
                        style: TextStyle(color: Colors.white),
                      ),
                    )),
                Material(
                  elevation: 5.0,
                  color: Colors.transparent,
                  borderRadius: BorderRadius.circular(30.0),
                  child: OutlineButton(
                    padding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
                    shape: new RoundedRectangleBorder(
                        borderRadius: new BorderRadius.circular(30.0)),
                    borderSide: BorderSide(color: Colors.white),
                    disabledBorderColor: Colors.white,
                    onPressed: () {
                      navigateToLoginPage(context);
                    },
                    child: Text("Login",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            fontWeight: FontWeight.bold, color: Colors.white)),
                  ),
                ),
              ],
            ),
          )),
    );
  }
  void navigateToSignUpPage(context) async {
    Navigator.push(
        context, MaterialPageRoute(builder: (context) => SignUpPage()));
  }

  void navigateToLoginPage(context) async {
    Navigator.push(
        context, MaterialPageRoute(builder: (context) => LoginPage()));
  }

}