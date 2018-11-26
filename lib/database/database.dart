import 'dart:async';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import '../models/todo_data.dart';

Database db;

initDb() async {
  var databasesPath = await getDatabasesPath();
  String path = join(databasesPath, "todos.db");

  db = await openDatabase(path, version: 1, onCreate: _onCreate);
  return db;
}

void _onCreate(Database db, int newVersion) async {
  await db.execute("""CREATE TABLE Todos (
      id INTEGER PRIMARY KEY,
      task TEXT,
      category TEXT,
      place TEXT,
      time TEXT)""");
  print("Tables created");
}

void insertTodo(Todo todo) async {
  await db.transaction((transaction) async {
    await transaction.rawInsert(
        'INSERT INTO Todos(task, category, place, time ) VALUES(' +
            '\'' +
            todo.task +
            '\'' +
            ',' +
            '\'' +
            todo.category +
            '\'' +
            ',' +
            '\'' +
            todo.place +
            '\'' +
            ',' +
            '\'' +
            todo.time +
            '\'' +
            ')'
        );
  });
  print("TODO added");
}

Future<List<Todo>> getTodos() async {
  List<Map> list = await db.rawQuery('SELECT * FROM Todos');
  List<Todo> todos = new List();

  for (int i = 0; i < list.length; i++) {
    todos.add(new Todo(
        task: list[i]["task"],
        category: list[i]["category"],
        place: list[i]["place"],
        time: list[i]["time"]));
  }
  return todos;
}

void deleteTodo(int id) async{
  await db.rawDelete("DELETE FROM Todo WHERE id = ?", ['$id']);
}


