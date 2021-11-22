// @dart=2.9
import 'dart:convert';
import 'dart:ffi';
import 'dart:io';

import 'package:fml/model/list.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path_provider/path_provider.dart';

class DatabaseHelper {
  static const _databaseName = 'fml.db';
  static const _databaseVersion = 1;

  //singleton class
  DatabaseHelper._();
  static final DatabaseHelper instance = DatabaseHelper._();

  Database _database;
  Future<Database> get database async {
    if (_database != null) return _database;

    _database = await _initDatabase();
    return _database;
  }

  _initDatabase() async {
    Directory dataDirectory = await getApplicationDocumentsDirectory();
    String dbPath = join(dataDirectory.path, _databaseName);
    print("Database created path :" + dbPath);
    //Delete database
    await deleteDatabase(dbPath);

    return await openDatabase(dbPath,
        version: _databaseVersion, onCreate: populateDb);
  }

  void populateDb(Database database, int version) async {
    await database.execute("CREATE TABLE parameters ("
        "wo_no TEXT,"
        "term_name_ch TEXT,"
        "parameter1 TEXT,"
        "parameter2 TEXT,"
        "parameter3 TEXT,"
        "parameter4 TEXT,"
        "parameter5 TEXT"
        ")");
  }

  // Future<int> insertuser(Joblist user) async {
  //   Database db = await database;

  //  print('Userdata insert successfully!');
  //  return await db.insert("parameters", user.toMap());
  //}

  void createparameters(Joblist parameterdetails) async {
    Database db = await database;
    db.rawInsert(
        "INSERT INTO parameters (wo_no,term_name_ch, parameter1, parameter2, parameter3, parameter4, parameter5)"
        " VALUES (${parameterdetails.wo_no},${parameterdetails.term_name_ch},${"parameter1"},${"par.parameter2"},${"par.parameter2"},${"par.parameter2"},${"par.parameter2"})");
  }

  Future<List> getparameters() async {
    var result = await _database.rawQuery('SELECT * FROM parameters');
    int dfhh = result.length;
    return result.toList();
  }
}
