import 'package:flutter/material.dart';
import 'package:mauri_gap/component/App_Bar.dart';
import 'package:mauri_gap/component/style_constants.dart';

//TODO Angela's

class NutrientApplication extends StatefulWidget {
  static String tag = 'nutrientApplication';
  String title;

  NutrientApplication({Key key,this.title}) : super(key: key);
  @override
  State<StatefulWidget> createState() => new _NutrientApplicationState();
}

class _NutrientApplicationState extends State<NutrientApplication>{
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new Scaffold (
      appBar: App_Bar('MauriGap'),
      body: new Column(
        children: <Widget>[
          new Expanded(
              child: new Container(
                child: new ListView(
                  children: <Widget>[
                    headingTextStyle(widget.title),
                    new Container(
                      padding: EdgeInsets.fromLTRB(32.0, 32.0, 32.0, 0.0),
                      child: form(),
                    ),
                    headingTextStyle('Nutrient Appl. History'),
                    Padding(
                      padding: padding(),
                      child: new Row(
                        children: <Widget>[
                          new Icon(Icons.insert_drive_file, color: Colors.black38),
                          new FlatButton(
                              onPressed: null,
                              child: new Text(
                                  "View saved nutrient entries", style: buttonFontStyle(),
                              ))
                        ],
                      ),
                    )
                  ],
                ),
              )
          )
        ],
      ),
    );
  }

  void _save() {
    if (_formKey.currentState.validate()) {
      _formKey.currentState.save();
    }
  }

  void _cancel() {
    _formKey.currentState.reset();
  }

  //Returns the form Widget
  form() {
    return new Form(
      key: _formKey,
      child: new Column(
        children: <Widget>[
          new TextFormField(
            decoration: new InputDecoration(labelText: 'Select Field:'),
            validator: (value) => value.isEmpty ? "Please enter a value" : null,
          ),
          new TextFormField(
            decoration: new InputDecoration(labelText: 'Nutrient Type:'),
            validator: (value) => value.isEmpty ? "Please enter your firstname" : null,
          ),
          new TextFormField(
            decoration: new InputDecoration(labelText: 'Date Applied:'),
            validator: (value) =>
            value.isEmpty ? "Please enter your surname" : null,
          ),
          new TextFormField(
            decoration: new InputDecoration(labelText: 'Amount:'),
            validator: (value) => value.isEmpty ? "Please enter a value" : null,
          ),
          new TextFormField(
            decoration: new InputDecoration(labelText: 'Mode of Application:'),
            validator: (value) => value.isEmpty ? "Please enter a value" : null,
          ),
          new TextFormField(
            decoration: new InputDecoration(labelText: 'Crop:'),
            validator: (value) => value.isEmpty ? "Please enter a value" : null,
          ),
          new TextFormField(
            decoration: new InputDecoration(labelText: 'Plot Area(m.sq):'),
            validator: (value) => value.isEmpty ? "Please enter a value" : null,
          ),
          new Center(
            child: new ButtonBar(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                FlatButton(
                    onPressed: _cancel,
                    child: new Row(
                      children: <Widget>[
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: new Icon(Icons.cancel),
                        ),
                        new Text(
                          'Cancel',
                          style: new TextStyle(fontSize: 20.0),
                        )
                      ],
                    )),
                RaisedButton(
                    onPressed: _save,
                    color: Colors.green,
                    child: new Row(
                      children: <Widget>[
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: new Icon(Icons.check_circle_outline,
                              color: Colors.white),
                        ),
                        new Text(
                          'Save',
//
                        )
                      ],
                    ))
              ],
            ),
          ),
        ],
      ),
    );
  }
}

