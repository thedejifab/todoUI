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

  Widget taskField() {
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
  Widget build(BuildContext context) {}
}

Widget placeField() {
  return TextField(
    decoration: InputDecoration(
        // hintText: "Place",
        labelText: "Place"),
  );
}

class TimeField extends StatefulWidget {
  @override
  createState() => new TimeFieldState();
}

class TimeFieldState extends State<TimeField> {
  TimeOfDay _time = new TimeOfDay.now();
  String timeLabel = "Time";

  Future<Null> selectTime(BuildContext context) async {
    final TimeOfDay picked = await showTimePicker(
      context: context,
      initialTime: _time,
    );

    if (picked != _time && picked != null) {
      setState(() {
        _time = picked;
      });
    }
  }

  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        selectTime(context);
      },
      child: Container(
        color: Colors.transparent,
        child: IgnorePointer(
          child: new TextField(
            decoration: new InputDecoration(
              suffixIcon: new Icon(Icons.calendar_today),
              labelText: _time.toString(),
            ),
          ),
        ),
      ),
    );
  }
}

Widget timeField() {
//   return GestureDetector(
//               onTap:() {
//                 todoListState.selectTime(context);
//               },
//               child:Container(
//                 color:Colors.transparent,
//                 child:IgnorePointer(
//                   child:new TextField(
//                     decoration:new InputDecoration(
//                       suffixIcon:new Icon(Icons.calendar_today),
//                       labelText:todoListState.time.toString(),
//                     ),
//                   ),
//                 ),
// ),
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
