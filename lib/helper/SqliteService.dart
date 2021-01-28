import 'dart:io';
import 'package:sqflite/sqflite.dart';

import 'NoteOfflineProvider.dart';

class SqliteService {
  static final databaseName = "data.db";

  static void createDatabase() async {
    var path = await _getPathDatabase();
    //await deleteDatabase(path);
    Database database = await openDatabase(path, version: 1, onCreate: (Database db, int version) async {
      print("==================================================================================================================");
      print("Open database thành công");
    });
    _createTable(database);
  }

  static Future<String> _getPathDatabase() async {
    var databasesPath = await getDatabasesPath();
    if (Platform.isIOS) {
      String path = databasesPath + "/" + databaseName;
      return path;
    }
    String path = databasesPath + databaseName;
    return path;
  }

  static NoteOfflineProvider noteOfflineProvider;

  static _createTable(Database db) async {
    noteOfflineProvider = new NoteOfflineProvider(db);
  }
}
