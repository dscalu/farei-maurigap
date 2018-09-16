import 'package:flutter/material.dart';
import 'package:mauri_gap/views/field_registration.dart';
import 'package:mauri_gap/views/harvest_records.dart';
import 'package:mauri_gap/views/planting_record.dart';
import './views/home.dart';
import './views/login.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  final routes = <String, WidgetBuilder>{
    LoginPage.tag: (context) => LoginPage(),
    HomePage.tag: (context) => HomePage(title: 'MauriGap'),
    HarvestRecords.tag: (context) => HarvestRecords(title: 'Harvest Records'),
    FieldRegistration.tag: (context) => FieldRegistration(title: 'Field Registration'),
    PlantingRecords.tag: (context) => PlantingRecords(title: 'Planting Records'),
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
