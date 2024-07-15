// ignore_for_file: prefer_const_constructors, must_be_immutable, prefer_typing_uninitialized_variables, sized_box_for_whitespace

import 'package:flutter/material.dart';

import 'buttons.dart';

class AddTaskBox extends StatelessWidget {
  final controller;
  VoidCallback onSave;
  VoidCallback onCancel;
  
  AddTaskBox({
    super.key, 
    required this.controller,
    required this.onSave,
    required this.onCancel,
  });

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
      backgroundColor: Colors.brown[600],
      content: Container(
        height: 110,
        width: 250,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            TextField(
              controller: controller,
              decoration: InputDecoration(
                  filled: true,
                  fillColor: Colors.brown[400],
                  hintText: 'Add New Task ...',
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: BorderSide.none)),
            ),
            Row(mainAxisAlignment: MainAxisAlignment.center, 
            children: [
              Expanded(
                  child: AddTaskButton(buttonLabel: 'Add', onPressed: onSave)),
              Expanded(
                  child: AddTaskButton(buttonLabel: 'Cancel', onPressed: onCancel))
            ])
          ],
        ),
      ),
    );
  }
}