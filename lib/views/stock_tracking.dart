import 'package:flutter/material.dart';
import './components/components.dart';

class StockTracking extends StatefulWidget {
  static String tag = 'stockTracking';
  @override
  _StockTracking createState() => _StockTracking();
}

class _StockTracking extends State<StockTracking> {
  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: appBar(),
        body: Container(
          child: ListView(
            children: <Widget>[
              headingTextStyle('Stock Tracking'),
              Form(
                key: _formKey,
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 24.0),
                  child: ListView(
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
                    ],
                  ),
                ),
              ),
              headingTextStyle("Stock Records"),
              viewTile('View saved stock entries'),
            ],
          ),
        ));
  }
}
