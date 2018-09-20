import 'package:flutter/material.dart';
import 'package:mauri_gap/models/help.dart';
import 'package:mauri_gap/views/components/components.dart';

class Help extends StatefulWidget {
  static final String routeName = '/help';
  final String title;

  Help({Key key, this.title}) : super(key: key);

  @override
  State<StatefulWidget> createState() => new _HelpState();
}

class _HelpState extends State<Help> {
  final GlobalKey<FormState> _formKey = new GlobalKey<FormState>();
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();

  final List<HelpRecord> _entries = List<HelpRecord>();
  final TextStyle _biggerFont = const TextStyle(fontSize: 18.0);

  /*Widget _buildEntries() {
    return new ListView.builder(
        padding: const EdgeInsets.all(16.0),
        itemBuilder: (BuildContext context, int i) {
          if (i.isOdd) {
            return new Divider();
          }
            _entries.addAll(database().take(10));
          return _buildRow(_entries[i]);
        });
  }*/

  Widget _buildRow(name) {
    return ListTile(
      contentPadding: EdgeInsets.only(left: 20.0, right: 20.0),
      leading: CircleAvatar(
        backgroundColor: Colors.lightGreen,
        child: Icon(
          Icons.live_help,
          color: Colors.white,
          size: 25.0,
        ),
        radius: 28.0,
      ),
      title: Padding(
        padding: const EdgeInsets.only(left: 8.0),
        child: Text(
          name,
          style: TextStyle(
            color: Colors.black54,
            fontSize: 18.0,
            height: 2.4,
          ),
        ),
      ),
      enabled: true,
      onTap: () {},
      subtitle: Text(
        '',
        style: TextStyle(
          color: Colors.black54,
          fontSize: 22.0,
          height: 0.8,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
        key: _scaffoldKey,
        appBar: appBar(context),
        body: new Container(
          child: new ListView(children: <Widget>[
            headingTextStyle("Help and FAQ"),
            _buildRow("How to create a Farmer Account"),
            _buildRow("How to add a Field entry"),
            _buildRow("Do I need a field to register?"),
            _buildRow("Who owns this app"),
            _buildRow("What is SFWF"),
            _buildRow("How to send feedback to Farei"),
            _buildRow("Where does the data go? "),
          ]),
        ));
  }
}
