import 'package:flutter/material.dart';
import 'package:mauri_gap/views/field_registration.dart';
import 'package:mauri_gap/views/harvest_records.dart';
import 'package:mauri_gap/views/help.dart';
import 'package:mauri_gap/views/nutrient_application.dart';
import 'package:mauri_gap/views/planting_record.dart';
import 'package:mauri_gap/views/farmer_registration.dart';
import 'package:mauri_gap/views/splash_screen.dart';
import './views/home.dart';
import './views/login.dart';
import './views/stock_tracking.dart';

void main() => runApp(Maurigap());

class Maurigap extends StatelessWidget {
  final routes = <String, WidgetBuilder>{
    LoginPage.tag: (context) => LoginPage(),
    HomePage.tag: (context) => HomePage(title: 'MauriGap'),
    HarvestRecords.tag: (context) => HarvestRecords(title: 'Harvest Records'),
    FieldRegistration.tag: (context) =>
        FieldRegistration(title: 'Field Registration'),
    PlantingRecords.tag: (context) =>
        PlantingRecords(title: 'Planting Records'),
    StockTracking.tag: (context) => StockTracking(),
    NutrientApplication.tag: (context) =>
        NutrientApplication(title: 'Nutrient Application'),
    FarmerRegistration.tag: (context) =>
        FarmerRegistration(title: 'Farmer Registration'),
    Help.tag: (context) => Help(title: 'Help & FAQ'),
  };

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'MauriGap Demo',
      theme: new ThemeData(
        primarySwatch: Colors.lightGreen,
        fontFamily: 'Nunito',
        /*textTheme: TextTheme(
        )*/
      ),
      home: SplashScreen(),
//      initialRoute: LoginPage.tag,
      routes: routes,
    );
  }
}
