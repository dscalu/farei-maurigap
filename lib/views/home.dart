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
      appBar: appBar(context),
      body: Container(
        child: ListView(
          padding: EdgeInsets.all(14.0),
          children: <Widget>[
            tile('Farmer Registration', FarmerRegistration.tag),
            tile('Stock Tracking', StockTracking.tag),
            tile('Planting Records', PlantingRecords.tag),
            tile('Nutrient Application', NutrientApplication.tag),
            tile('Harvest Records', HarvestRecords.tag),
            tile('FAQ/Help', Help.tag),
          ],
        ),
      ),
    );
  }

  Widget tile(String tileName, String nextView) {
    return ListTile(
      contentPadding: EdgeInsets.only(left: 16.0, right: 20.0),
      leading: CircleAvatar(
        backgroundColor: Colors.lightGreen,
        child: Icon(
          Icons.beenhere,
          color: Colors.white,
          size: 30.0,
        ),
        radius: 30.0,
      ),
      title: Padding(
        padding: const EdgeInsets.only(left: 10.0),
        child: Text(
          tileName,
          style: TextStyle(
            color: Colors.black54,
            fontSize: 22.0,
            height: 2.4,
          ),
        ),
      ),
      enabled: true,
      onTap: () {
        Navigator.of(context).pushNamed(nextView);
      },
      subtitle: Text(
        '',
        style: TextStyle(
          color: Colors.black54,
          fontSize: 22.0,
          height: 0.8,
        ),
      ),
    );
  }
}
