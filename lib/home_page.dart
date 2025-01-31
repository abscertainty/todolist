import 'package:flutter/material.dart';
import 'package:todolist/task.dart';
import 'package:todolist/todo_tile.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final List<Task> tasks = [
    Task(content: "Create a project"),
    Task(content: "Watch a tutorial"),
  ];

  // todo
  void deleteTask(index) {
    setState(() {
      tasks.removeAt(index);
    });
  }

  // todo
  void editTask(index, String newContent) {}

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
              onEdit: () => editTask(index, ""),
              onDelete: () => deleteTask(index),
            );
          },
        ),
      ),
    );
  }
}
