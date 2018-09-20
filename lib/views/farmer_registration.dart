import 'dart:async';

import 'package:flutter/material.dart';
import 'package:mauri_gap/models/farmer.dart';
import 'package:mauri_gap/utils/firebase.dart';
import './components/components.dart';
import 'package:mauri_gap/views/field_registration.dart';

class FarmerRegistration extends StatefulWidget {
  static String routeName = '/farmerRegistration';
  final String title;

  FarmerRegistration({Key key, this.title}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _FarmerRegistrationState();
}

class _FarmerRegistrationState extends State<FarmerRegistration> {
  final GlobalKey<FormState> _formKey = new GlobalKey<FormState>();
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();

  Farmer farmer = Farmer();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      appBar: appBar(context),
      body: Column(
        children: <Widget>[
          Expanded(
              child: Container(
            child: ListView(
              children: <Widget>[
                headingTextStyle(widget.title),
                Container(
                  padding: EdgeInsets.fromLTRB(32.0, 32.0, 32.0, 0.0),
                  child: form(),
                ),
                headingTextStyle('Field Registration'),
                Padding(
                  padding: padding(),
                  child: Row(
                    children: <Widget>[
                      Icon(
                        Icons.add_circle_outline,
                        color: Colors.black38,
                        size: 40.0,
                      ),
                      FlatButton(
                          onPressed: () {
                            Navigator.of(context)
                                .pushNamed(FieldRegistration.routeName);
                          },
                          child: Text(
                            "Add  field",
                            style: buttonFontStyle(),
                          )),
                    ],
                  ),
                ),
                Padding(
                  padding: padding(),
                  child: Row(
                    children: <Widget>[
                      Icon(
                        Icons.assignment,
                        color: Colors.black38,
                        size: 35.0,
                      ),
                      FlatButton(
                          onPressed: null,
                          child: Text(
                            "View registered fields",
                            style: buttonFontStyle(),
                          )),
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
      //Todo: Store in database and firebase
      _formKey.currentState.save();

      Future<String> refKey =
          Database.addFirebaseRecord(farmer: farmer, scaffoldKey: _scaffoldKey);

      refKey.catchError((onError){
        showMessage(
          'Data will be sent to the cloud another time. Caused by: $onError', _scaffoldKey,
          color: Colors.orange);
      });
      /*DBHelper db = DBHelper();
      db.addFarmer(farmer);
      Future<List> list = db.queryRecords('Farmer');
      print(list);
      */
    }
  }

  void _cancel() {
    _formKey.currentState.reset();
    Navigator.pop(context);
  }

  //Returns the form Widget
  form() {
    return Form(
      key: _formKey,
      child: Column(
        children: <Widget>[
          TextFormField(
            decoration: InputDecoration(labelText: 'Firstname:'),
            validator: (value) =>
                value.isEmpty ? "Please enter your firstname" : null,
            onSaved: (value) => farmer.firstName = value,
          ),
          TextFormField(
            decoration: InputDecoration(labelText: 'Surname:'),
            validator: (value) =>
                value.isEmpty ? "Please enter your surname" : null,
            onSaved: (value) => farmer.surName = value,
          ),
          TextFormField(
            decoration: InputDecoration(labelText: 'NID No:'),
            validator: (value) => value.isEmpty ? "Please enter a value" : null,
            onSaved: (value) => farmer.nidNo = value,
          ),
          TextFormField(
            decoration: InputDecoration(labelText: 'SFWF Reg No:'),
            validator: (value) => value.isEmpty ? "Please enter a value" : null,
            onSaved: (value) => farmer.sfwfRegNo = value,
          ),
          TextFormField(
            decoration: InputDecoration(labelText: 'Farm Unit/Company Name:'),
            validator: (value) => value.isEmpty ? "Please enter a value" : null,
            onSaved: (value) => farmer.farmUnit = value,
          ),
          Center(
            child: ButtonBar(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                FlatButton(
                    onPressed: _cancel,
                    child: Row(
                      children: <Widget>[
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Icon(Icons.cancel),
                        ),
                        Text(
                          'Cancel',
                          style: TextStyle(fontSize: 20.0),
                        )
                      ],
                    )),
                FlatButton(
                    onPressed: _save,
                    color: Colors.lightGreen,
                    child: Row(
                      children: <Widget>[
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Icon(Icons.check_circle_outline,
                              color: Colors.white),
                        ),
                        Text(
                          'Save',
                          style: TextStyle(fontSize: 22.0, color: Colors.white),
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

retry() {}
