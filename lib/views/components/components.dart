import 'package:flutter/material.dart';

Widget appBar() => AppBar(
      title: new Text('MauriGap', textAlign: TextAlign.center),
      centerTitle: true,
    );

Widget headingTextStyle(String name) => new Container(
    color: Colors.grey.withOpacity(0.2),
    width: 400.00,
    padding: EdgeInsets.all(20.00),
    child: new Text(name,
        style: new TextStyle(color: Colors.black54, fontSize: 22.0)));

Widget viewTile(String recordType) {
  return ListTile(
    leading: Icon(
      Icons.sd_card,
      color: Colors.lightGreen,
      size: 36.0,
    ),
    title: Text(
      recordType,
      style: TextStyle(fontSize: 22.0, color: Colors.black54, height: 1.5),
    ),
    onTap: () {},
  );
}

buttonFontStyle() => TextStyle(fontSize: 20.0);
padding() => EdgeInsets.symmetric(vertical: 8.0, horizontal: 24.0);