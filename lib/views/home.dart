import 'package:flutter/material.dart';
import 'package:mauri_gap/views/components/components.dart';
import 'package:mauri_gap/views/harvest_records.dart';
import './stock_tracking.dart';
import 'package:mauri_gap/views/help.dart';
import 'package:mauri_gap/views/nutrient_application.dart';
import 'package:mauri_gap/views/farmer_registration.dart';
import 'package:mauri_gap/views/planting_record.dart';

class HomePage extends StatefulWidget {
  HomePage({Key key, this.title}) : super(key: key);
  static final String tag = 'home';
  final String title;
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBar(),
      body: Container(
        child: ListView(
          children: <Widget>[
            tile('Farmer Registration',FarmerRegistration.tag),
            tile('Stock Tracking', StockTracking.tag),
            tile('Planting Records', PlantingRecords.tag),
            tile('Nutrient Application',NutrientApplication.tag),
            tile('Harvest Records',HarvestRecords.tag),
            tile('FAQ/Help',Help.tag),
          ],
        ),
      ),
    );
  }

  Widget tile(String tileName,String nextView) {
    return ListTile(
      contentPadding: EdgeInsets.only(left: 20.0, right: 20.0),
      leading: CircleAvatar(
        backgroundColor: Colors.lightGreen,
        child: FlutterLogo(size: 24.0),
        radius: 24.0,
      ),
      title: Text(
        tileName,
        style: TextStyle(color: Colors.black54, fontSize: 24.0, height: 2.2, ),
      ),
      enabled: true,
      onTap: () { Navigator.of(context).pushNamed(nextView);},
      subtitle: Text(
        '',
        style: TextStyle(color: Colors.black54, fontSize: 22.0, height: 1.0, ),
      ),
    );
  }
}
