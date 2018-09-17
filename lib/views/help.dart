import 'package:flutter/material.dart';
import 'package:mauri_gap/views/components/components.dart';

class Help extends StatefulWidget {
  static final String tag = 'help';
  final String title;

  Help({Key key,this.title}) : super(key: key);

  @override
  State<StatefulWidget> createState() => new _HelpState();
}

class _HelpState extends State<Help> {

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: appBar(),
    );
  }
}
