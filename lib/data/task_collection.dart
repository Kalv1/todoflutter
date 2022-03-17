import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:todolist/data/tasks.dart' as data;

import '../model/task.dart';


class TasksCollection extends ChangeNotifier {

  late final List<Task> tasks = [];

  late Dio dio;
  late Response response;


  BaseOptions options = BaseOptions(
      baseUrl: "https://jsonplaceholder.typicode.com",
      connectTimeout: 5000,
      receiveTimeout: 3000,
  );

  void create(Task task) async {
    var dio = Dio(options);
    task.id = tasks.last.id + 1;
    tasks.add(task);
    response = await dio.post('/todos', data: task.toJson());
    if(response.statusCode != 201){
      print('ça marche pas');
    }

    notifyListeners();
  }

  void update(Task task) async {
    var res = tasks.indexOf(task);
    var element = tasks[res];
    var id = task.id;
    element.completed = !element.completed;
    response = await dio.put('/todos/$id', data: { 'completed' : element.completed });
    if(response.statusCode != 200){
      print('ça marche pas');
    }

    notifyListeners();
  }

  void updateContent(Task task, String newContent) async{
    var dio = Dio(options);
    var id = task.id;
    response = await dio.put('/todos/$id', data: { 'content' : newContent });
    if(response.statusCode != 200){
      print('ça marche pas');
    }
    var res = tasks.indexOf(task);
    var element = tasks[res];
    element.content = newContent;

    notifyListeners();
  }

  Future<List<Task>> getAllTask() async {
    await fetchTasks();
    return tasks;
  }

  Future<void> fetchTasks() async {
    var dio = Dio(options);
    try {
      response = await dio.request("/todos");

      if (response.statusCode == 200) {
        for (var record in response.data) {
          var task = Task.fromJson(record);
          tasks.add(task);
        }
      } else {
        // ignore: avoid_print
        print("error");
      }
    } catch (e) {
      // ignore: avoid_print
      print(e);
    }
  }

  void delete(Task task) async {
    var dio = Dio(options);
    var id = task.id;
    response = await dio.delete('/todos/$id');
    if(response.statusCode != 200){
      print('ça marche pas');
    }

    tasks.remove(task);
    notifyListeners();
  }
}