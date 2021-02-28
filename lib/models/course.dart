import 'data_item.dart';

class Course extends DataItem{
  static const String tableCourse='Course';
  static const String columnChatpterId='chapter_id';
  static const String columnContent='content';
  static List<String> columnList = [
    DataItem.columnName,
    DataItem.columnOrderNumber,
    columnChatpterId,
    columnContent
  ];

  int chapterId;
  String content;

  Course();

  Map<String,dynamic> toMap(){
    var map = <String, dynamic> {
      DataItem.columnName: name,
      DataItem.columnOrderNumber: orderNumber,
      columnContent: content,
      columnChatpterId: chapterId
    };

    if(id != null)
      map[DataItem.columnId] = id;

    return map;
  }

  @override
  List<String> getColumns() {
    List<String> finalList = List();
    finalList
      ..add(DataItem.columnName)
      ..add(DataItem.columnOrderNumber)
      ..add(columnChatpterId)
      ..add(columnContent);

    return finalList;
  }


}