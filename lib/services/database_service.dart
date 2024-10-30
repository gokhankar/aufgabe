import 'dart:io';
import 'dart:typed_data';
import 'package:aufgabe/models/change_model.dart';
import 'package:aufgabe/models/shop_model.dart';
import 'package:aufgabe/models/update_model.dart';
import 'package:flutter/foundation.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import 'package:flutter/services.dart';

class DatabaseService {
  static Database? _db;
  static final DatabaseService instance = DatabaseService._constructor();

  DatabaseService._constructor();

  Future initialize() async {
    if (kDebugMode) {
      print("initialize database_service called");
    }
    var databasesPath = await getDatabasesPath();
    var path = join(databasesPath, "shop.db");

    // Check if the database exists
    var exists = await databaseExists(path);

    if (!exists) {
      // Should happen only the first time you launch your application
      if (kDebugMode) {
        print("Creating new copy from asset");
      }

      // Make sure the parent directory exists
      try {
        await Directory(dirname(path)).create(recursive: true);
      } catch (_) {}

      // Copy from asset
      ByteData data = await rootBundle.load(url.join("assets/db", "shop.db"));
      List<int> bytes =
          data.buffer.asUint8List(data.offsetInBytes, data.lengthInBytes);

      // Write and flush the bytes written
      await File(path).writeAsBytes(bytes, flush: true);
    } else {
      if (kDebugMode) {
        print("Opening existing database");
      }
    }

    // open the database
    _db = await openDatabase(path, readOnly: false);
    if (kDebugMode) {
      print("from initialize_db : $_db");
    }
  }

  Future<List<ShopModel>> getShopList() async {
    Database? db = _db;
    var result = await db!.query("shops", orderBy: "shop ASC");
    // if (kDebugMode) {
    //   print(result);
    //   print(result[0]);
    // }
    var shopList = result
        .map((item) => ShopModel(
            shop: item["shop"] as int,
            name1: null != item["name1"] ? item["name1"] as String : "",
            name2: null != item["name2"] ? item["name2"] as String : "",
            str: null != item["str"] ? item["str"] as String : "",
            plz: null != item["plz"] ? item["plz"] as String : "",
            ort: null != item["ort"] ? item["ort"] as String : ""))
        .toList();

    // print(" from databaseServer getshopList ${shopList.length}");

    return shopList;
  }

  Future getShopInfoByShopnumber(int num) async {
    Database? db = _db;
    var result = await db!.rawQuery(
        "SELECT name1, name2, str, plz, ort FROM shops WHERE shop=$num;");
    //   print(result);
    return result;
  }

  Future getShopAllInfoByShopnumber(int num) async {
    Database? db = _db;
    var result = await db!.rawQuery("SELECT * FROM shops WHERE shop=$num;");
    //   print(result);
    return result;
  }

  Future<List<ChangeModel>> getChangeList() async {
    Database? db = _db;
    var result = await db!.query("updates", orderBy: "change ASC");
    // log(result[0].toString());
    var changeList = result
        .map((item) => ChangeModel(
              change: item["change"] as int,
              price: item["price"] as double,
            ))
        .toList();

    return changeList;
  }

  Future getChangeInfoByChangenumber(int num) async {
    Database? db = _db;
    var result = await db!
        .rawQuery("SELECT change, price FROM updates WHERE change=$num;");
    //   print(result);
    return result;
  }

  Future getChangeAllInfoByChangenumber(int num) async {
    Database? db = _db;
    var result = await db!.rawQuery("SELECT * FROM updates WHERE change=$num;");
    //   print(result);
    return result;
  }

  Future updatePriceByChangenumber(int changeNum, double newPrice) async {
    Database? db = _db;

    var result = await db!.rawUpdate(
        "UPDATE updates SET price=$newPrice WHERE change=$changeNum;");
    //   print(result);
    return result;
  }

  Future getSortUpdateten() async {
    Database? db = _db;
    var result = await db!.rawQuery("SELECT * FROM updates ORDER BY idn;");
    print(result);
    var updateList = result
        .map((item) => UpdateModel(
            shop: item["shop"] as int,
            change: item["change"] as int,
            idn: item["idn"] as int,
            price1: item["price1"] as double,
            price2: item["price2"] as double,
            city: null != item["city"] ? item["city"] as String : "",
            accepted:
                null != item["accepted"] ? item["accepted"] as String : null))
        .toList();

    return updateList;
  }

  Future updateSortUpdate(int changeNum, dynamic accepted, int idn) async {
    Database? db = _db;
    print(
        "UPDATE updates SET accepted$accepted WHERE change=$changeNum AND idn=$idn;");

    var result = await db!.rawUpdate(
        "UPDATE updates SET accepted='$accepted' WHERE change=$changeNum AND idn=$idn;");
    //   print(result);
    return result;
  }
}
