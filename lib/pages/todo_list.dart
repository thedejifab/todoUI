import 'package:flutter/material.dart';
import '../widgets/add_todo_fab.dart';
import '../widgets/custom_sliver.dart';
import '../widgets/todo_item.dart';
import 'add_todo.dart';
import '../models/todo_data.dart';

class TodoList extends StatefulWidget {
  @override
  createState() => new TodoListState();
}

class TodoListState extends State<TodoList> {
  List<Todo> _todoList = [];

  void _addTodoItem(String task, String place) {
    setState(() {
      int index = _todoList.length;
      _todoList.add(
          Todo(task: task, category: "Biz", place: place, time: "12:30pm"));
    });
  }

  void _deleteItem(index) {
    _todoList.removeAt(index);
  }

  void _undoDeleteItem(index, item) {
    setState(() {
      _todoList.insert(index, item);
    });
  }

  Widget _buildTodoList() {
    return new ListView.builder(
      itemBuilder: (context, index) {
        if (index < _todoList.length) {
          return Dismissible(
            background: _stackBehindDismiss(),
            direction: DismissDirection.endToStart,
            key: ObjectKey(_todoList[index]),
            child: buildTodoItem(_todoList[index].task, _todoList[index].place,
                _todoList[index].time, _todoList[index].category),
            onDismissed: (direction) {
              var item = _todoList.elementAt(index);
              setState(() {
                _deleteItem(index);
                Scaffold.of(context).showSnackBar(SnackBar(
                  content: Text("Todo deleted."),
                  action: SnackBarAction(
                    label: "UNDO",
                    onPressed: () {
                      _undoDeleteItem(index, item);
                    },
                  ),
                ));
              });
            },
          );
        }
      },
    );
  }

  Widget _stackBehindDismiss() {
    return Container(
      alignment: Alignment.centerRight,
      padding: EdgeInsets.only(right: 20.0),
      color: Colors.red,
      child: Icon(
        Icons.delete,
        color: Colors.white,
      ),
    );
  }

  Widget _pushAddTodoScreen() {
    Navigator.of(context).push(new MaterialPageRoute(builder: (context) {
      return AddTodo(_addTodoItem);
    }));
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      body: NestedScrollView(
        headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
          return <Widget>[
            CustomSliverAppBar(),
            new SliverPadding(
              padding: new EdgeInsets.only(left: 16.0, right: 16.0, top: 16.0),
              sliver: new SliverList(
                delegate: new SliverChildListDelegate([
                  new Text(
                    "INBOX",
                    textAlign: TextAlign.left,
                    style: TextStyle(
                        color: Colors.grey, fontWeight: FontWeight.bold),
                  ),
                ]),
              ),
            ),
          ];
        },
        body: _buildTodoList(),
      ),
      floatingActionButton: AddTodoFab(_pushAddTodoScreen),
    );
  }
}
