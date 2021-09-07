import 'dart:io';

import 'package:mi_tianguis/db/schema_db.dart';
import 'package:sqflite/sqflite.dart';

class AppDB {
  static AppDB _appDB;
  static Database _database;

  AppDB._instance();

  factory AppDB() {
    return _appDB ?? (_appDB = AppDB._instance());
  }

  Future<Database> get getDB async {
    return _database ?? (_database = await _initializeDB());
  }

  Future<Database> _initializeDB() async {
    String rootDir = await getDatabasesPath();
    String pathDB = rootDir +
        (Platform.isIOS == false ? "tianguisdb.db" : "/tianguisdb.db");
    Database appDB = await openDatabase(pathDB,
        version: SchemaDB.getCurrentVersion, onCreate: _onCreate);

    return appDB;
  }

  Future<void> _onCreate(Database db, int version) async {
    Batch batch = db.batch();
    List<String> lstTables = SchemaDB.getCurrentSchema.split(':');
    lstTables.forEach((table) => batch.execute(table));
    await batch.commit(continueOnError: false, noResult: true);
  }
}
