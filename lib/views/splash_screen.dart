import 'dart:async';

import 'package:flutter/material.dart';
import 'package:mauri_gap/utils/application_constants.dart';
import 'package:mauri_gap/views/components/components.dart';
import 'package:mauri_gap/views/login.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> with SingleTickerProviderStateMixin {
  bool _visible = true;

  Animation<double> animation,decreaseAnimation;
  AnimationController controller;

  @override
  initState() {
    super.initState();
    controller = AnimationController(
        duration: const Duration(milliseconds: 600), vsync: this);
    animation = Tween(begin: 0.0, end: 1.0).animate(controller)
      ..addListener(() {
        setState(() {
          // the state that has changed here is the animation object’s value
        });
      });
    controller.forward();

    decreaseAnimation = Tween(begin: 1.0, end: 0.0).animate(controller)
      ..addListener(() {
        setState(() {
          // the state that has changed here is the animation object’s value
        });
      });
    controller.forward();
    Timer(Duration(seconds: 10), () {
      setState(() {
        _visible = !_visible;
      });
      Timer(Duration(milliseconds: 500),
              () => Navigator.pushReplacementNamed(context, LoginPage.tag));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: AnimatedOpacity(
        opacity: _visible ? animation.value: decreaseAnimation.value ,
        duration: Duration(milliseconds: 500),
        child: Stack(
          fit: StackFit.expand,
          children: <Widget>[
            Container(
              decoration: BoxDecoration(
                  gradient: new LinearGradient(
                      begin: Alignment.topRight,
                      end: Alignment.bottomLeft,
                      stops: [
                    0.1,
                    0.3,
                    0.9
                  ],
                      colors: [
                    Colors.lightGreen[700],
                    Colors.lightGreen[800],
                    Colors.green[800],
                  ])),
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                Expanded(
                  flex: 2,
                  child: Container(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        AnimatedOpacity(
                            opacity: animation.value,
                            duration: Duration(seconds:1),
                            curve: Cubic( 1.0, 2.0, 2.0, 1.0),
                            child: fareiImage(200.0)),
                        Padding(
                          padding: EdgeInsets.only(top: 10.0,bottom: 20.0),
                        ),
                        Text(
                          APPLICATION_NAME,
                          style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.w400,
                              fontSize: 30.0),
                        )
                      ],
                    ),
                  ),
                ),
                Expanded(
                  flex: 1,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Padding(
                        padding: EdgeInsets.only(top: 20.0),
                      ),
                      Text(
                        "Brought to you by \n"
                            "FAREI",
                        softWrap: true,
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            fontWeight: FontWeight.w300,
                            fontSize: 15.0,
                            height: 1.3,
                            color: Colors.white),
                      ),
                      Text(
                        "\nDeveloped by \n"
                            "DSC ALU/ Safe Sha Training",
                        softWrap: true,
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 15.0,
                            height: 1.3,
                            color: Colors.orange),
                      ),
                    ],
                  ),
                ),
                LinearProgressIndicator(),
              ],
            )
          ],
        ),
      ),
    );
  }
}
