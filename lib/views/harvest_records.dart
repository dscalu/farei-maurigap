import 'package:flutter/material.dart';
import './components/components.dart';
import '../models/harvest.dart';

import 'dart:async';
import 'package:intl/intl.dart';

class HarvestRecords extends StatefulWidget {
  static final String tag = 'harvestRecords';
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
        appBar: appBar(context),
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
                Padding(
                  padding: padding(),
                  child: new Row(children: <Widget>[
                   new Icon(Icons.assignment,
                        color: Colors.black45,size: 35.0,),

                  new FlatButton(
                      onPressed: _listEntries(),
                      child: new Text(
                        "View Saved Harvest History",
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

    Harvest harvest;
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
                      setState(() {});
                    }),
              ),
            ],
          ),
          new TextFormField(
            decoration: new InputDecoration(labelText: 'Produce Harvested:'),
            validator: (value) => value.isEmpty ? "Please enter a value" : null,
            onSaved: (value) => harvest.produce = value
          ),
          date(hintText: "Date Harvested",labelText: "Date Harvested" ),
          new TextFormField(
              decoration: new InputDecoration(labelText: 'Area(m sq.):'),
              validator: (value) =>
                  value.isEmpty ? "Please enter a value" : null,
              onSaved: (value) =>
                  harvest.area = int.parse(value),
            keyboardType: TextInputType.number,
          ),
          new TextFormField(
              decoration: new InputDecoration(labelText: 'Qty/Units:'),
              validator: (value) =>
                  value.isEmpty ? "Please enter a value" : null,
              onSaved: (value) =>
                  harvest.units  = int.parse(value),
            keyboardType: TextInputType.number,
              ),
          new TextFormField(
              decoration:
                  new InputDecoration(labelText: 'Name of person harvesting'),
              validator: (value) =>
                  value.isEmpty ? "Please enter a value" : null,
              onSaved: (value) =>
                  harvest.harvester = value,
            keyboardType: TextInputType.text,
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

  //build date
  date({String hintText, String labelText}){
    final TextEditingController _controller = new TextEditingController();

    DateTime convertToDate(String input) {
      try {
        var d = new DateFormat.yMd().parseStrict(input);
        return d;
      } catch (e) {
        return null;
      }
    }

    Future _chooseDate(BuildContext context, String initialDateString) async {
      var now = new DateTime.now();
      var initialDate = convertToDate(initialDateString) ?? now;
      initialDate = (initialDate.year >= 1900 && initialDate.isBefore(now)
          ? initialDate
          : now);

      var result = await showDatePicker(
          context: context,
          initialDate: initialDate,
          firstDate: new DateTime(1900),
          lastDate: new DateTime.now());

      if (result == null) return;
      setState(() {
        _controller.text = new DateFormat.yMd().format(result);
      });
    }

    return new Row(children: <Widget>[
      new Expanded(
          child: new TextFormField(
            decoration: new InputDecoration(
              icon: const Icon(Icons.calendar_today),
              hintText: hintText,
              labelText: labelText,
            ),
            controller: _controller,
            keyboardType: TextInputType.datetime,
          )
      )
    ]);
  }
}
