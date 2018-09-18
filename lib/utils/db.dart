import '../models/field.dart';
import '../models/harvest.dart';
import '../models/planting.dart';
import '../models/nutrient.dart';
import '../models/stock.dart';
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
    await db.execute(
        'CREATE TABLE Supplier(supplier_id TEXT PRIMARY KEY AUTOINCREMENT, '
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

  // INSERTIONS
  void addFarmer(Farmer farmer) async {
    var dbClient = await db;
    await dbClient.transaction((txn) async {
      int i = await txn.rawInsert('INSERT INTO Farmer(farmer_fname, '
          'farmer_surname, farmer_nid, farmer_sfwf, farmer_farmunit) VALUES'
          '(${farmer.firstName}, ${farmer.surName}, ${farmer.nidNo}, '
          '${farmer.sfwfRegNo}, ${farmer.farmUnit})');
      print(i);
    });
    await dbClient.close();
  }

  void addField(Field field, String farmerNid) async {
    var dbClient = await db;
    await dbClient.transaction((txn) async {
      int i = await txn.rawInsert('INSERT INTO Field(field_num, '
          'field_totarea, field_irrigationsrc, field_barrier, '
          'field_addr, farmer_nid) VALUES(${field.fieldNumber}, '
          '${field.fieldTotalArea}, ${field.fieldIrrigationSource}, '
          '${field.fieldPhysicalBarrier}, ${field.fieldAddress}, '
          '$farmerNid)');
      print(i);
    });
    await dbClient.close();
  }

  void addStock(Stock stock, String farmerNidNo) async {
    try {
      _addSupplier(stock.supplierName, stock.supplierAddr);
    } catch (err) {
      print('Could not add a Supplier');
    }
    String supplierId = '';
    try {
      supplierId = await querySupplier(stock.supplierName, stock.supplierAddr);
    } catch (err) {
      print(err);
    }
    var dbClient = await db;
    await dbClient.transaction((txn) async {
      int i = await txn.rawInsert(
          'INSERT INTO Stock(stock_input, farmer_nid, supplier_id, stock_qty, '
          'stock_dtreceived, stock_storageaddr) VALUES(${stock.input}, '
          '$farmerNidNo, $supplierId, ${stock.qtyPurchased}, '
          '${stock.dateReceived}, ${stock.storageAddr})');
      print(i);
    });
    await dbClient.close();
  }

  void _addSupplier(String supplierName, String supplierAddr) async {
    var dbClient = await db;
    await dbClient.transaction((txn) async {
      int i = await txn.rawInsert('INSERT INTO Supplier(supplier_name, '
          'supplier_addr) VALUES($supplierName, $supplierAddr)');
      print(i);
    });
    await dbClient.close();
  }

  void addPlanting(PlantingRecord pSession) async {
    var dbClient = await db;
    await dbClient.transaction((txn) async {
      int i =  await txn.rawInsert('INSERT INTO Planting(plant_field, '
          'plant_prod,'
          ' plant_dtplanted, plant_crop, plant_variety, plant_area) VALUES'
          '(${pSession.field}, ${pSession.system}, ${pSession.datePlanted}, '
          '${pSession.crop}, ${pSession.variety}, ${pSession.area})');
      print(i);
    });
    await dbClient.close();
  }

  void addNutrient(Nutrient nutrient) async {
    var dbClient = await db;
    await dbClient.transaction((txn) async {
      int i = await txn.rawInsert('INSERT INTO Nutrient(nutri_field, '
          'nutri_type,'
          ' nutri_dtapplied, nutri_amt, nutri_unit, nutri_mode, nutri_crop,'
          ' nutri_area) VALUES(${nutrient.field}, ${nutrient.nutrientType}, '
          '${nutrient.dateApplied}, ${nutrient.amount}, ${nutrient.unit}, '
          '${nutrient.applicationMode}, ${nutrient.crop}, ${nutrient.area})');
      print(i);
    });
    await dbClient.close();
  }

  void addHarvest(Harvest harvest) async {
    var dbClient = await db;
    await dbClient.transaction((txn) async {
      int i = await txn.rawInsert('INSERT INTO Harvest(harv_field, '
          'harv_produce,'
          ' harv_dt, harv_area, harv_qty, harv_person) VALUES(${harvest.field},'
          ' ${harvest.produce}, ${harvest.harvestDate}, ${harvest.area}, '
          '${harvest.units}, ${harvest.harvester})');
      print(i);
    });
    await dbClient.close();
  }

  // QUERIES
  Future<String> querySupplier(String supplierName, String supplierAddr) async {
    var dbClient = await db;
    List<Map> res = await dbClient.rawQuery('SELECT '
        'supplier_id FROM Supplier WHERE supplier_name = $supplierName, '
        'supplier_addr = $supplierAddr');
    await dbClient.close();
    return res[0]['supplier_id'];
  }

//  Returns the unique field number for a given field with specified address
  Future<String> queryFieldNo(String fieldAddr) async {
    var dbClient = await db;
    List<Map> res = await dbClient.rawQuery('SELECT '
        'field_num FROM Field WHERE field_addr = $fieldAddr');
    await dbClient.close();
    return res[0]['field_num'];
  }

//  Returns a list of all field for a particular farmer Id
  Future<List<String>> queryFieldsList(String nidNo) async {
    var dbClient = await db;
    List<Map> res = await dbClient.rawQuery('SELECT '
        'field_addr FROM Field WHERE farmer_nid= $nidNo');
    await dbClient.close();
    List<String> fieldList = [];
    for (Map entry in res) {
      fieldList.add(entry['field_addr']);
    }
    return fieldList;
  }

//  List of all the stocks
  Future<List> queryStockList() async {
    var dbClient = await db;
    List<Map> res = await dbClient.rawQuery('SELECT * FROM Stock');
    await dbClient.close();
    return res;
  }

  Future<List> queryRecords(String table) async {
    var dbClient = await db;
    List<Map> res = await dbClient.rawQuery('SELECT * FROM $table');
    await dbClient.close();
    return res;
  }
}
