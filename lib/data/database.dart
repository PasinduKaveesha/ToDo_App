import 'package:hive_flutter/hive_flutter.dart';

// ignore: camel_case_types
class toDoDataBase {
  List toDoList = [];

  //reference the box
  final _myBox = Hive.box('myBox');

//first time running app
  void createInitData() {
    toDoList = [
      ["Organize with 'ToDo'", false]
    ];
  }

  //load Data
  void loadData() {
    toDoList = _myBox.get("TODOLIST");
  }

  //update Data
  void updateData() {
    _myBox.put("TODOLIST", toDoList);
  }
}
