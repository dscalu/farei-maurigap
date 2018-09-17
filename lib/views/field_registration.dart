import 'package:flutter/material.dart';
import './components/components.dart';
import 'package:mauri_gap/models/field.dart';

class FieldRegistration extends StatefulWidget {
  static final String tag = 'fieldRegistration';
  final String title;

  FieldRegistration({Key key, this.title}) : super(key: key);

  @override
  State<StatefulWidget> createState() => new _FieldRegistrationState();
}

class _FieldRegistrationState extends State<FieldRegistration> {
  final GlobalKey<FormState> _formKey = new GlobalKey<FormState>();
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();
  Field field;

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
        appBar: appBar(),
        body: new Column(children: <Widget>[
          new Expanded(
            child: new Container(
                child: new ListView(
              children: <Widget>[
                headingTextStyle('Field Registration'),
                new Container(
                  padding: EdgeInsets.fromLTRB(32.0, 32.0, 32.0, 0.0),
                  child: form(),
                ),
                headingTextStyle('Field Entries'),
                new Row(children: <Widget>[
                  new Icon(Icons.assignment, color: Colors.black38,size: 35.0,),
                  new FlatButton(
                      onPressed: _listEntries(),
                      child: new Text(
                        "View Field Entries",
                        style: new TextStyle(fontSize: 20.0),
                      ))
                ]),
              ],
            )),
          )
        ]));
  }

  _listEntries() {}

  void _save() {
    if (_formKey.currentState.validate()) {
      _formKey.currentState.save();
      showMessage(field.toString());
    }
  }

  void _cancel() {
    _formKey.currentState.reset();
  }

  void showMessage(String message, [MaterialColor color = Colors.red]) {
    _scaffoldKey.currentState.showSnackBar(
        new SnackBar(backgroundColor: color, content: new Text(message)));
  }

  //Returns the form Widget
  form() {
    Field field;
    return new Form(
      key: _formKey,
      child: new Column(
        children: <Widget>[
          new TextFormField(
            decoration: new InputDecoration(labelText: 'Field No:'),
            validator: (value) => value.isEmpty ? "Please enter a value" : null,
            onSaved: (value) => field.fieldNumber = value,
          ),
          new TextFormField(
            decoration: new InputDecoration(labelText: 'Total Area (Ha):'),
            validator: (value) => value.isEmpty ? "Please enter a value" : null,
            onSaved: (value) => field.fieldTotalArea = int.parse(value),
            keyboardType: TextInputType.number,
          ),
          new TextFormField(
            decoration: new InputDecoration(labelText: 'Irrigation Source'),
            validator: (value) => value.isEmpty ? "Please enter a value" : null,
            onSaved: (value) => field.fieldIrrigationSource = value,
            keyboardType: TextInputType.text,
          ),
          new TextFormField(
            decoration: new InputDecoration(labelText: 'Physical Barrier'),
            validator: (value) => value.isEmpty ? "Please enter a value" : null,
            onSaved: (value) => field.fieldPhysicalBarrier = value,
          ),
          new TextFormField(
            decoration: new InputDecoration(labelText: 'Field Address'),
            validator: (value) => value.isEmpty ? "Please enter a value" : null,
            onSaved: (value) => field.fieldAddress = value,
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
                          style: TextStyle(
                              fontSize: 22.0,
                              color: Colors.white
                          ),
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
