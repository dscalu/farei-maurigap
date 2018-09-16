import 'package:flutter/material.dart';
import 'package:mauri_gap/component/App_Bar.dart';
import 'package:mauri_gap/component/style_constants.dart';
import 'package:mauri_gap/models/harvest_record_entries.dart';

class PlantingRecords extends StatefulWidget {
  static String tag = 'plantingRecords';
  final String title;

  PlantingRecords({Key key, this.title}) : super(key: key);

  @override
  State<StatefulWidget> createState() => new _PlantingRecordsState();
}

class _PlantingRecordsState extends State<PlantingRecords> {
  final _formKey = new GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
        appBar: App_Bar(widget.title),
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
                    new Row(children: <Widget>[
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: new Icon(Icons.insert_drive_file,
                            color: Colors.black45),
                      ),
                      new FlatButton(
                          onPressed: _listEntries(),
                          child: new Text(
                            "View saved planting entries",
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
    }
  }

  void _cancel() {
    _formKey.currentState.reset();
  }

  //Returns the form Widget
  form() {
    String selected;

    HarvestRecord harvestRecord;
    List<DropdownMenuItem<String>> list = [];
    list.add(new DropdownMenuItem(
        child: new Text("Field from database"), value: "data"));
    list.add(new DropdownMenuItem(
        child: new Text("Field from database"), value: "data"));

    return new Form(
      autovalidate: true,
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
                      setState(() {});
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
                      setState(() {});
                    }),
              ),
            ],
          ),
          new TextFormField(
              decoration: new InputDecoration(labelText: 'Date Planted'),
              validator: (value) =>
              value.isEmpty ? "Please enter a value" : null,
              onSaved: (value) =>
              harvestRecord.harvest_date //Todo parse the value,
          ),
          new TextFormField(
              decoration: new InputDecoration(labelText: 'Crop:'),
              validator: (value) =>
              value.isEmpty ? "Please enter a value" : null,
              onSaved: (value) =>
              harvestRecord.harvest_quantity //Todo parse the value,
          ),
          new TextFormField(
              decoration: new InputDecoration(labelText: 'Variety:'),
              validator: (value) =>
              value.isEmpty ? "Please enter a value" : null,
              onSaved: (value) =>
              harvestRecord.harvest_quantity //Todo parse the value,
          ),
          new TextFormField(
              decoration: new InputDecoration(labelText: 'Area(m sq.):'),
              validator: (value) =>
              value.isEmpty ? "Please enter a value" : null,
              onSaved: (value) =>
              harvestRecord.harvest_area //Todo parse the value,
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
                RaisedButton(
                    onPressed: _save,
                    color: Colors.green,
                    child: new Row(
                      children: <Widget>[
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: new Icon(Icons.check_circle_outline),
                        ),
                        new Text(
                          'Save',
                          style: textStyle(),
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
