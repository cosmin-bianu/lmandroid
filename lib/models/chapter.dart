import 'data_item.dart';
import 'package:sqflite/sqflite.dart';

class Chapter extends DataItem{
  static const String tableChapter='Chapter';
  static const String columnDescription='description';
  static List<String> columnList = [
    DataItem.columnName,
    DataItem.columnOrderNumber,
    columnDescription
  ];
  String description;

  Map<String,dynamic> toMap(){
    var map = <String, dynamic> {
      DataItem.columnName: name,
      DataItem.columnOrderNumber: orderNumber,
      columnDescription: description
    };

    if(id != null)
      map[DataItem.columnId] = id;

    return map;
  }

  Chapter();

  Chapter.fromMap(Map<String, dynamic> map){
    id=map[DataItem.columnId];
    name=map[DataItem.columnName];
    orderNumber=map[DataItem.columnOrderNumber];
    description=map[columnDescription];
  }
}