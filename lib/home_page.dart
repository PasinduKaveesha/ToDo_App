import 'package:flutter/material.dart';

import 'package:hive_flutter/hive_flutter.dart';
import 'package:test_app_for_flutter/data/database.dart';
import 'package:test_app_for_flutter/util/dialog_box.dart';
import 'package:test_app_for_flutter/util/searchbar.dart';
import 'package:test_app_for_flutter/util/todo_tile.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  //reference the box
  final _myBox = Hive.box('myBox');
  toDoDataBase db = toDoDataBase();
  final TextEditingController searchcontrol = TextEditingController();
  List<dynamic> filterdtoDoList = [];

  @override
  void initState() {
    //createing default data
    if (_myBox.get("TODOLIST") == null) {
      db.createInitData();
    } else {
      db.loadData();
    }
    filterdtoDoList = db.toDoList;
    super.initState();
  }

  //checkbox changed
  void checkBoxChanged(bool? value, int index) {
    setState(() {
      db.toDoList[index][1] = !db.toDoList[index][1];
    });
    db.updateData();
  }

  //text controller
  final _controller = TextEditingController();

  //save new task
  void saveNewTask() {
    setState(() {
      db.toDoList.add([_controller.text, false]);
      _controller.clear();
    });
    Navigator.of(context).pop();
    db.updateData();
  }

  //create new task
  void createNewTask() {
    showDialog(
        context: context,
        builder: (context) {
          return DialogBox(
            controller: _controller,
            onSave: saveNewTask,
            onCancel: Navigator.of(context).pop,
          );
        });
  }

//delete Task
  void deleteTask(int index) {
    setState(() {
      db.toDoList.removeAt(db.toDoList.indexOf(filterdtoDoList[index]));
      filterTasks(searchcontrol.text);
    });
    db.updateData();
  }

  //search tasks
  void filterTasks(String searchText) {
    setState(() {
      filterdtoDoList = db.toDoList
          .where((task) =>
              task[0].toLowerCase().contains(searchText.toLowerCase()))
          .toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.yellow[200],
      appBar: AppBar(
        title: Text(
          "To Do List",
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 30),
        ),
        centerTitle: true,
        elevation: 0,
        backgroundColor: Colors.amber,
      ),
      body: Column(
        children: [
          if (db.toDoList.isNotEmpty)
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Searchbar(
                onsearchChanged: filterTasks,
                searchController: searchcontrol,
              ),
            ),
          Expanded(
            child: ListView.builder(
              itemCount: filterdtoDoList.length,
              itemBuilder: (context, index) {
                return TodoTile(
                  taskName: filterdtoDoList[index][0],
                  taskCompleted: filterdtoDoList[index][1],
                  onChanged: (value) => checkBoxChanged(
                      value, db.toDoList.indexOf(filterdtoDoList[index])),
                  deleteFunction: (context) =>
                      deleteTask(db.toDoList.indexOf(filterdtoDoList[index])),
                );
              },
            ),
          ),
        ],
      ),
      floatingActionButton: Transform.scale(
        scale: 1.2,
        child: FloatingActionButton(
          backgroundColor: Colors.amber[700],
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(30),
          ),
          onPressed: createNewTask,
          child: Icon(Icons.add_task, color: Colors.black87),
        ),
      ),
    );
  }
}
