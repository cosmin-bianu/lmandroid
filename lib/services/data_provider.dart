import 'package:drept_civil/models/chapter.dart';
import 'package:drept_civil/models/course.dart';
import 'package:drept_civil/models/exercise.dart';
import 'package:drept_civil/models/data_item.dart';
import 'package:flutter/widgets.dart';
import 'package:sqflite/sqflite.dart';

enum DataType { CHAPTER, COURSE, EXERCISE }

@immutable
class DataProvider {

  static final DataProvider _instance = new DataProvider();
  static const String dbPath='content.db';
  Database db;
  bool _hasBeenInitialised=false;
  DataProvider();

  Future initialize() async{
    db = await openDatabase(
        dbPath,
        version: 1,
        onCreate: (Database db, int version) async{
          await db.execute('''
            CREATE TABLE ${Chapter.tableChapter} (
              ${DataItem.columnId} INTEGER PRIMARY KEY AUTOINCREMENT,
              ${DataItem.columnName} TEXT NOT NULL,
              ${DataItem.columnOrderNumber} INTEGER NOT NULL,
              ${Chapter.columnDescription} TEXT NOT NULL);
              CREATE TABLE ${Course.tableCourse} (
              ${DataItem.columnId} INTEGER PRIMARY KEY AUTOINCREMENT,
              ${DataItem.columnName} TEXT NOT NULL,
              ${DataItem.columnOrderNumber} INTEGER NOT NULL,
              ${Course.columnContent} TEXT NOT NULL);
              CREATE TABLE ${Exercise.tableExercise} (
              ${DataItem.columnId} INTEGER PRIMARY KEY AUTOINCREMENT,
              ${DataItem.columnName} TEXT NOT NULL,
              ${DataItem.columnOrderNumber} INTEGER NOT NULL,
              ${Exercise.columnQuestion} TEXT NOT NULL,
              ${Exercise.columnAnswer1} TEXT NOT NULL,
              ${Exercise.columnAnswer2} TEXT NOT NULL,
              ${Exercise.columnAnswer3} TEXT NOT NULL,
              ${Exercise.columnAnswer4} TEXT NOT NULL,
              ${Exercise.columnCorrectAnswerIndex} INTEGER NOT NULL,
              ${Exercise.columnChapterId} INTEGER NOT NULL);''');
        });
  }

  String _getTable(DataType type){
    switch(type){
      case DataType.CHAPTER:
        return Chapter.tableChapter;
      case DataType.COURSE:
        return Course.tableCourse;
      case DataType.EXERCISE:
        return Exercise.tableExercise;
    }
  }

  List<String> _getColumns(DataType type){
    switch(type){
      case DataType.CHAPTER:
        return Chapter.columnList;
      case DataType.COURSE:
        return Course.columnList;
      case DataType.EXERCISE:
        return Exercise.columnList;
    }
  }

  Future insert(DataType type, DataItem item) async{
    String table = _getTable(type);
    if(table != null){
      db.insert(table, item.toMap());
    }
  }

  Future<DataItem> getDataItem(DataType type, int id) async{
    String table = _getTable(type);
    List<Map> maps = await db.query(
      table,
      columns: _getColumns(type),
      where: '${DataItem.columnId} = ?',
      whereArgs: [id]
    );

    DataItem toReturn = null; //todo;

  }
}