import 'dart:async';

import 'package:flutter/material.dart';

class Authenticate extends StatefulWidget {
  _SignInState createState() => _SignInState();
}

class _SignInState extends State<Authenticate> {
  @override
  Widget build(BuildContext context) {
    return Material(
        type: MaterialType.transparency,
        child: new Container(
            width: double.maxFinite,
            height: double.maxFinite,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20.0),
              color: Colors.green[300],
            ),
            child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Expanded(flex: 1, child: SizedBox()),
                  Expanded(
                      flex: 2,
                      child: Text(
                        "Sign in to Recycle App!",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 40,
                          fontWeight: FontWeight.w600,
                          letterSpacing: 1,
                          color: Colors.white,
                        ),
                      )),
                  Expanded(
                    flex: 4,
                    child:
                        Image(image: AssetImage("assets/images/Plastic.png")),
                  ),
                  Expanded(
                    flex: 4,
                    child: FloatingActionButton(
                      child: Text('Sign In'),
                    ),
                  )
                ])));
  }
}
