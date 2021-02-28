import 'data_item.dart';
import 'package:sqflite/sqflite.dart';

class Exercise extends DataItem{
  static const String tableExercise='Exercise';
  static const String columnQuestion='question';
  static const String columnAnswer1='answer1';
  static const String columnAnswer2='answer2';
  static const String columnAnswer3='answer3';
  static const String columnAnswer4='answer4';
  static const String columnCorrectAnswerIndex="correct_answer_index";
  static const String columnChapterId='chapter_id';
  static List<String> columnList = [
    DataItem.columnName,
    DataItem.columnOrderNumber,
    columnQuestion,
    columnAnswer1,
    columnAnswer2,
    columnAnswer3,
    columnAnswer4,
    columnCorrectAnswerIndex,
    columnChapterId
  ];

  String question;
  String answer1;
  String answer2;
  String answer3;
  String answer4;
  int correctAnswerIndex;
  int chapterId;


  Map<String,dynamic> toMap(){
    var map = <String, dynamic> {
      DataItem.columnName: name,
      DataItem.columnOrderNumber: orderNumber,
      columnQuestion: question,
      columnAnswer1: answer1,
      columnAnswer2: answer2,
      columnAnswer3: answer3,
      columnAnswer4: answer4,
      columnCorrectAnswerIndex: correctAnswerIndex,
      columnChapterId: chapterId
    };

    if(id != null)
      map[DataItem.columnId] = id;

    return map;
  }

  Exercise();

  Exercise.fromMap(Map<String, dynamic> map){
    id=map[DataItem.columnId];
    name=map[DataItem.columnName];
    orderNumber=map[DataItem.columnOrderNumber];
    question=map[columnQuestion];
    answer1=map[columnAnswer1];
    answer2=map[columnAnswer2];
    answer3=map[columnAnswer3];
    answer4=map[columnAnswer4];
    correctAnswerIndex=map[columnCorrectAnswerIndex];
    chapterId=map[chapterId];
  }
}