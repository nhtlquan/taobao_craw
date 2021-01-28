import 'dart:convert';
import 'dart:math';

import 'package:intl/intl.dart';
import 'package:sqflite/sqflite.dart';

final String _tableName = 'note_offline';
final String _columnId = 'id';
final String _columnContent = 'content';
final String _columnArticle = 'article';
final String _columnType = 'type'; //1: Note Normal, 2: Note Article
final String _columnCreateTime = 'create_time';
final String _columnUpdateTime = 'update_time';

final typeNormal = 1;
final typeArticle = 2;

class NoteOfflineModel {
  int id;
  String content;
  String article;
  int type;
  String createTime;
  String updateTime;

  DateTime get createTimeObject {
    print(createTime);
    var time = int.tryParse(createTime) * 1000;
    var date = DateTime.fromMicrosecondsSinceEpoch(time.toInt());
    return DateTime(date.year, date.month, date.day);
  }

  String get createTimeShow {
    print(createTime);
    var time = int.tryParse(createTime) * 1000;
    var date = DateTime.fromMicrosecondsSinceEpoch(time.toInt());
    return dateTimeToString(date, "yyyy-MMMM-dd HH:mm:ss");
  }

  DateTime get updateTimeObject {
    var time = int.tryParse(createTime) * 1000;
    return DateTime.fromMicrosecondsSinceEpoch(time.toInt());
  }

  NoteOfflineModel() {
    var now = DateTime.now();
    content = "";
    article = "";
    type = 0;
    createTime = now.millisecondsSinceEpoch.toString();
    updateTime = now.millisecondsSinceEpoch.toString();
  }

  Map<String, dynamic> toMap() {
    var map = <String, dynamic>{
      _columnContent: content,
      _columnArticle: article,
      _columnType: type,
      _columnCreateTime: createTime,
      _columnUpdateTime: updateTime,
    };
    if (id != null) {
      map[_columnId] = id;
    }
    return map;
  }

  NoteOfflineModel.fromMap(Map<String, dynamic> map) {
    id = map[_columnId];
    content = map[_columnContent];
    article = map[_columnArticle];
    type = map[_columnType];
    createTime = map[_columnCreateTime];
    updateTime = map[_columnUpdateTime];
  }

  static String dateTimeToString(DateTime dateTime, String format) {
    if (dateTime == null) return null;
    var formatter = new DateFormat(format);
    return formatter.format(dateTime);
  }
}

class NoteOfflineProvider {
  Database db;

  NoteOfflineProvider(this.db) {
    open();
  }

  Future open() async {
    await db.execute('''
        CREATE TABLE if not exists $_tableName ( 
          $_columnId integer primary key autoincrement, 
          $_columnContent text not null,
          $_columnArticle text not null,
          $_columnType integer not null,
          $_columnCreateTime text not null,
          $_columnUpdateTime text not null
          )
        ''');
  }

  Future<NoteOfflineModel> insert(NoteOfflineModel obj) async {
    obj.id = await db.insert(_tableName, obj.toMap());
    return obj;
  }

  List<String> _getListColumn() {
    var list = [
      _columnId,
      _columnContent,
      _columnArticle,
      _columnType,
      _columnCreateTime,
      _columnUpdateTime,
    ];
    return list;
  }

  Future<NoteOfflineModel> getHistory(String id) async {
    List<Map> maps = await db.query(_tableName, columns: _getListColumn(), where: '$_columnId = ?', whereArgs: [id]);
    if (maps.length > 0) {
      return NoteOfflineModel.fromMap(maps.first);
    }
    return null;
  }

  Future<List<NoteOfflineModel>> getList() async {
    List<Map> maps = await db.rawQuery(
        'SELECT * FROM $_tableName ORDER BY create_time DESC'); //db.query(_tableName, columns: _getListColumn());
    print("Length: " + maps.length.toString());
    print("getList ${jsonEncode(maps)}");
    if (maps.length > 0) {
      var list = List<NoteOfflineModel>();
      maps.forEach((map) => list.add(NoteOfflineModel.fromMap(map)));
      return list;
    }
    return null;
  }

  Future<int> delete(int id) async {
    return await db.delete(_tableName, where: '$_columnId = ?', whereArgs: [id]);
  }

  Future<int> update(NoteOfflineModel obj) async {
    return await db.update(_tableName, obj.toMap(), where: '$_columnId = ?', whereArgs: [obj.id]);
  }

  Future close() async => db.close();

  Future<NoteOfflineModel> saveNoteInArticle(String content, String article) async {
    var note = await getNoteWithArticle(article);
    if (note == null) {
      var noteNew = new NoteOfflineModel();
      noteNew.content = content;
      noteNew.article = article;
      noteNew.type = typeArticle;
      return await insert(noteNew);
    } else {
      note.content = content;
      await update(note);
      return note;
    }
  }

  Future<NoteOfflineModel> getNoteWithArticle(String article) async {
    List<Map> maps = await db.rawQuery("SELECT * FROM $_tableName WHERE article = '$article' AND type = $typeArticle");
    if (maps != null && maps.length > 0) {
      return NoteOfflineModel.fromMap(maps[0]);
    }
    return null;
  }

  Future<NoteOfflineModel> createNote(String content) async {
    var noteNew = new NoteOfflineModel();
    noteNew.content = content;
    noteNew.type = typeNormal;
    return await insert(noteNew);
  }

  Future saveNote(String content, String noteId) async {
    var noteNew = new NoteOfflineModel();
    noteNew.id = int.parse(noteId);
    noteNew.content = content;
    noteNew.type = typeNormal;
    await update(noteNew);
  }

  Future deleteNote(String noteId) async {
    await delete(int.parse(noteId));
  }

  Future<List<NoteOfflineModel>> getListNote() async {
    List<Map> maps = await db.rawQuery('SELECT * FROM $_tableName WHERE type = $typeArticle ORDER BY create_time DESC');
    if (maps.length > 0) {
      var list = List<NoteOfflineModel>();
      maps.forEach((map) => list.add(NoteOfflineModel.fromMap(map)));
      return list;
    }
    return null;
  }


}
