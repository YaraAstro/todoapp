// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';

import '../components/dialog_box.dart';
import '../components/todo_tile.dart';
import '../data/database.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  // reference the hive box
  final _listBox = Hive.box('listbox');
  ToDoDatabase store = ToDoDatabase();

  @override
  void initState() {
    // create default data for first glance
    if (_listBox.get('TASKLIST') == null) {
      store.makeInitialData();
    } else {
      // for regular entrance
      store.loadStore();
    }

    super.initState();
  }

  // text controller for creating a task
  final _fetchTheTask = TextEditingController();

  // method for on-change / to keep eye on checkbox
  void eyeOnCheck(bool? value, int index) {
    setState(() {
      store.taskList[index][1] = !store.taskList[index][1];
    });
    store.eyeOnStore();
  }

  // add task
  void createTask() {
    setState(() {
      store.taskList.add([_fetchTheTask.text, false]);
      _fetchTheTask.clear();
    });
    Navigator.of(context).pop();
    store.eyeOnStore();
  }

  // create new task
  void addNewTask() {
    showDialog(
      context: context,
      builder: (context) {
        return AddTaskBox(
          controller: _fetchTheTask,
          onSave: createTask,
          onCancel: () => Navigator.of(context).pop(),
        );
      },
    );
  }

  // delete current task
  void deleteTask(int index) {
    setState(() {
      store.taskList.removeAt(index);
    });
    store.eyeOnStore();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.brown[300],
      appBar: AppBar(
        elevation: 2,
        title: Center(
          child: Text(
            "T O   D O",
            style: TextStyle(
              color: Colors.brown[100],
            ),
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: addNewTask,
        child: Icon(
          Icons.add,
          size: 24,
        ),
      ),
      body: ListView.builder(
        itemCount: store.taskList.length,
        itemBuilder: (context, index) => Padding(
          padding: index == 0
              ? EdgeInsets.only(left: 25, top: 25, right: 25, bottom: 10)
              : EdgeInsets.symmetric(horizontal: 25, vertical: 10),
          child: ToDoTile(
            taskName: store.taskList[index][0],
            isComplete: store.taskList[index][1],
            onChanged: (value) => eyeOnCheck(value, index),
            deleteMethod: (context) => deleteTask(index),
          ),
        ),
      ),
    );
  }
}