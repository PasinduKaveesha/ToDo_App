import 'package:flutter/material.dart';
import 'package:test_app_for_flutter/util/button.dart';

void DeleteDialog(
    BuildContext context, Function(BuildContext)? deleteFunction) {
  showDialog(
    context: context,
    builder: (context) {
      return AlertDialog(
        backgroundColor: Colors.yellow,
        title: const Text("Delete Task"),
        titleTextStyle: TextStyle(
            fontWeight: FontWeight.bold, color: Colors.black, fontSize: 20),
        content: const Text("Are you sure you want to delete this task?"),
        
        actions: [
          MyButton(
            text: "Delete",
            onPressed: () {
              if (deleteFunction != null) {
                deleteFunction(context);
              }
              Navigator.of(context).pop();
            },
          ),
          MyButton(
            text: "Cancel",
            onPressed: () => Navigator.of(context).pop(),
          ),
        ],
      );
    },
  );
}
