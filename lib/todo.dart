import 'package:flutter/material.dart';
import 'dart:async';
import 'todo_item.dart';
import 'add_todo.dart';
import 'all_todos.dart';

class TodoList extends StatefulWidget {
  @override
  createState() => new TodoListState();
}

class TodoListState extends State<TodoList> {
  List<String> todoItems = [];
  TimeOfDay time = new TimeOfDay.now();
  String timeLabel = "Time";

  Future<Null> selectTime(BuildContext context) async {
    final TimeOfDay picked = await showTimePicker(
      context: context,
      initialTime: time,
    );

    // if (picked != _time && picked != null) {
    setState(() {
      time = picked;
    });
    // }
  }

  void addTodoItem(String task) {
    setState(() {
      int index = todoItems.length;
      todoItems.add(task);
    });
  }

  Widget buildTodoList() {
    return new ListView.builder(
      itemBuilder: (context, index) {
        if (index < todoItems.length) {
          return buildTodoItem(todoItems[index]);
        }
      },
    );
  }

  Widget buildTodoItem(String todoText) {  
    return TodoItem(todoText);
  }

  Widget pushAddTodoScreen() {
    Navigator.of(context).push(new MaterialPageRoute(builder: (context) {
      return AddNewTodo();      
    }));
  }

  @override
  Widget build(BuildContext context) {
    return AllTodosView();
  }
}
