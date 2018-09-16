import 'package:flutter/material.dart';
import './components/components.dart';
import 'package:mauri_gap/views/field_registration.dart';

class FarmerRegistration extends StatefulWidget {
  static String tag = 'farmerRegistration';
  final String title;

  FarmerRegistration({Key key,this.title}) : super(key: key);

  @override
  State<StatefulWidget> createState() =>  _FarmerRegistrationState();
}

class _FarmerRegistrationState extends State<FarmerRegistration>{
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return  Scaffold (
     appBar: appBar(),
      body:  Column(
        children: <Widget>[
           Expanded(
              child:  Container(
                child:  ListView(
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
                           Icon(Icons.add_circle_outline , color: Colors.black38,size: 40.0,),
                           FlatButton(
                              onPressed: () {Navigator.of(context).pushNamed(FieldRegistration.tag);} ,
                              child:  Text(
                              "Add  field",style: buttonFontStyle(),
                              )),
                        ],
                    ),
                     ),
                    Padding(
                      padding: padding(),
                      child: Row(
                        children: <Widget>[
                           Icon(Icons.insert_drive_file, color: Colors.black38,size: 40.0,),
                           FlatButton(
                              onPressed: null,
                              child:  Text(
                                  "View registered fields",style: buttonFontStyle(),
                              )),
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
    return  Form(
      key: _formKey,
      child:  Column(
        children: <Widget>[
           TextFormField(
            decoration:  InputDecoration(labelText: 'Firstname:'),
            validator: (value) => value.isEmpty ? "Please enter your firstname" : null,
          ),
           TextFormField(
              decoration:  InputDecoration(labelText: 'Surname:'),
              validator: (value) =>
              value.isEmpty ? "Please enter your surname" : null,
          ),
           TextFormField(
            decoration:  InputDecoration(labelText: 'NID No:'),
            validator: (value) => value.isEmpty ? "Please enter a value" : null,
          ),
           TextFormField(
            decoration:  InputDecoration(labelText: 'SFWF Reg No:'),
            validator: (value) => value.isEmpty ? "Please enter a value" : null,
          ),
           TextFormField(
            decoration:  InputDecoration(labelText: 'Farm Unit/Company Name:'),
            validator: (value) => value.isEmpty ? "Please enter a value" : null,
          ),
           Center(
            child:  ButtonBar(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                FlatButton(
                    onPressed: _cancel,
                    child:  Row(
                      children: <Widget>[
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child:  Icon(Icons.cancel),
                        ),
                         Text(
                          'Cancel',
                          style:  TextStyle(fontSize: 20.0),
                        )
                      ],
                    )),
                RaisedButton(
                    onPressed: _save,
                    color: Colors.green,
                    child:  Row(
                      children: <Widget>[
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child:  Icon(Icons.check_circle_outline,
                              color: Colors.white),
                        ),
                         Text(
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

