import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:mauri_gap/utils/application_constants.dart';
import 'package:mauri_gap/views/help.dart';

Widget fareiImage([double dimension]) {
  var assetsImage = new AssetImage('assets/farei_logo_circle.png');
  var image = new Image(
    image: assetsImage,
    width: dimension != null ? dimension : 120.0,
    height: dimension != null ? dimension : 120.0,
  );
  return image;
}

Widget appBar(context) => PreferredSize(
    preferredSize: Size.fromHeight(70.0),
    child: AppBar(
        leading: FlatButton(
          padding: const EdgeInsets.fromLTRB(30.0, 15.0, 20.0, 20.0),
          child: Icon(
            FontAwesomeIcons.chevronCircleLeft,
            color: Colors.white,
            size: 40.0,
          ),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: Padding(
          padding: const EdgeInsets.only(top: 8.0),
          child: ListTile(
            leading: Image(
              image: AssetImage('assets/farei_logo_circle.png'),
              width: 35.0,
              height: 35.0,
            ),
            title: Row(children: <Widget>[
              Padding(
                padding: const EdgeInsets.only(left: 19.0),
                child: new Text(
                  APPLICATION_NAME,
                  textAlign: TextAlign.start,
                  style: TextStyle(
                    fontSize: 22.0,
                    color: Colors.white,
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(left: 30.0),
                child: IconButton(
                  icon: Icon(
                    Icons.help_outline,
                    size: 40.0,
                    color: Colors.white,
                  ),
                  onPressed: () {
                    Navigator.of(context).pushNamed(Help.tag);
                  },
                ),
              )
            ]),
          ),
        )));

Widget headingTextStyle(String name) => new Container(
    color: Colors.grey.withOpacity(0.2),
    width: 400.00,
    padding: EdgeInsets.fromLTRB(40.00, 20.00, 20.00, 20.00),
    child: new Text(name,
        style: new TextStyle(
          color: Colors.black54,
          fontSize: 20.0,
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

// ignore: non_constant_identifier_names
void showMessage(String message, Key, {double duration}) {
  Key.currentState.showSnackBar(new SnackBar(
      backgroundColor: Colors.lightGreen,
      //Todo: figure out the duration option and how it works
      content: new Text(
        message,
        textAlign: TextAlign.center,
      )));
}
