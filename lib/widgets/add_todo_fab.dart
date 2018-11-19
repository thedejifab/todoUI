import 'package:flutter/material.dart';

class AddTodoFab extends StatelessWidget{
  Function _pushAddTodoScreen;
  AddTodoFab(this._pushAddTodoScreen);

  @override
  Widget build(BuildContext context){
    return FloatingActionButton(
      onPressed: _pushAddTodoScreen,
      tooltip: "Add task",
      child: new Icon(Icons.add));
  }
}
