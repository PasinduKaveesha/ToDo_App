import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:test_app_for_flutter/util/button.dart';
import 'package:test_app_for_flutter/util/delete_box.dart';
import 'package:test_app_for_flutter/util/warning_Box.dart';

// ignore: must_be_immutable
class TodoTile extends StatefulWidget {
  String taskName;
  final bool taskCompleted;
  final Function(bool?)? onChanged;
  final Function(BuildContext)? deleteFunction;

  TodoTile({
    super.key,
    required this.taskName,
    required this.taskCompleted,
    required this.onChanged,
    required this.deleteFunction,
  });

  @override
  _TodoTileState createState() => _TodoTileState();
}

class _TodoTileState extends State<TodoTile> {
  TextEditingController updatingtext = TextEditingController();

  void updateTile(BuildContext context) {
    updatingtext.text = widget.taskName;

    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          backgroundColor: Colors.yellow,
          title: Text('Update Task'),
          content: TextField(
            controller: updatingtext,
          ),
          actions: [
            MyButton(
              text: "Update",
              onPressed: () {
                if (updatingtext.text.isEmpty) {
                  showDialog(
                    context: context,
                    builder: (BuildContext context) {
                      return const WarningDialog();
                    },
                  );
                } else {
                  setState(() {
                    widget.taskName = updatingtext.text;
                  });
                  Navigator.of(context).pop();
                }
              },
            ),
            MyButton(
              text: "Cancel",
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 24, right: 24, top: 5, bottom: 7),
      child: Slidable(
        endActionPane: ActionPane(motion: StretchMotion(), children: [
          SlidableAction(
            onPressed: (context) =>
                DeleteDialog(context, widget.deleteFunction),
            icon: Icons.delete,
            backgroundColor: Colors.red.shade300,
            borderRadius: BorderRadius.circular(12),
          )
        ]),
        child: GestureDetector(
          onLongPress: () => updateTile(context),
          child: Container(
            padding: const EdgeInsets.all(24),
            width: double.infinity,
            decoration: BoxDecoration(
              color: const Color.fromARGB(255, 249, 181, 64),
              borderRadius: BorderRadius.circular(12),
            ),
            child: Row(
              children: [
                // Checkbox
                Transform.scale(
                  scale: 1.5,
                  child: Checkbox(
                    value: widget.taskCompleted,
                    onChanged: widget.onChanged,
                    activeColor: Colors.yellow,
                    checkColor: Colors.black,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                ),
                // Task name
                Text(
                  widget.taskName,
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Colors.black87,
                    decoration: widget.taskCompleted
                        ? TextDecoration.lineThrough
                        : TextDecoration.none,
                  ),
                  maxLines: 2,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
