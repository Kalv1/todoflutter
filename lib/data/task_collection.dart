import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:todolist/data/tasks.dart' as data;

import '../model/task.dart';


class TasksCollection extends ChangeNotifier {

  late final List<Task> tasks = data.tasks;

  late Dio dio;
  late Response response;


  BaseOptions options = BaseOptions(
      baseUrl: "https://jsonplaceholder.typicode.com",
      connectTimeout: 5000,
      receiveTimeout: 3000,
  );

  void create(Task task){
    task.id = tasks.last.id + 1;
    tasks.add(task);
    notifyListeners();
  }

  void update(Task task){
    var res = tasks.indexOf(task);
    var element = tasks[res];
    element.completed = !element.completed;
    notifyListeners();
  }

  void updateContent(Task task, String newContent){
    var res = tasks.indexOf(task);
    var element = tasks[res];
    element.content = newContent;
    notifyListeners();
  }

  List<Task> getAllTask(){
    return tasks;
  }

  void delete(Task task){
    tasks.remove(task);
    notifyListeners();
  }
}