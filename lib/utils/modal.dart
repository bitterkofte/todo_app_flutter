// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

import 'button.dart';

class Modal extends StatelessWidget {
  final controller;
  VoidCallback onSave;
  VoidCallback onCancel;

  Modal({
    super.key,
    required this.controller,
    required this.onSave,
    required this.onCancel,
  });

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: Theme.of(context).primaryColorDark,
      content: Container(
        padding: EdgeInsets.only(top: 10),
        height: 120,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            // get user input
            TextField(
              controller: controller,
              decoration: InputDecoration(
                  contentPadding: EdgeInsets.only(
                      left: 15.0, right: 15.0, top: 8, bottom: 8),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(14.0),
                    borderSide:
                        const BorderSide(color: Colors.white, width: 2.0),
                  ),
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(14.0),
                      borderSide: BorderSide(color: Colors.white, width: 2.0)),
                  hintText: "Add a new task",
                  hintStyle: TextStyle(color: Colors.white)),
              style: TextStyle(color: Colors.white),
            ),

            // buttons -> save + cancel
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                // cancel button
                Button(text: "Cancel", onPressed: onCancel),

                // const SizedBox(width: 8),

                // save button
                Button(text: "Save", onPressed: onSave),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
