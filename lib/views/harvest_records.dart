import 'package:flutter/material.dart';
import './components/components.dart';
import '../models/harvest.dart';
class HarvestRecords extends StatefulWidget {
  static String tag = 'harvestRecords';
  final String title;

  HarvestRecords({Key key, this.title}) : super(key: key);

  @override
  State<StatefulWidget> createState() => new _HarvestRecordsState();
}

class _HarvestRecordsState extends State<HarvestRecords> {
  final _formKey = new GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
        appBar: appBar(),
        body: new Column(children: <Widget>[
          new Expanded(
            child: new Container(
                child: new ListView(
              children: <Widget>[
                headingTextStyle('Harvest Records'),
                new Container(
                  padding: EdgeInsets.fromLTRB(32.0, 32.0, 32.0, 0.0),
                  child: form(),
                ),
                headingTextStyle('Harvest Records'),
                new Row(children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: new Icon(Icons.insert_drive_file,
                        color: Colors.black45),
                  ),
                  new FlatButton(
                      onPressed: _listEntries(),
                      child: new Text(
                        "View Saved Harvest History",
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

    Harvest harvestRecord;
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
          new TextFormField(
            decoration: new InputDecoration(labelText: 'Produce Harvested:'),
            validator: (value) => value.isEmpty ? "Please enter a value" : null,
            onSaved: (value) => harvestRecord.produce = value
          ),
          new TextFormField(
              decoration: new InputDecoration(labelText: 'Date Harvested'),
              validator: (value) =>
                  value.isEmpty ? "Please enter a value" : null,
              onSaved: (value) =>
                  harvestRecord.harvestDate = value as DateTime //Todo parse the value,
              ),
          new TextFormField(
              decoration: new InputDecoration(labelText: 'Area(m sq.):'),
              validator: (value) =>
                  value.isEmpty ? "Please enter a value" : null,
              onSaved: (value) =>
                  harvestRecord.area = value as num //Todo parse the value,
              ),
          new TextFormField(
              decoration: new InputDecoration(labelText: 'Qty/Units:'),
              validator: (value) =>
                  value.isEmpty ? "Please enter a value" : null,
              onSaved: (value) =>
                  harvestRecord.units = value as num //Todo parse the value,
              ),
          new TextFormField(
              decoration:
                  new InputDecoration(labelText: 'Name of person harvesting'),
              validator: (value) =>
                  value.isEmpty ? "Please enter a value" : null,
              onSaved: (value) =>
                  harvestRecord.harvester = value //Todo parse the value,
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
