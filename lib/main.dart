import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:todolist/data/task_collection.dart';
import 'package:todolist/screen/all_tasks.dart';
import 'package:todolist/screen/create_task.dart';
import 'package:todolist/screen/one_task.dart';

void main() {
  runApp(ChangeNotifierProvider(
    create: (context) => TasksCollection(),
    child: const TodoList(),
  ));
}

class TodoList extends StatelessWidget {
  const TodoList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const AllTasks(title: 'Todo list'),
      initialRoute: AllTasks.routeName,
      routes: {
        AllTasks.routeName: (context) => const AllTasks(title: 'Todo list'),
        OneTask.routeName: (context) => const OneTask(),
        CreateTask.routeName: (context) => const CreateTask(),
      },
    );
  }
}
