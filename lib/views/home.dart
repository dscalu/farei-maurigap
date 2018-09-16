import 'package:flutter/material.dart';
import 'package:mauri_gap/views/field_registration.dart';
import 'package:mauri_gap/views/harvest_records.dart';
import 'package:mauri_gap/views/nutrient_application.dart';
import 'package:mauri_gap/views/farmer_registration.dart';

class HomePage extends StatefulWidget {
  HomePage({Key key, this.title}) : super(key: key);
  static String tag = 'home';
  final String title;
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Container(
        child: ListView(
          children: <Widget>[
            tile('Farmer Registration',FarmerRegistration.tag),
            tile('Field Registration',FieldRegistration.tag),
            tile('Stock Tracking','stockTracking'),
            tile('Planting Records','plantingRecords'),
            tile('Nutrient Application',NutrientApplication.tag),
            tile('Harvest Records',HarvestRecords.tag),
            tile('FAQ/Help','help'),
          ],
        ),
      ),
    );
  }

  Widget tile(String tileName,String nextView) {
    return ListTile(
      contentPadding: EdgeInsets.only(left: 20.0, right: 20.0),
      leading: CircleAvatar(
        backgroundColor: Colors.tealAccent,
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
