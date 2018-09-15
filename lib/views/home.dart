import 'package:flutter/material.dart';

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
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            tile('Farmer Registration'),
            tile('Stock Tracking'),
            tile('Planting Records'),
            tile('Nutrient Application'),
            tile('Harvest Records'),
            tile('FAQ/Help'),
          ],
        ),
      ),
    );
  }

  Widget tile(String tileName) {
    return ListTile(
      contentPadding: EdgeInsets.only(left: 20.0, right: 20.0),
      leading: CircleAvatar(
        backgroundColor: Colors.tealAccent,
        child: FlutterLogo(size: 24.0),
        radius: 36.0,
      ),
      title: Text(
        tileName,
        style: TextStyle(color: Colors.black54, fontSize: 22.0, height: 3.0, ),
      ),
      enabled: true,
      onTap: () {},
      subtitle: Text(
        '',
        style: TextStyle(color: Colors.black54, fontSize: 22.0, height: 1.0, ),
      ),
    );
  }
}
