import 'package:flutter/material.dart';
import '../widgets/add_todo_widgets.dart';

class AddTodo extends StatelessWidget {
  final Function _addTodoItem;
  AddTodo(this._addTodoItem);

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
        appBar: new AppBar(
          title: new Text("Add a new task"),
          actions: <Widget>[
            IconButton(
              icon: new Icon(
                Icons.tune,
                semanticLabel: "reset",
              ),
              onPressed: () {
                print("reset button pressed");
              },
            )
          ],
        ),
        body: new Container(
          margin: const EdgeInsets.only(left: 30.0, right: 30.0),
          child: new Column(
            children: <Widget>[
              new SizedBox(height: 50.0),
              new Center(
                child: categoryIcon(),
              ),
              new SizedBox(height: 12.0),
              categoryDropdown(),
              new SizedBox(height: 12.0),
              TaskField(_addTodoItem, context).taskField(),
              new SizedBox(height: 12.0),
              placeField(),
              new SizedBox(height: 12.0),
              timeField(),
              new SizedBox(height: 30.0),
              addButton(),
            ],
          ),
        ));
  }
}
