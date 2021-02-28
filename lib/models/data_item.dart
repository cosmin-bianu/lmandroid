abstract class DataItem{
  static const String columnId='_id';
  static const String columnName='name';
  static const String columnOrderNumber='order_number';
  static List<String> columnList;

  int id;
  String name;
  int orderNumber;

  DataItem();
  DataItem.fromMap();

  toMap();
}