import '../models/farmer.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path_provider/path_provider.dart';
import 'dart:async';
import 'dart:io' as io;

class DBHelper {
  static final DBHelper _instance = DBHelper.internal();
  DBHelper.internal();
  factory DBHelper() => _instance;

  static Database _db;

  Future<Database> get db async {
    if (_db != null) return _db;
    _db = await initDB();
    return _db;
  }

  initDB() async {
    io.Directory documentsDirectory = await getApplicationDocumentsDirectory();
    String path = join(documentsDirectory.path, "MauriGap.db");
    var newDb = await openDatabase(path, version: 1, onCreate: _onCreate);
    return newDb;
  }

  void _onCreate(Database db, int version) async {
    // SQL script for creating the Farmer table
    await db
        .execute('CREATE TABLE Farmer(farmer_fname TEXT, farmer_surname TEXT, '
            'farmer_nid TEXT PRIMARY KEY, farmer_sfwf TEXT, '
            'farmer_farmunit TEXT)');
    print('1: Farmer table created!');

    // SQL script for creating the Field table
    await db.execute('CREATE TABLE Field(field_num TEXT PRIMARY KEY, '
        'field_totarea REAL, field_irrigationsrc TEXT, field_barrier TEXT, '
        'field_addr TEXT, farmer_nid TEXT REFERENCES Farmer (farmer_nid))');
    print('2: Field Table created');

    // SQL script for creating the Supplier table
    await db.execute('CREATE TABLE Supplier(supplier_id TEXT PRIMARY KEY, '
        'supplier_name TEXT, supplier_addr TEXT)');
    print('3: Supplier Table created');

    // SQL script for creating the Stock table
    await db.execute('CREATE TABLE Stock(stock_input TEXT, farmer_nid TEXT '
        'REFERENCES Farmer (farmer_nid), supplier_id TEXT REFERENCES '
        'Supplier (supplier_id), stock_qty REAL, stock_dtreceived INTEGER, '
        'stock_storageaddr TEXT)');
    print('4: Stock teble created');

    await db.execute('CREATE TABLE Planting(plant_field TEXT REFERENCES field'
        ' (field_num), plant_prod TEXT, plant_dtplanted INTEGER, plant_crop '
        'TEXT, plant_variety TEXT, plant_area REAL)');
    print('5: Planting Table created');

    await db.execute('CREATE TABLE Nutrient(nutri_field TEXT REFERENCES field'
        ' (field_num), nutri_type TEXT, nutri_dtapplied INTEGER, nutri_amt '
        'REAL, nutri_unit TEXT DEFAULT kg, nutri_mode TEXT, nutri_crop '
        'TEXT, nutri_area REAL)');
    print('6: Nutrient table created!');

    await db.execute('CREATE TABLE Harvest (harv_field TEXT REFERENCES '
        'field (field_num), harv_produce TEXT, harv_dt INTEGER, harv_area '
        'REAL, harv_qty REAL, harv_person TEXT)');
    print('7: Harvest table created');
  }

  // Farmer insertion
  void addFarmer(Farmer farmer) async {
    var dbClient = await db;
    await dbClient.transaction((txn) async {
      return await txn.rawInsert('INSERT INTO Farmer(farmer_fname, '
          'farmer_surname, farmer_nid, farmer_sfwf, farmer_farmunit) VALUES'
          '(${farmer.firstName}, ${farmer.surName}, ${farmer.nidNo}, '
          '${farmer.sfwfRegNo}, ${farmer.farmUnit})');
    });
  }
}
