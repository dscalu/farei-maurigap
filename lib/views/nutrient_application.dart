import 'package:flutter/material.dart';
import './components/components.dart';

class NutrientApplication extends StatefulWidget {
  static String tag = 'nutrientApplication';
  final String title;

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
      appBar: appBar(),
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
                          new Icon(Icons.assignment, color: Colors.black38,size: 35.0,),
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

    List<DropdownMenuItem<String>> units = [];
    units.add(DropdownMenuItem(
        child: new Text('kg'), value: 'Value 1'));
    units.add(DropdownMenuItem(
        child: new Text('ml'), value: 'Value 2'));

    List<DropdownMenuItem<String>> list = [];
    list.add(DropdownMenuItem(
      child: new Text('Option 1'), value: 'Value 1'));
    list.add(DropdownMenuItem(
        child: new Text('Option 2'), value: 'Value 2'));
    list.add(DropdownMenuItem(
        child: new Text('Option 3'), value: 'Value 3'));

    String selectedUnits;
    String selectedOption;


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
                    value: selectedOption,
                    hint: new Text("Select Field: "),
                    onChanged: (value) {
                      selectedOption = value;
                      setState(() {});
                    }),
              ),
            ],
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
         
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Expanded(
                child: new TextFormField(
                  decoration: new InputDecoration(labelText: 'Amount:'),
                  validator: (value) => value.isEmpty ? "Please enter a value" : null,
                ),
              ),
              Expanded(
                child: new DropdownButton(
                    items: units,
                    value: selectedUnits,
                    hint: new Text("Units: "),
                    onChanged: (value) {
                      selectedUnits = value;
                      setState(() {});
                    }),
              ),
            ],
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
                          style: TextStyle(
                              fontSize: 22.0,
                              color: Colors.white
                          ),
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

