import 'package:flutter/material.dart';
import './views/home.dart';
import './views/login.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  final routes = <String, WidgetBuilder>{
    LoginPage.tag: (context) => LoginPage(),
    HomePage.tag: (context) => HomePage(title: 'MauriGap'),
  };
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'MauriGap Demo',
      debugShowCheckedModeBanner: false,
      theme: new ThemeData(
        primarySwatch: Colors.lightGreen,
        fontFamily: 'Nunito'
      ),
      home: LoginPage(),
//      initialRoute: LoginPage.tag,
      routes: routes,
    );
  }
}
