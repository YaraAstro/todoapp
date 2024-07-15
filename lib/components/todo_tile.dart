// ignore_for_file: prefer_const_constructors, sort_child_properties_last, prefer_const_literals_to_create_immutables, must_be_immutable

import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

class ToDoTile extends StatelessWidget {
  // set parameters
  final String taskName;
  final bool isComplete;
  Function(bool?)? onChanged;
  Function(BuildContext)? deleteMethod;

  // define constructor
  ToDoTile({
    super.key,
    required this.taskName,
    required this.isComplete,
    required this.onChanged,
    required this.deleteMethod,
  });

  @override
  Widget build(BuildContext context) {
    return Slidable(
      endActionPane: ActionPane(motion: StretchMotion(), children: [
        SlidableAction(
          onPressed: deleteMethod,
          icon: Icons.delete,
          foregroundColor: Color.fromARGB(255, 241, 196, 190),
          backgroundColor: Color.fromARGB(255, 70, 32, 20),
          borderRadius: BorderRadius.circular(10),
        )
      ]),
      child: Container(
        decoration: BoxDecoration(
            color: isComplete ? Colors.brown[400] : Colors.brown[600],
            borderRadius: BorderRadius.circular(10),
            boxShadow: [
              BoxShadow(
                  color: Colors.brown, blurRadius: 5, offset: Offset(2, 3))
            ]),
        padding: EdgeInsets.symmetric(horizontal: 25, vertical: 10),
        child: Row(
          children: [
            Checkbox(
              value: isComplete,
              onChanged: onChanged,
              activeColor: Colors.brown[600],
              checkColor: Colors.brown[400],
              shape: CircleBorder(),
              side: BorderSide(
                color: const Color.fromRGBO(161, 136, 127, 1),
                width: 2.0,
              ),
              visualDensity: VisualDensity.standard,
            ),
            Text(
              taskName,
              style: TextStyle(
                fontSize: 20,
                color: Colors.brown[100],
                decoration: isComplete
                    ? TextDecoration.lineThrough
                    : TextDecoration.none,
              ),
            ),
          ],
        ),
      ),
    );
  }
}