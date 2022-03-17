import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:todolist/components/tasks/task_details.dart';
import 'package:todolist/components/tasks/task_preview.dart';
import 'package:todolist/model/task.dart';

class TaskMaster extends StatefulWidget {
  late List<Task>? tasks;


  Function parentDelete;

  TaskMaster(this.tasks, this.parentDelete, {Key? key}) : super(key: key);

  @override
  State<TaskMaster> createState() => _TaskMaster();
}

class _TaskMaster extends State<TaskMaster> {
  int cardid = -1;

  void showDetail(int index) {
    setState(() {
      if (index == cardid) {
        cardid = -1;
      } else {
        cardid = index;
      }
    });
  }

  void deletetask(Task task) {
    setState(() {
      cardid = -1;
      widget.parentDelete(task);
    });
  }

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      padding: const EdgeInsets.all(8),
      itemCount: widget.tasks!.length,
      itemBuilder: (BuildContext context, int index) {
        return index == cardid
            ? TaskDetails(widget.tasks![index], deletetask)
            : TaskPreview(widget.tasks![index], showDetail, index);
      },
      separatorBuilder: (BuildContext context, int index) => const Divider(),
    );
  }
}
