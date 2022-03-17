import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:todolist/components/tasks/task_form.dart';
import 'package:todolist/model/task.dart';

import '../data/task_collection.dart';

class OneTask extends StatefulWidget {
  const OneTask({Key? key}) : super(key: key);

  static String routeName = '/one_task';

  @override
  State<OneTask> createState() => _OneTask();
}

class _OneTask extends State<OneTask> {
  @override
  Widget build(BuildContext context) {
    final args = ModalRoute.of(context)!.settings.arguments as Task;

    return Consumer<TasksCollection>(
        builder: (context, task, child) => TaskForm(args));
  }
}
