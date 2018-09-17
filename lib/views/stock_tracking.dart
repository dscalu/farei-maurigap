import 'package:flutter/material.dart';
import 'package:mauri_gap/models/stock.dart';
import './components/components.dart';

class StockTracking extends StatefulWidget {
  static String tag = 'stockTracking';

  @override
  _StockTracking createState() => _StockTracking();
}

class _StockTracking extends State<StockTracking> {
  final GlobalKey<FormState> _formKey = new GlobalKey<FormState>();
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();

  Stock stock;
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
        appBar: appBar(),
        body: new Column(children: <Widget>[
          new Expanded(
            child: new Container(
                child: new ListView(
                  children: <Widget>[
                    headingTextStyle('Stock Tracking'),
                    new Container(
                      padding: EdgeInsets.fromLTRB(32.0, 32.0, 32.0, 0.0),
                      child: form(),
                    ),
                    headingTextStyle('Stock Entries'),
                    Padding(
                      padding: padding(),
                      child: new Row(children: <Widget>[
                        new Icon(Icons.assignment, color: Colors.black38,size: 35.0,),
                        new FlatButton(
                            onPressed: _listEntries(),
                            child: new Text(
                              "View Stock Entries",
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
      showMessage(stock.toString());
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
    return new Form(
      key: _formKey,
      child: new Column(
        children: <Widget>[
          TextFormField(
            decoration: InputDecoration(
              hintText: 'Supllier Name',
              labelText: 'Supplier\'s Name',
            ),
            validator: (val) =>
            val.isEmpty ? 'Supplier Name is required' : null,
            onSaved: (val) => {},
          ),
          TextFormField(
            decoration: InputDecoration(
              hintText: 'Supllier Address',
              labelText: 'Supplier\'s Addr.',
            ),
            validator: (val) =>
            val.isEmpty ? 'Supplier address is required' : null,
            onSaved: (val) => {},
          ),
          TextFormField(
            decoration: InputDecoration(
              hintText: 'quantity purchased',
              labelText: 'Quantity Purchased',
            ),
            validator: (val) => val.isEmpty
                ? 'Quantity purchased is '
                'required'
                : null,
            onSaved: (val) => {},
          ),
          TextFormField(
            decoration: InputDecoration(
              hintText: 'Date received',
              labelText: 'Date Received',
            ),
            keyboardType: TextInputType.datetime,
            validator: (val) =>
            val.isEmpty ? 'Supplier Name is required' : null,
            onSaved: (val) => {},
          ),
          TextFormField(
            decoration: InputDecoration(
              hintText: 'storage addr.',
              labelText: 'Storage Addr.',
            ),
            keyboardType: TextInputType.datetime,
            validator: (val) =>
            val.isEmpty ? 'Storage address is required' : null,
            onSaved: (val) => {},
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
                FlatButton(
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
