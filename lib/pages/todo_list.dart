import 'package:flutter/material.dart';
import '../widgets/add_todo_fab.dart';
import '../widgets/custom_sliver.dart';
import '../widgets/todo_item.dart';
import 'add_todo.dart';

class TodoList extends StatefulWidget {
  @override
  createState() => new TodoListState();
}

class TodoListState extends State<TodoList> {
  List<String> _todoItems = [];

  void _addTodoItem(String task) {
    setState(() {
      int index = _todoItems.length;
      _todoItems.add(task);
    });
  }

  Widget _buildTodoList() {
    return new ListView.builder(
      itemBuilder: (context, index) {
        if (index < _todoItems.length) {
          return Dismissible( 
            background: _stackBehindDismiss(),
            direction: DismissDirection.endToStart,
            key: Key(_todoItems[index]),           
            child: buildTodoItem(_todoItems[index]),            
            onDismissed: (direction){
              _todoItems.removeAt(index);
              Scaffold.of(context).showSnackBar(
                SnackBar(
                  content: Text("Todo cancelled."),
                  action: SnackBarAction(                    
                    label: "UNDO",
                    onPressed: (){

                    },
                  ),
                )                
              );              
            },
          );
        }
      },
    );
  }

  Widget _stackBehindDismiss(){
    return Container(
      alignment: Alignment.centerRight,
      padding: EdgeInsets.only(right: 20.0),
      color: Colors.red,
      child: Icon(
        Icons.delete,
        color: Colors.white,),
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