// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:todo_app/data/database.dart';
import 'package:todo_app/utils/modal.dart';
import 'package:todo_app/utils/todo_tile.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  // reference the hive box
  final _myBox = Hive.box('mybox');
  ToDoDataBase db = ToDoDataBase();

  @override
  void initState() {
    // if this is the 1st time ever openin the app, then create default data
    if (_myBox.get("TODOLIST") == null) {
      db.createInitialData();
    } else {
      // there already exists data
      db.loadData();
    }
    super.initState();
  }

  // text controller
  final _controller = TextEditingController();

  // List<Map<String, dynamic>> toDoList = [
  //   {
  //     "task": "first",
  //     "isCompleted": false,
  //   },
  //   {
  //     "task": "second",
  //     "isCompleted": true,
  //   },
  // ];

  void checkboxChanged(bool? value, int index) {
    setState(() =>
        db.toDoList[index]["isCompleted"] = !db.toDoList[index]["isCompleted"]);
  }

  // create a new task
  void createNewTask() {
    showDialog(
      context: context,
      builder: (context) {
        return Modal(
          controller: _controller,
          onSave: saveNewTask,
          onCancel: () => Navigator.of(context).pop(),
        );
      },
    );
  }

  // save new task
  void saveNewTask() {
    setState(() {
      db.toDoList.add({"task": _controller.text, "isCompleted": false});
      _controller.clear();
    });
    Navigator.of(context).pop();
    db.updateDataBase();
  }

  // delete task
  void deleteTask(int index) {
    setState(() {
      db.toDoList.removeAt(index);
    });
    db.updateDataBase();
  }

  // delete all tasks
  void deleteAllTasks(int index) {
    setState(() {
      db.toDoList = [];
    });
    db.updateDataBase();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(color: Colors.white),
        centerTitle: true,
        title: const Text(
          "ToDo Flutter",
          style: TextStyle(
              color: Colors.white, fontWeight: FontWeight.w600, fontSize: 24),
        ),
        backgroundColor: Colors.teal,
      ),
      drawer: Drawer(
        backgroundColor: Theme.of(context).primaryColorDark,
        child: Column(
          children: [
            DrawerHeader(
                child: Text("Todo Flutter",
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                        fontWeight: FontWeight.w700))),
            ElevatedButton.icon(
              onPressed: () => deleteAllTasks,
              icon: Icon(
                Icons.delete,
                size: 24.0,
              ),
              label: Text('Delete all tasks',
                  style: TextStyle(fontWeight: FontWeight.w700)), // <-- Text
            ),
          ],
        ),
      ),
      backgroundColor: Colors.teal[300],
      body: ListView.builder(
        itemCount: db.toDoList.length,
        itemBuilder: (context, index) => ToDoTile(
          taskName: db.toDoList[index]["task"],
          taskCompleted: db.toDoList[index]["isCompleted"],
          onChanged: (value) => checkboxChanged(value, index),
          deleteHandler: (p0) => deleteTask,
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: createNewTask,
        child: Icon(Icons.add, color: Colors.teal[800]),
        backgroundColor: Colors.teal[200],
      ),
    );
  }
}
