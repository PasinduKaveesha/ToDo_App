import 'package:flutter/material.dart';
import 'package:test_app_for_flutter/util/button.dart';
// import 'package:todo_app/util/button.dart';

class DialogBox extends StatelessWidget {
  // ignore: prefer_typing_uninitialized_variables
  final controller;
  final VoidCallback onSave;
  final VoidCallback onCancel;

  const DialogBox({
    super.key,
    required this.controller,
    required this.onSave,
    required this.onCancel,
  });

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
      backgroundColor: Colors.amber[300],
      content: Padding(
        padding: const EdgeInsets.only(left: 0, right: 0),
        child: SizedBox(
          height: 120,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              // Get user input
              TextField(
                controller: controller,
                decoration: InputDecoration(
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                      width: 1.0,
                      color: Colors.black,
                    ),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                      width: 2.0,
                      color: Colors.black,
                    ),
                  ),
                  hintText: "Add a New Task",
                ),
              ),

              // Save button & cancel button
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  MyButton(text: "Save", onPressed: onSave),
                  MyButton(text: "Cancel", onPressed: onCancel),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
