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
    LoginPage.routeName: (context) => LoginPage(),
    HomePage.routeName: (context) => HomePage(title: 'MauriGap'),
    HarvestRecords.routeName: (context) => HarvestRecords(title: 'Harvest Records'),
    FieldRegistration.routeName: (context) =>
        FieldRegistration(title: 'Field Registration'),
    PlantingRecords.routeName: (context) =>
        PlantingRecords(title: 'Planting Records'),
    StockTracking.routeName: (context) => StockTracking(),
    NutrientApplication.routeName: (context) =>
        NutrientApplication(title: 'Nutrient Application'),
    FarmerRegistration.routeName: (context) =>
        FarmerRegistration(title: 'Farmer Registration'),
    Help.routeName: (context) => Help(title: 'Help & FAQ'),
  };

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'MauriGap Demo',
      theme: new ThemeData(
        primarySwatch: Colors.lightGreen,
        fontFamily: 'Nunito',
      ),
      home: SplashScreen(),
//      initialRoute: LoginPage.tag,
      routes: routes,
    );
  }
}
