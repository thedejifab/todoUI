import 'package:flutter/material.dart';

void main() => runApp(new MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.

  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
        title: 'Flutter Demo',
        home: new TodoList(),
        debugShowCheckedModeBanner: false);
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
    return new Container(
      padding: EdgeInsets.only(left: 20.0, right: 20.0),
      child: new Column(
        children: <Widget>[
          new ListTile(
            title: new Text(
              todoText,
              style: TextStyle(fontWeight: FontWeight.w600),
            ),
            subtitle: new Text("Additional info about task"),
            leading: new Container(
              padding: const EdgeInsets.all(5.0),
              decoration: new BoxDecoration(
                  shape: BoxShape.circle,
                  color: Colors.transparent,
                  border: Border.all(color: Colors.grey, width: 1.0)),
              child: new Icon(
                Icons.work,
                color: Colors.blue,
              ),
            ),
            trailing: new Text("9am"),
          ),
          new Divider(color: Colors.grey)
        ],
      ),
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
                        "Family",
                        "Uncategorized"
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
                  autofocus: true,
                  onSubmitted: (task) {
                    _addTodoItem(task);
                    Navigator.pop(context);
                  },
                  decoration: new InputDecoration(
                      // hintText: "Task",
                      labelText: "Task"),
                ),
                new SizedBox(height: 12.0),
                new TextField(
                  decoration: new InputDecoration(
                      // hintText: "Place",
                      labelText: "Place"),
                ),
                new SizedBox(height: 12.0),
                new TextField(
                  decoration: new InputDecoration(
                      // hintText: "Time",
                      labelText: "Time"),
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
      body: NestedScrollView(
        headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
          return <Widget>[
            SliverAppBar(
              expandedHeight: 200.0,
              floating: false,
              pinned: false,
              flexibleSpace: FlexibleSpaceBar(
                  centerTitle: true,
                  title: new Container(
                      padding: EdgeInsets.only(bottom: 30.0, right: 140.0),
                      // alignment: Alignment.center,
                      child: new Opacity(
                        opacity: 0.95,
                        child: new Text("Your \nTodos",
                            textAlign: TextAlign.left,
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 25.0,
                                fontWeight: FontWeight.w400)),
                      )),
                  background: new Image.asset(
                    'assets/background.jpg',
                    fit: BoxFit.cover,
                  )),
              // leading: new Icon(Icons.),
              leading: new Icon(Icons.menu),
              actions: <Widget>[
                new SingleChildScrollView(                
                  child: new Container(
                      alignment: Alignment.bottomCenter,
                      child: new Column(
                        children: <Widget>[
                          new Container(
                            child: new Row(
                              children: <Widget>[
                                new Column(
                                  children: <Widget>[
                                    new Text(
                                      "24",
                                      style: TextStyle(fontSize: 25.0),
                                    ),
                                    new Text(
                                      "Personal",
                                      style: TextStyle(
                                          fontWeight: FontWeight.w400,
                                          color: Colors.grey),
                                    )
                                  ],
                                ),
                                new SizedBox(
                                  width: 15.0,
                                ),
                                new Column(
                                  children: <Widget>[
                                    new Text(
                                      "15",
                                      style: TextStyle(fontSize: 25.0),
                                    ),
                                    new Text(
                                      "Business",
                                      style: TextStyle(
                                          fontWeight: FontWeight.w400,
                                          color: Colors.grey),
                                    )
                                  ],
                                ),
                              ],
                            ),
                          ),
                          new Container(
                            child: new Text("65% done"),
                          )
                        ],
                      )),
                )
              ],
            ),
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
      floatingActionButton: new FloatingActionButton(
          onPressed: _pushAddTodoScreen,
          tooltip: "Add task",
          child: new Icon(Icons.add)),
    );
  }
}
