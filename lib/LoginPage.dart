import 'package:flutter/material.dart';
import 'package:onboarding/animations/FadeAnimation.dart';

class LoginPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: Color.fromRGBO(3, 9, 23, 1),
      // backgroundColor: Color.fromRGBO(10, 150, 227, 1),
      backgroundColor: Color.fromRGBO(3, 15, 10, 1),
      body: Container(
        padding: EdgeInsets.all(30),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            FadeAnimation(
                1.2,
                Text(
                  "Login",
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 40,
                      fontWeight: FontWeight.bold),
                )),
            SizedBox(
              height: 30,
            ),
            FadeAnimation(
                1.5,
                Container(
                  padding: EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Colors.white,
                  ),
                  child: Column(
                    children: <Widget>[
                      Container(
                        decoration: BoxDecoration(
                            border: Border(
                                bottom: BorderSide(color: Colors.grey[300]))),
                        child: TextField(
                          decoration: InputDecoration(
                              border: InputBorder.none,
                              hintStyle:
                                  TextStyle(color: Colors.grey.withOpacity(.8)),
                              hintText: "Email or Phone Number"),
                        ),
                      ),
                      Container(
                        decoration: BoxDecoration(
                            border: Border(
                                bottom: BorderSide(color: Colors.grey[300]))),
                        child: TextField(
                          decoration: InputDecoration(
                              border: InputBorder.none,
                              hintStyle:
                                  TextStyle(color: Colors.grey.withOpacity(.8)),
                              hintText: "Password"),
                        ),
                      )
                    ],
                  ),
                )),
            SizedBox(
              height: 40,
            ),
            FadeAnimation(
                1.8,
                Center(
                  child: Container(
                    width: 120,
                    padding: EdgeInsets.all(15),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(50),
                        color: Color.fromRGBO(0, 214, 227, 1)),
                    child: Center(
                      child: Text("Login",
                          style:
                              TextStyle(color: Colors.white)),
                    ),
                  ),
                )),
          ],
        ),
      ),
    );
  }
}
