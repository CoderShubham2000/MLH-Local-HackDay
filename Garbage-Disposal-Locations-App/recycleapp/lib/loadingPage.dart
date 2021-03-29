import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';
import 'all.dart';

// Second Loading
class SecondLoad extends StatefulWidget {
  _SecondLoadState createState() => _SecondLoadState();
}

class _SecondLoadState extends State<SecondLoad> with TickerProviderStateMixin {
  AnimationController _animationControl;
  void initState() {
    _animationControl =
        AnimationController(vsync: this, duration: Duration(seconds: 2));
    Timer(Duration(seconds: 5), () => _animationControl.forward());
    super.initState();
  }

  void dispose() {
    _animationControl.dispose();
    super.dispose();
  }

  Widget build(BuildContext context) {
    return FadeTransition(
        opacity: _animationControl,
        child: Container(
            color: Colors.white,
            width: double.infinity,
            height: double.infinity,
            child: Stack(
              alignment: Alignment.center,
              children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(Icons.nature, size: 45, color: Colors.green),
                    RichText(
                        textAlign: TextAlign.center,
                        text: TextSpan(
                            style: new TextStyle(
                              fontSize: 19.0,
                              color: Colors.black,
                            ),
                            children: <TextSpan>[
                              new TextSpan(text: "Take part in the cause\nto"),
                              new TextSpan(
                                  text: " save our home",
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                  ))
                            ])),
                  ],
                ),
                Align(
                    alignment: Alignment.bottomRight,
                    child: Container(
                      margin: EdgeInsets.fromLTRB(0, 0, 20, 20),
                      child: ElevatedButton(
                        child: Icon(Icons.arrow_forward,
                            color: Colors.white, size: 30),
                        onPressed: () {
                          Navigator.push(
                              context,
                              PageTransition(
                                  child: HomePage(),
                                  type: PageTransitionType.fade,
                                  duration: Duration(milliseconds: 600)));
                        },
                        style: ElevatedButton.styleFrom(
                            shape: CircleBorder(),
                            primary: Colors.green,
                            padding: EdgeInsets.all(20)),
                      ),
                    ))
              ],
            )));
  }
}

// First Loading
class FirstLoad extends StatefulWidget {
  _FirstLoadState createState() => _FirstLoadState();
}

class _FirstLoadState extends State<FirstLoad> with TickerProviderStateMixin {
  AnimationController _animationControl;
  AnimationController _animationControl2;
  void initState() {
    _animationControl =
        AnimationController(vsync: this, duration: Duration(seconds: 2));
    _animationControl2 =
        AnimationController(vsync: this, duration: Duration(seconds: 2));
    _animationControl.forward();
    _animationControl2.forward();
    Timer(Duration(seconds: 10), () {
      _animationControl2.reverse();
    });
    super.initState();
  }

  void dispose() {
    _animationControl.dispose();
    super.dispose();
  }

  Widget build(BuildContext context) {
    return FadeTransition(
        opacity: _animationControl2,
        child: Container(
          width: double.infinity,
          color: Color(0xff009900),
          child: SlideTransition(
              position: Tween<Offset>(begin: Offset(0, 2), end: Offset(0, 0))
                  .animate(_animationControl),
              child: Container(
                  alignment: Alignment.center,
                  color: Color(0xff009900),
                  width: double.infinity,
                  height: double.infinity,
                  child: Text(
                    "Welcome",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 30,
                    ),
                  ))),
        ));
  }
}

class LoadingPage extends StatefulWidget {
  _LoadingPageState createState() => _LoadingPageState();
}

class _LoadingPageState extends State<LoadingPage> {
  Widget build(BuildContext context) {
    return Container(
        width: double.infinity,
        height: double.infinity,
        child: Stack(
          children: [FirstLoad(), SecondLoad()],
        ));
  }
}
