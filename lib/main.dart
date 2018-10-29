import 'package:flutter/material.dart';

void main() => runApp(new MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(title: 'Flutter Demo', home: new TodoList());
  }
}

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
          return _buildTodoItem(_todoItems[index]);
        }
      },
    );
  }

  Widget _buildTodoItem(String todoText) {
    return new ListTile(
      title: new Text(todoText),
    );
  }

  Widget _pushAddTodoScreen() {
    Navigator.of(context).push(new MaterialPageRoute(builder: (context) {
      return new Scaffold(
          appBar: new AppBar(
            title: new Text("Add a new task"),
            actions: <Widget>[
              IconButton(
                icon: new Icon(
                  Icons.tune,
                  semanticLabel: "reset",
                ),
                onPressed: (){
                  print("reset button pressed");
                },
              )
            ], 
          ),
          body: new Container(
            margin: const EdgeInsets.only(left: 30.0, right: 30.0),
            child: new Column(
              children: <Widget>[
                new Container(                    
                    width: double.infinity,          
                    height: 80.0,
                    child: new DropdownButton<String>(    
                      style: new TextStyle(
                        height: double.infinity
                      ),                
                      value: null,                      
                        items: <String>[
                          "Business",
                          "Personal",
                          "Family",
                          "Uncategorized"
                        ].map((String value) {
                          return new DropdownMenuItem<String>(
                            value: value,
                            child: new Text(value),
                          );
                        }).toList(),
                        onChanged: (_) {})),
                new SizedBox(height: 12.0),
                new TextField(
                  autofocus: true,
                  onSubmitted: (task) {
                    _addTodoItem(task);
                    Navigator.pop(context);
                  },
                  decoration: new InputDecoration(
                    hintText: "Task",
                  ),
                ),
                new SizedBox(height: 12.0),
                new TextField(
                  decoration: new InputDecoration(
                    hintText: "Place",
                  ),
                ),
                new SizedBox(height: 12.0),
                new TextField(
                  decoration: new InputDecoration(
                    hintText: "Time",
                  ),
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
                        onPressed: () {}))
              ],
            ),
          ));
    }));
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text("Todo App"),
      ),
      body: _buildTodoList(),
      floatingActionButton: new FloatingActionButton(
          onPressed: _pushAddTodoScreen,
          tooltip: "Add task",
          child: new Icon(Icons.add)),
    );
  }
}
