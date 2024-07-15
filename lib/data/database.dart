import 'package:hive_flutter/hive_flutter.dart';

class ToDoDatabase {
  List taskList = [];

  // reference box
  final _listBox = Hive.box('listbox');

  // when users very first appearence
  void makeInitialData() {
    taskList = [
      ["Take a bath", false],
      ["Workout", false],
    ];
  }

  // load the data from database
  void loadStore() {
    taskList = _listBox.get('TASKLIST');
  }

  // update the database
  void eyeOnStore() {
    _listBox.put("TASKLIST", taskList);
  }
}