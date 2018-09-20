import 'dart:async';

import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:mauri_gap/models/farmer.dart';
import 'package:mauri_gap/models/field.dart';
import 'package:mauri_gap/models/harvest.dart';
import 'package:mauri_gap/models/nutrient.dart';
import 'package:mauri_gap/models/planting.dart';
import 'package:mauri_gap/models/stock.dart';
import 'package:mauri_gap/utils/application_constants.dart';
import 'package:mauri_gap/views/components/components.dart';
import 'package:mauri_gap/models/help.dart';

class Database {
  static Future<String> addFirebaseRecord(
      {Farmer farmer,
      Field field,
      Harvest harvest,
      HelpRecord help,
      Nutrient nutrient,
      PlantingRecord plantingRecord,
      Stock stock,
      scaffoldKey}) async {
    var record;

    String tableName, recordKey;
    DatabaseReference reference = FirebaseDatabase.instance.reference();

    String setRecord() {
      showMessage("Processing ...", scaffoldKey);
      reference.reference().child(tableName).child(recordKey).set(record);
      showMessage("Data Saved Successfully", scaffoldKey);
      return reference.key;
    }

    if (farmer != null) {
      tableName = FARMER_TABLE_NAME;
      recordKey = farmer.sfwfRegNo;
      record = farmer.toJSON();
      return setRecord();
    }

    if (field != null) {
      tableName = FIELD_TABLE_NAME;
      recordKey = field.fieldNumber;
      record = field.toJSON();
      setRecord();
    }

    if (harvest != null) {
      tableName = HARVEST_TABLE_NAME;
      recordKey = harvest.harvester;
      record = harvest.toJSON();
      setRecord();
    }

    if (help != null) {
      tableName = HELP_TABLE_NAME;
      recordKey = help.title;
      record = help.toJSON();
      setRecord();
    }

    if (nutrient != null) {
      tableName = NUTRIENT_TABLE_NAME;
      recordKey = nutrient.field;
      record = field.toJSON();
      setRecord();
    }

    if (plantingRecord != null) {
      tableName = PLANTING_TABLE_NAME;
      recordKey = plantingRecord.field;
      record = plantingRecord.toJSON();
      setRecord();
    }
    if (stock != null) {
      tableName = STOCK_TABLE_NAME;
      recordKey = stock.supplierName;
      record = field.toJSON();
      setRecord();
    }
  }

  static Future<Query> queryFarmers(Farmer farmer) async {
    return FirebaseDatabase.instance
        .reference()
        .child('key')
        .orderByChild(farmer.sfwfRegNo);
  }
}
