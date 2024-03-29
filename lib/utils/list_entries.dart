import 'package:flutter/material.dart';
import 'package:mauri_gap/models/field.dart';

class ListFieldEntries extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return new FieldEntriesState();
  }
}

class FieldEntriesState extends State<ListFieldEntries> {
  final List<Field> _entries = <Field>[];
  final TextStyle _biggerFont = const TextStyle(fontSize: 18.0);

  Widget _buildEntries() {
    return new ListView.builder(
        padding: const EdgeInsets.all(16.0),
        itemBuilder: (BuildContext _context, int i) {
          if (i.isOdd) {
            return new Divider();
          }
          final int index = i ~/ 2;
          if (index >= _entries.length) {
            _entries.addAll(database().take(10));
          }
          return _buildRow(_entries[index]);
        });
  }

  Widget _buildRow(Field entry) {
    return new ListTile(
      title: new Text(
        entry.fieldNumber,
        style: _biggerFont,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return new Container(
        color: Colors.grey.withOpacity(0.2),
        width: 400.00,
        padding: EdgeInsets.all(20.00),
        child: new Column(
          children: <Widget>[
            new Text(
              "Field Entries",
              style: new TextStyle(color: Colors.black54, fontSize: 22.0),
            ),
            _buildEntries(),
          ],
        ));
  }

  database() {}
}
