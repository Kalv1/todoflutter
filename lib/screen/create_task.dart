import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todolist/components/tasks/task_form.dart';
import 'package:todolist/model/task.dart';

import '../data/task_collection.dart';

class CreateTask extends StatefulWidget {

  const CreateTask({Key? key}) : super(key: key);

  static String routeName = '/create_task';

  @override
  State<CreateTask> createState() => _CreateTask();

}

class _CreateTask extends State<CreateTask> {


  @override
  Widget build(BuildContext context) {
    return Consumer<TasksCollection>(
        builder: (context, task, child) => TaskForm(Task(-1, '', false)));
  }
}