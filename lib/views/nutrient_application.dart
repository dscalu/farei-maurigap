import 'package:flutter/material.dart';
import 'package:mauri_gap/models/nutrient.dart';
import './components/components.dart';

class NutrientApplication extends StatefulWidget {
  static String tag = 'nutrientApplication';
  final String title;

  NutrientApplication({Key key, this.title}) : super(key: key);

  @override
  State<StatefulWidget> createState() => new _NutrientApplicationState();
}

class _NutrientApplicationState extends State<NutrientApplication> {
  final GlobalKey<FormState> _formKey = new GlobalKey<FormState>();
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();

  Nutrient nutrient = new Nutrient();

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      key: _scaffoldKey,
      appBar: appBar(context),
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
                      new Icon(
                        Icons.assignment,
                        color: Colors.black38,
                        size: 35.0,
                      ),
                      new FlatButton(
                          onPressed: null,
                          child: new Text(
                            "View saved nutrient entries",
                            style: buttonFontStyle(),
                          ))
                    ],
                  ),
                )
              ],
            ),
          ))
        ],
      ),
    );
  }

  void _save() {
    if (_formKey.currentState.validate()) {
      showMessage("Processing ...", _scaffoldKey);
      //showMessage("Debugging purposes $nutrient.toString()", _scaffoldKey);
      //Todo: Store in database and firebase
      _formKey.currentState.save();
      showMessage("Field data has been successfully Saved", _scaffoldKey);
    }
  }

  void _cancel() {
    _formKey.currentState.reset();
    Navigator.pop(context);
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
            onSaved: (value) => nutrient.field = value,
          ),
          new TextFormField(
            decoration: new InputDecoration(labelText: 'Nutrient Type:'),
            validator: (value) =>
                value.isEmpty ? "Nutrient Type is required" : null,
                onSaved: (value) => nutrient.nutrientType = value,
          ),
          new TextFormField(
            decoration: new InputDecoration(labelText: 'Date Applied:'),
            validator: (value) =>
                value.isEmpty ? "Please enter your surname" : null,
          ),
          new TextFormField(
            decoration: new InputDecoration(labelText: 'Amount:'),
            validator: (value) => value.isEmpty ? "Please enter a value" : null,
            onSaved: (value) => nutrient.amount = int.parse(value),
          ),
          new TextFormField(
            decoration: new InputDecoration(labelText: 'Mode of Application:'),
            validator: (value) => value.isEmpty ? "Please enter a value" : null,
            onSaved: (value) => nutrient.applicationMode = value,
          ),
          new TextFormField(
            decoration: new InputDecoration(labelText: 'Crop:'),
            validator: (value) => value.isEmpty ? "Please enter a value" : null,
            onSaved: (value) => nutrient.crop = value,
          ),
          new TextFormField(
            decoration: new InputDecoration(labelText: 'Plot Area(m.sq):'),
            validator: (value) => value.isEmpty ? "Please enter a value" : null,
            onSaved: (value) => nutrient.area = int.parse(value),
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
                    color: Colors.lightGreen,
                    child: new Row(
                      children: <Widget>[
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: new Icon(Icons.check_circle_outline,
                              color: Colors.white),
                        ),
                        new Text(
                          'Save',
                          style: TextStyle(fontSize: 22.0, color: Colors.white),
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
