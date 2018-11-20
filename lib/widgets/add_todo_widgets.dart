import 'package:flutter/material.dart';

TextEditingController taskController = TextEditingController();
TextEditingController placeController = TextEditingController();
TextEditingController timeController = TextEditingController();

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

FocusNode textNode2 = new FocusNode();
Widget taskField(context) {
  return TextFormField(    
    autofocus: true,
    controller: taskController,
    decoration: InputDecoration(labelText: "Task"),
    onFieldSubmitted: (String value){
      FocusScope.of(context).requestFocus(textNode2);
    },
  );
}

class SubmitTodo extends StatelessWidget {
  final Function _addTodoItem;
  final BuildContext context;

  SubmitTodo(this._addTodoItem, this.context);

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
            onPressed: () {
              _addTodoItem(taskController.text, placeController.text);
              print("The time is ${timeController.text}");
              Navigator.pop(context);
            }));
  }

  @override
  Widget build(BuildContext context) {}
}

Widget placeField() {  
  return TextFormField(
    focusNode: textNode2,  
    controller: placeController,  
    decoration: InputDecoration(labelText: "Place"),
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
        timeController.text = picked.toString();
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
          child: new TextFormField(
            controller: timeController,            
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

