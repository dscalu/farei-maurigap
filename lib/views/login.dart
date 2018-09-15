import 'package:flutter/material.dart';
import './home.dart';

class LoginPage extends StatefulWidget {
  static String tag = 'login-page'; // to be used for routing

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {

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
      child: CircleAvatar(
        backgroundColor: Colors.lightGreenAccent,
        child: FlutterLogo(size: 60.0),
        radius: 48.0,
      ),
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
      padding: EdgeInsets.symmetric(vertical: 16.0),
      child: Material(
        borderRadius: BorderRadius.circular(30.0),
        child: MaterialButton(
          child: Text(
            'Log In',
            style: TextStyle(color: Colors.white),
          ),
          color: Colors.lightGreenAccent,
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
            logo(),
            SizedBox(height: 48.0),
            email(),
            SizedBox(height: 8.0),
            password(),
            SizedBox(height: 24.0),
            loginButton(),
            forgotButton()
          ],
          padding: EdgeInsets.only(left: 24.0, right: 24.0),
          shrinkWrap: true,
        ),
      ),
    );
  }
}
