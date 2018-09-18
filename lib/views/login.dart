import 'package:flutter/material.dart';
import 'package:mauri_gap/views/components/components.dart';
import './home.dart';

class LoginPage extends StatefulWidget {
  static String tag = 'login-page'; // to be used for routing

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> with SingleTickerProviderStateMixin{

  Animation<double> animation;
  AnimationController controller;

  @override
  initState() {
    super.initState();
    controller = AnimationController(
        duration: const Duration(milliseconds: 1000), vsync: this);
    animation = Tween(begin: 100.0, end: 150.0).animate(controller)
      ..addListener(() {
        setState(() {
          // the state that has changed here is the animation object’s value
        });
      });
    controller.forward();
  }

  Widget email() {
    return TextFormField(
      autofocus: false,
      decoration: InputDecoration(
          hintText: 'Email',
          contentPadding: EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
          border:
              OutlineInputBorder(borderRadius: BorderRadius.circular(32.0))),
      initialValue: 'test@gmail.com',
      keyboardType: TextInputType.emailAddress,
    );
  }

  Widget logo() {
    return Hero(
      tag: 'hero',
      child: fareiImage(150.0),
    );
  }

  Widget password() {
    return TextFormField(
      autofocus: false,
      decoration: InputDecoration(
          hintText: 'Password',
          contentPadding: EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
          border:
              OutlineInputBorder(borderRadius: BorderRadius.circular(32.0))),
      initialValue: 'some password',
      obscureText: true,
    );
  }

  Widget loginButton() {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 16.0, horizontal: 45.0),
      child: Material(
        child: MaterialButton(
          child: Text(
            'Login',
            style: TextStyle(color: Colors.white, fontSize: 22.0,fontWeight: FontWeight.w300),
          ),
          color: Colors.lightGreen,
          height: 42.0,
          onPressed: () {
            Navigator.of(context).pushNamed(HomePage.tag);
          },
          minWidth: 20.0,
        ),
        shadowColor: Colors.lightGreenAccent.shade100,
      ),
    );
  }

  Widget forgotButton() {
    return FlatButton(
      child: Text(
        'Forgot Password?',
        style: TextStyle(color: Colors.black54),
      ),
      onPressed: () {},
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
          child: ListView(
            children: <Widget>[
              Container(
                  width: animation.value,
                  height: animation.value,
                  child: logo()),
              SizedBox(height: 24.0),
              email(),
              SizedBox(height: 16.0),
              password(),
              SizedBox(height: 20.0),
              loginButton(),
              forgotButton()
            ],
            shrinkWrap: true,
            padding: EdgeInsets.symmetric(horizontal: 50.0),
          ),
      ),
    );
  }
}
