import 'package:onyx_delivery_service/models/deliveryBill.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';

import 'package:path/path.dart';
import 'dart:io' as io;

class DBHelper {
  static Database? _db;

  Future<Database?> get db async {
    if (_db != null) {
      return _db!;
    } else {
      _db = await initDatabase();
      return _db;
    }
  }

  initDatabase() async {
    io.Directory documentDirectory = await getApplicationDocumentsDirectory();
    String path = join(documentDirectory.path, 'DeliveryBillDb.db');
    var db = await openDatabase(
      path,
      version: 1,
      onCreate: _onCreate,
    );
    return db;
  }

  _onCreate(Database db, int version) async {
    await db.execute(
        'CREATE TABLE deliverybill (BILL_AMT TEXT , BILL_DATE TEXT ,BILL_NO TEXT,BILL_SRL TEXT, BILL_TIME TEXT , BILL_TYPE TEXT,CSTMR_ADDRSS TEXT,CSTMR_APRTMNT_NO TEXT,CSTMR_BUILD_NO TEXT,CSTMR_FLOOR_NO TEXT,CSTMR_NM TEXT,DLVRY_STATUS_FLG TEXT,LATITUDE TEXT,LONGITUDE TEXT,MOBILE_NO TEXT,RGN_NM TEXT,TAX_AMT TEXT)');
  }

  Future<void> insert(List<DeliveryBill>? devBill) async {
    var dbClient = await db;

    for (var i = 0; i < devBill!.length; i++) {
      await dbClient!.rawInsert(
          "INSERT Into deliverybill (BILL_AMT,BILL_DATE,BILL_NO,BILL_SRL,BILL_TIME,BILL_TYPE,CSTMR_ADDRSS,CSTMR_APRTMNT_NO,CSTMR_BUILD_NO,CSTMR_FLOOR_NO,CSTMR_NM,DLVRY_STATUS_FLG,LATITUDE,LONGITUDE,MOBILE_NO,RGN_NM,TAX_AMT)"
          " VALUES (?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)",
          [
            devBill[i].BILL_AMT,
            devBill[i].BILL_DATE,
            devBill[i].BILL_NO,
            devBill[i].BILL_SRL,
            devBill[i].BILL_TIME,
            devBill[i].BILL_TYPE,
            devBill[i].CSTMR_ADDRSS,
            devBill[i].CSTMR_APRTMNT_NO,
            devBill[i].CSTMR_BUILD_NO,
            devBill[i].CSTMR_FLOOR_NO,
            devBill[i].CSTMR_NM,
            devBill[i].DLVRY_STATUS_FLG,
            devBill[i].LATITUDE,
            devBill[i].LONGITUDE,
            devBill[i].MOBILE_NO,
            devBill[i].RGN_NM,
            devBill[i].TAX_AMT
          ]);
    }
  }

  Future<List<DeliveryBill>> getList() async {
    var dbClient = await db;
    List<Map<String, dynamic>> list =
        await dbClient!.rawQuery('SELECT * FROM deliverybill');
    var bb = list.map((i) => DeliveryBill.fromJson(i)).toList();
    return bb;
  }

  Future<void> delete() async {
    var dbClient = await db;
    await dbClient!.delete('deliverybill');
  }
}
