import 'package:flutter/material.dart';

Widget fareiImage(){
  var assetsImage = new AssetImage('assets/farei-logo.png');
  var image = new Image(image: assetsImage,width: 110.0,height: 110.0,);
  return image;
}
  Widget appBar() => AppBar(
    title: ListTile(
      leading: Icon(Icons.ac_unit),
      title: new Text('MauriGap', textAlign: TextAlign.start),
      contentPadding: EdgeInsets.only(left: 42.0),
    ),
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

  buttonFontStyle() => TextStyle(color: Colors.grey, fontSize: 20.0);
  padding() => EdgeInsets.symmetric(vertical: 8.0, horizontal: 24.0);
