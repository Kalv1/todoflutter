import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todolist/data/task_collection.dart';
import 'package:todolist/model/task.dart';

class TaskDetails extends StatefulWidget {
  late Task task;

  Function parentCall;

  TaskDetails(this.task, this.parentCall, {Key? key}) : super(key: key);

  @override
  State<TaskDetails> createState() => _TaskDetails();
}

class _TaskDetails extends State<TaskDetails> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
          child: Column(
        children: [
          Text(widget.task.content),
          Text(widget.task.completed ? 'A faire' : 'Fini'),
          Text(widget.task.createdAt.toString()),
          Row(
            children: [
              TextButton(
                style: TextButton.styleFrom(
                  primary: Colors.red,
                  textStyle: const TextStyle(fontSize: 20),
                ),
                onPressed: () {
                  final snackBar = SnackBar(
                    content: const Text('Are u sure ?'),
                    action: SnackBarAction(
                      label: 'Yes',
                      textColor: Colors.green,
                      onPressed: () {
                        widget.parentCall(widget.task);
                        Provider.of<TasksCollection>(context, listen: false).delete(widget.task);
                      },
                    ),
                  );
                  ScaffoldMessenger.of(context).showSnackBar(snackBar);
                },
                child: const Text('Delete'),
              ),
              TextButton(
                style: TextButton.styleFrom(
                  primary: Colors.green,
                  textStyle: const TextStyle(fontSize: 20),
                ),
                onPressed: () {
                  Provider.of<TasksCollection>(context, listen: false).update(widget.task);
                },
                child: widget.task.completed ? const Text('Fini') : const Text('A faire'),
              ),
              TextButton(
                style: TextButton.styleFrom(
                  primary: Colors.blue,
                  textStyle: const TextStyle(fontSize: 20),
                ),
                onPressed: () {
                  Navigator.pushNamed(context, '/one_task', arguments: widget.task);
                },
                child: const Text('Update'),
              ),
            ],
          )
        ],
      )),
      padding: EdgeInsets.all(15.0),
    );
  }
}
