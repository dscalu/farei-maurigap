import 'package:flutter/material.dart';

//Constants
num NORMAL_FONT_SIZE = 20.0;

//Methods
textStyle() => new TextStyle(fontSize: 20.0, color: Colors.white);

headingTextStyle(String name) =>
    new Container(
        color: Colors.grey.withOpacity(0.2),
        width: 400.00,
        padding: EdgeInsets.all(20.00),
        child: new Text(
            name,
            style: new TextStyle(color: Colors.black54, fontSize: 22.0)
        ));