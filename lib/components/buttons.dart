// ignore_for_file: prefer_const_constructors, must_be_immutable

import 'package:flutter/material.dart';

class AddTaskButton extends StatelessWidget {
  final String buttonLabel;
  VoidCallback onPressed;

  AddTaskButton({
    super.key, 
    required this.buttonLabel,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      onPressed: onPressed,
      color: Colors.brown[600],
      elevation: 0,
      child: Text(
        buttonLabel,
        style: TextStyle(
          color: Color.fromARGB(255, 207, 159, 140),
          fontSize: 16,
          fontWeight: FontWeight.normal
        ),
      ),
    );
  }
}