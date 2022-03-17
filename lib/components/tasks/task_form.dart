import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:todolist/components/tasks/task_master.dart';
import 'package:todolist/data/task_collection.dart';
import 'package:todolist/screen/all_tasks.dart';

import '../../model/task.dart';

class TaskForm extends StatefulWidget {
  final Task task;

  const TaskForm(this.task, {Key? key}) : super(key: key);

  @override
  State<TaskForm> createState() => _TaskForm();
}

class _TaskForm extends State<TaskForm> {
  final _formKey = GlobalKey<FormState>();
  String newName = '';


  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: widget.task.content == '' ? Text('Create task', style: GoogleFonts.outfit()) : Text('Edit task', style: GoogleFonts.outfit()),
        ),
        body: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              TextFormField(
                initialValue: widget.task.content,
                decoration: const InputDecoration(
                  border: UnderlineInputBorder(),
                  labelText: 'Enter the name of new task',
                ),
                // The validator receives the text that the user has entered.
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter some text';
                  }
                  newName = value;
                  return null;
                },
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 16.0),
                child: ElevatedButton(
                  onPressed: () {
                    // Validate returns true if the form is valid, or false otherwise.
                    if (_formKey.currentState!.validate()) {
                      if(widget.task.content == '') {
                        widget.task.content = newName;
                        Provider.of<TasksCollection>(context, listen: false).create(widget.task);
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(content: Text('Task succesfully added')),
                        );
                      } else {
                        Provider.of<TasksCollection>(context, listen: false).updateContent(widget.task, newName);
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(content: Text('New name set.')),
                        );
                      }
                      Navigator.pushNamed(context, AllTasks.routeName);
                    }
                  },
                  child: const Text('Submit'),
                ),
              ),
            ],
          ),
        ));
  }
}
