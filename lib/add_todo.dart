import 'package:flutter/material.dart';
import 'todo.dart';

class AddNewTodo extends StatelessWidget {
  final TodoListState todoListState = new TodoListState();

  AddNewTodo();

  @override
  Widget build(BuildContext context) {
    return new SingleChildScrollView(
          child: new Container(
        margin: const EdgeInsets.only(left: 30.0, right: 30.0),
        child: new Column(
          children: <Widget>[
            new SizedBox(height: 50.0),
            new Center(
              child: new Container(
                padding: const EdgeInsets.all(10.0),
                decoration: new BoxDecoration(
                  shape: BoxShape.circle,
                  color: Colors.blue,
                ),
                child: Icon(
                  Icons.work,
                  size: 50.0,
                ),
              ),
            ),
            new SizedBox(height: 12.0),
            new Container(
              width: double.infinity,
              child: DropdownButton<String>(
                  value: "Business",
                  items: <String>[
                    "Business",
                    "Personal",
                  ].map((String value) {
                    return new DropdownMenuItem<String>(
                      value: value,
                      child: new Text(
                        value,
                        style: TextStyle(fontSize: 15.0),
                      ),
                    );
                  }).toList(),
                  onChanged: (value) {
                    setState() {}
                  },
                  isExpanded: true,
                  hint: new Text("Select Task Type")),
            ),
            new SizedBox(height: 12.0),
            new TextField(
              onSubmitted: (task) {
                todoListState.addTodoItem(task);
                Navigator.pop(context);
              },
              maxLength: 25,
              decoration: new InputDecoration(
                suffixIcon: new Icon(Icons.work),
                labelText: "Task",
              ),
            ),
            new SizedBox(height: 12.0),
            new TextField(
              maxLength: 50,
              decoration: new InputDecoration(
                suffixIcon: new Icon(Icons.place),
                labelText: "Place",
              ),
            ),
            new SizedBox(height: 12.0),
            new GestureDetector(
              onTap: () {
                todoListState.selectTime(context);
              },
              child: Container(
                color: Colors.transparent,
                child: IgnorePointer(
                  child: new TextField(
                    decoration: new InputDecoration(
                      suffixIcon: new Icon(Icons.calendar_today),
                      labelText: todoListState.time.toString(),
                    ),
                  ),
                ),
              ),
            ),
            new SizedBox(
              height: 12.0,
            ),
            new SizedBox(height: 30.0),
            new ButtonTheme(
                minWidth: double.infinity,
                child: new RaisedButton(
                    child: new Text(
                      "ADD NEW TODO",
                      style: new TextStyle(color: Colors.white),
                    ),
                    elevation: 4.0,
                    padding: EdgeInsets.all(15.0),
                    color: Colors.blue,
                    splashColor: Colors.blueGrey,
                    onPressed: () {
                      print("ADD Button Clicked");
                    }))
          ],
        ),
      )
      );    
  }
}
