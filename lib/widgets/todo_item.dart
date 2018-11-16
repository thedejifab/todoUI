import 'package:flutter/material.dart';

class TodoItem extends StatelessWidget {
  final String todoText;
  TodoItem(this.todoText);

  @override
  Widget build(BuildContext context) {
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
}
