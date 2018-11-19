import 'package:flutter/material.dart';

Widget buildTodoItem(String task) {
  return Container(
    padding: EdgeInsets.only(left: 20.0, right: 20.0),
    child: Column(
      children: <Widget>[
        ListTile(
          title: Text(
            task,
            style: TextStyle(fontWeight: FontWeight.w600),
          ),
          subtitle: Text("Additional info about task"),
          leading: Container(
            padding: const EdgeInsets.all(5.0),
            decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.transparent,
                border: Border.all(color: Colors.grey, width: 1.0)),
            child: Icon(
              Icons.work,
              color: Colors.blue,
            ),
          ),
          trailing: Text("9am"),
        ),
        Divider(color: Colors.grey)
      ],
    ),
  );
}
