import 'package:flutter/material.dart';
import './components/components.dart';
import '../models/planting.dart';

class PlantingRecords extends StatefulWidget {
  static final String tag = 'plantingRecords';
  final String title;

  PlantingRecords({Key key, this.title}) : super(key: key);

  @override
  State<StatefulWidget> createState() => new _PlantingRecordsState();
}

class _PlantingRecordsState extends State<PlantingRecords> {
  final _formKey = new GlobalKey<FormState>();
  PlantingRecords plantingRecord;

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
        appBar: appBar(),
        body: new Column(children: <Widget>[
          new Expanded(
            child: new Container(
                child: new ListView(
                  children: <Widget>[
                    headingTextStyle('Planting Records'),
                    new Container(
                      padding: EdgeInsets.fromLTRB(32.0, 32.0, 32.0, 0.0),
                      child: form(),
                    ),
                    headingTextStyle('Planting Records'),
                    Padding(
                      padding: padding(),
                      child: new Row(children: <Widget>[
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: new Icon(Icons.assignment,
                              color: Colors.black45,size: 35.0,),
                        ),
                        new FlatButton(
                            onPressed: _listEntries(),
                            child: new Text(
                              "View saved planting entries",
                              style: buttonFontStyle(),
                            ))
                      ]),
                    ),
                  ],
                )),
          )
        ]));
  }

  _listEntries() {}

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
    String selected;
    PlantingRecord plantingRecord;
    List<DropdownMenuItem<String>> list = [];
    list.add(new DropdownMenuItem(
        child: new Text("Field from database"), value: "data"));
    list.add(new DropdownMenuItem(
        child: new Text("Field from database"), value: "data"));

    return new Form(
      key: _formKey,
      child: new Column(
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Expanded(
                child: new DropdownButton(
                    items: list,
                    value: selected,
                    hint: new Text("Select Field: "),
                    onChanged: (value) {
                      selected = value;
                      setState(() {plantingRecord.field = value;});
                    }),
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Expanded(
                child: new DropdownButton(
                    items: list,
                    value: selected,
                    hint: new Text("Production System: "),
                    onChanged: (value) {
                      selected = value;
                      setState(() {
                        plantingRecord.system = value;});
                    }),
              ),
            ],
          ),
          new TextFormField(
              decoration: new InputDecoration(labelText: 'Date Planted'),
              validator: (value) =>
              value.isEmpty ? "Please enter a value" : null,
              onSaved: (value) =>
              plantingRecord.datePlanted //Todo parse the value,
          ),
          new TextFormField(
              decoration: new InputDecoration(labelText: 'Crop:'),
              validator: (value) =>
              value.isEmpty ? "Please enter a value" : null,
              onSaved: (value) =>
              plantingRecord.crop = value
          ),
          new TextFormField(
              decoration: new InputDecoration(labelText: 'Variety:'),
              validator: (value) =>
              value.isEmpty ? "Please enter a value" : null,
              onSaved: (value) =>
              plantingRecord.variety = int.parse(value),
            keyboardType: TextInputType.number,
          ),
          new TextFormField(
              decoration: new InputDecoration(labelText: 'Area(m sq.):'),
              validator: (value) =>
              value.isEmpty ? "Please enter a value" : null,
              onSaved: (value) =>
              plantingRecord.area  = int.parse(value),
            keyboardType: TextInputType.number,
          ),
          new Center(
            child: new ButtonBar(
              alignment: MainAxisAlignment.spaceBetween,
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
                          style: new TextStyle(fontSize: 18.0),
                        )
                      ],
                    )),
                FlatButton(
                    onPressed: _save,
                    color: Colors.lightGreen,
                    child: new Row(
                      children: <Widget>[
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: new Icon(Icons.check_circle_outline,color: Colors.white,),
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
