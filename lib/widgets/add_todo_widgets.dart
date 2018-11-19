import 'package:flutter/material.dart';

Widget categoryIcon() {
  return Container(
    padding: const EdgeInsets.all(10.0),
    decoration: BoxDecoration(
      shape: BoxShape.circle,
      color: Colors.blue,
    ),
    child: Icon(
      Icons.work,
      size: 50.0,
    ),
  );
}

Widget categoryDropdown() {
  return Container(
    width: double.infinity,
    child: DropdownButton<String>(
        value: "Business",
        items: <String>["Business", "Personal", "Family", "Uncategorized"]
            .map((String value) {
          return DropdownMenuItem<String>(
            value: value,
            child: Text(
              value,
              style: TextStyle(fontSize: 15.0),
            ),
          );
        }).toList(),
        onChanged: (value) {
          setState() {}
        },
        isExpanded: true,
        hint: Text("Select Task Type")),
  );
}

class TaskField extends StatelessWidget {
  final Function _addTodoItem;
  final BuildContext context;

  TaskField(this._addTodoItem, this.context);

  Widget taskField(){
    return TextField(
      autofocus: true,
      onSubmitted: (task) {
        _addTodoItem(task);
        Navigator.pop(context);
      },
      decoration: InputDecoration(
          // hintText: "Task",
          labelText: "Task"),
    );
  }

  @override
  Widget build(BuildContext context) {    
  }
}

Widget placeField() {
  return TextField(
    decoration: InputDecoration(
        // hintText: "Place",
        labelText: "Place"),
  );
}

Widget timeField() {
  return TextField(
    decoration: InputDecoration(
        // hintText: "Time",
        labelText: "Time"),
  );
}

Widget addButton() {
  return ButtonTheme(
      minWidth: double.infinity,
      child: RaisedButton(
          child: Text(
            "ADD  TODO",
            style: TextStyle(color: Colors.white),
          ),
          elevation: 4.0,
          padding: EdgeInsets.all(15.0),
          color: Colors.blue,
          splashColor: Colors.blueGrey,
          onPressed: () {}));
}
