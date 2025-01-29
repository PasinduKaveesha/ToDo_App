import 'package:flutter/material.dart';
import 'package:test_app_for_flutter/util/button.dart';

class WarningDialog extends StatelessWidget {
  const WarningDialog({super.key});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
      backgroundColor: Colors.amber[300],
      title: Text("Warning", style: TextStyle(fontWeight: FontWeight.bold)),
      content: Text("Please add a task to proceed."),
      titleTextStyle: TextStyle(fontSize: 20, color: Colors.black),
      actions: [
        MyButton(
          text: "OK",
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
      ],
    );
  }
}
