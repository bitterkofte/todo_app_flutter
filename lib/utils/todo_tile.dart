// ignore_for_file: sort_child_properties_last, prefer_const_constructors

import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

class ToDoTile extends StatelessWidget {
  final String taskName;
  final bool taskCompleted;
  Function(bool?)? onChanged;
  Function(BuildContext)? deleteHandler;

  ToDoTile(
      {super.key,
      required this.taskName,
      required this.taskCompleted,
      required this.onChanged,
      required this.deleteHandler});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 25, left: 25, right: 25),
      child: Slidable(
        endActionPane: ActionPane(motion: StretchMotion(), children: [
          SlidableAction(
            onPressed: deleteHandler,
            icon: Icons.delete,
            backgroundColor: Colors.red,
            borderRadius: BorderRadius.circular(12),
            // foregroundColor: Colors.white,
            // spacing: 10,
          ),
        ]),
        child: Container(
          padding: EdgeInsets.only(top: 8, bottom: 8, left: 10, right: 10),
          child: Row(
            children: [
              Checkbox(
                value: taskCompleted,
                onChanged: onChanged,
                activeColor: Colors.black,
              ),
              Text(taskName,
                  style: TextStyle(
                    color: taskCompleted ? Colors.grey[400] : Colors.white,
                    fontWeight: FontWeight.w500,
                    fontSize: 18,
                    fontStyle:
                        taskCompleted ? FontStyle.italic : FontStyle.normal,
                  )),
            ],
          ),
          decoration: BoxDecoration(
              color: Colors.teal, borderRadius: BorderRadius.circular(12)),
        ),
      ),
    );
  }
}
