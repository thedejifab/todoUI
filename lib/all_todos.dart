import 'package:flutter/material.dart';
import 'todo.dart';
import 'custom_sliver.dart';

class AllTodosView extends StatelessWidget{
  TodoListState todoListState = new TodoListState();
  
  @override
  Widget build(BuildContext context){
    return new Scaffold(
      body: DefaultTabController(
        length: 2,
        child: NestedScrollView(
          headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
            return <Widget>[
              CustomSliverBar(),
              new SliverPadding(
                padding:
                    new EdgeInsets.only(left: 16.0, right: 16.0, top: 16.0),
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
          body: todoListState.buildTodoList(),
        ),
      ),
      floatingActionButton: new FloatingActionButton(
          onPressed: todoListState.pushAddTodoScreen,
          tooltip: "Add task",
          child: new Icon(Icons.add)),
    );
  }
}