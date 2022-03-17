import 'dart:math';
import 'package:dio/dio.dart';
import 'package:faker/faker.dart';
import 'package:todolist/model/task.dart';

var tasks = List<Task>.generate(20,
    (index) => Task(index, faker.lorem.sentence(), Random().nextBool()));
