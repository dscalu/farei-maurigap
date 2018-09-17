import 'package:flutter/material.dart';
import 'package:mauri_gap/utils/application_constants.dart';

Widget fareiImage() {
  var assetsImage = new AssetImage('assets/farei-logo.png');
  var image = new Image(
    image: assetsImage,
    width: 110.0,
    height: 110.0,
  );
  return image;
}

Widget appBar(context) => PreferredSize(
    preferredSize: Size.fromHeight(70.0),
    child: AppBar(
        leading: FlatButton(
          padding: const EdgeInsets.fromLTRB( 40.0,20.0,20.0,20.0),
          child: Icon(
            Icons.arrow_back,
            color: Colors.white,
            size: 35.0,
          ),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: Padding(
          padding: const EdgeInsets.all(8.0),
          child: ListTile(
            leading: Image(image: AssetImage('assets/farei-logo.png')),
            title: Row(
              children: <Widget>[
                new Text(
                APPLICATION_NAME,
                textAlign: TextAlign.start,
                style: TextStyle(fontSize: 24.0, color: Colors.white),
              ),IconButton(
                padding: EdgeInsets.fromLTRB(20.0,0.0,0.0,5.0),
                icon: Icon(
                  Icons.help_outline,
                  size: 40.0,
                  color: Colors.white,
                ),
              )
              ]
            ),
            contentPadding: EdgeInsets.only(left: 35.0),
          ),
        )));

Widget headingTextStyle(String name) => new Container(
    color: Colors.grey.withOpacity(0.3),
    width: 400.00,
    padding: EdgeInsets.all(20.00),
    child: new Text(name,
        style: new TextStyle(
          color: Colors.black54,
          fontSize: 22.0,
        )));

Widget viewTile(String recordType) {
  return ListTile(
    leading: Icon(
      Icons.assignment,
      color: Colors.black45,
      size: 36.0,
    ),
    title: Text(
      recordType,
      style: TextStyle(fontSize: 22.0, color: Colors.black54, height: 1.5),
    ),
    onTap: () {},
  );
}

buttonFontStyle() => TextStyle(color: Colors.grey, fontSize: 20.0);

padding() => EdgeInsets.symmetric(vertical: 8.0, horizontal: 24.0);
