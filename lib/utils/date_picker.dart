
import 'dart:async';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

String getDateNow() {
  var now = new DateTime.now();
  var formatter = new DateFormat('yyyy-MM-dd HH:mm:ss');
  return formatter.format(now);
}

