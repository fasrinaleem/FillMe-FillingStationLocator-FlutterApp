import 'package:flutter/material.dart';
import 'package:fillme/services/crud_options.dart';
//import 'package:FillMe/pages/home_sidebar.dart';

class SignUpPage extends StatefulWidget {
  SignUpPage({this.db_base, this.title});

  final Base db_base;
  final String title;

  @override
  _SignUpPageState createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  final _formKey = new GlobalKey<FormState>();

  String _email;
  String _contactNo;
  String _name;
  String _password;

  String _errorMessage;
  bool _isLoginForm;
  bool _isLoading;

  bool validateAndSave() {
    final form = _formKey.currentState;
    if (form.validate()) {
      form.save();
      return true;
    }
    return false;
  }

  void submitData() async {
//    setState(() {
//      _errorMessage = "";
//      _isLoading = true;
//    });
//    if (validateAndSave()) {
    String userId = "";
    try {
//          userId = await widget.db_base.signUp(_name,_contactNo,_email, _password);
//          print('Signed up user: $userId');
      Navigator.of(context).pushReplacementNamed('/home_sidebar');

//        if (userId.length > 0 && userId != null && _isLoginForm) {
//        //  widget.loginCallback();
//        }
    } catch (e) {
      print('Error: $e');
      setState(() {
        _isLoading = false;
        _errorMessage = e.message;
        _formKey.currentState.reset();
      });
    }
    // }
  }

  Widget errorMessage() {
    if (_errorMessage.length > 0 && _errorMessage != null) {
      return new Text(
        _errorMessage,
        style: TextStyle(
            fontSize: 13.0,
            color: Colors.red,
            height: 1.0,
            fontWeight: FontWeight.w300),
      );
    } else {
      return new Container(
        height: 0.0,
      );
    }
  }

  Widget _backButton() {
    return InkWell(
      onTap: () {
        Navigator.pop(context);
      },
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 10),
        child: Row(
          children: <Widget>[
            Container(
              padding: EdgeInsets.only(left: 0, top: 10, bottom: 10),
              child: Icon(Icons.keyboard_arrow_left, color: Colors.black),
            ),
            Text('Back',
                style: TextStyle(fontSize: 12, fontWeight: FontWeight.w500))
          ],
        ),
      ),
    );
  }

  Widget _submitButton() {
    return Container(
      width: MediaQuery.of(context).size.width,
      padding: EdgeInsets.symmetric(vertical: 15),
      alignment: Alignment.center,
      child: new RaisedButton(
        elevation: 5.0,
        shape: new RoundedRectangleBorder(
            borderRadius: new BorderRadius.circular(30.0)),
        color: Colors.blue,
        child: new Text('Register',
            style: new TextStyle(fontSize: 20.0, color: Colors.white)),
        onPressed: submitData,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        body: SingleChildScrollView(
            child: Container(
          height: MediaQuery.of(context).size.height,
          child: Stack(
            children: <Widget>[
              Container(
                padding: EdgeInsets.symmetric(horizontal: 100),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    _submitButton(),
                  ],
                ),
              ),
              Positioned(top: 40, left: 0, child: _backButton()),
            ],
          ),
        )));
  }
}
