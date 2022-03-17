import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:todolist/model/task.dart';

class TaskPreview extends StatefulWidget {
  late Task task;

  Function parentCall;

  int index;

  TaskPreview(this.task, this.parentCall, this.index, {Key? key}) : super(key: key);

  @override
  State<TaskPreview> createState() => _TaskPreview();
}

class _TaskPreview extends State<TaskPreview> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () { widget.parentCall(widget.index); },
      child: Container(
          height: 50,
          color: widget.task.completed ? Colors.lightGreen : Colors.redAccent,
          child: Row(
            children: [
              Flexible(child: Center(child: Text(widget.task.content))),
              widget.task.completed ? const Icon(Icons.delete) : const Icon(Icons.done)
            ],
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
          )),
    );
  }
}
