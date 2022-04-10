import 'package:bloc_expert/model/todo.model.dart';
import 'package:flutter/material.dart';

class TodoListProvider with ChangeNotifier {
  final List<TodoModel> _todoList = [];
  List<TodoModel> get todoList => _todoList;
}