import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:todolist/components/tasks/task_master.dart';
import 'package:todolist/data/task_collection.dart';
import 'package:todolist/data/tasks.dart' as data;
import 'package:todolist/screen/create_task.dart';

import '../model/task.dart';

class AllTasks extends StatefulWidget {
  const AllTasks({Key? key, required this.title}) : super(key: key);

  static String routeName = '/all_task';

  final String title;

  @override
  State<AllTasks> createState() => _AllTasksState();
}

class _AllTasksState extends State<AllTasks> {
  List<Task> tasks = data.tasks;

  void deleteTaskFromData(Task task) {
    setState(() {
      tasks.remove(task);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<TasksCollection>(
        builder: (context, task, child) => Scaffold(
              floatingActionButton: FloatingActionButton(
                onPressed: () {
                  Navigator.pushNamed(context, CreateTask.routeName);
                },
                tooltip: 'Create Task',
                child: const Icon(Icons.add),
              ),
              appBar: AppBar(
                title: Text(widget.title, style: GoogleFonts.outfit()),
              ),
              body: TaskMaster(task.getAllTask(), deleteTaskFromData),
            ));
  }
}
