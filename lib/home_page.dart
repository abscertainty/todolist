import 'package:flutter/material.dart';
import 'package:todolist/task.dart';
import 'package:todolist/todo_tile.dart';

class HomePage extends StatelessWidget {
  HomePage({super.key});

  final List<Task> tasks = [
    Task(content: "Create a project"),
    Task(content: "Watch a tutorial"),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.indigo,
      ),
      body: Center(
        child: ListView.builder(
          itemCount: tasks.length,
          itemBuilder: (context, index) {
            return TodoTile(
              content: tasks[index].content,
            );
          },
        ),
      ),
    );
  }
}
