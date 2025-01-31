import 'package:flutter/material.dart';
import 'package:todolist/task.dart';
import 'package:todolist/todo_tile.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final _editTaskController = TextEditingController();
  final _addTaskController = TextEditingController();

  final List<Task> tasks = [
    Task(content: "Create a project"),
    Task(content: "Watch a tutorial"),
  ];

  void addTask() {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text(
            "Enter new task",
            style: TextStyle(
              color: Colors.white,
              fontSize: 32,
            ),
            textAlign: TextAlign.center,
          ),
          content: SizedBox(
            height: 125,
            child: Column(
              children: [
                TextField(
                  controller: _addTaskController,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderSide: BorderSide.none,
                      borderRadius: BorderRadius.circular(20),
                    ),
                    fillColor: Colors.white,
                    filled: true,
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Row(
                  children: [
                    Expanded(
                      child: ElevatedButton(
                        onPressed: () {
                          Navigator.pop(context);
                          _editTaskController.clear();
                        },
                        style: ElevatedButton.styleFrom(
                          elevation: 0,
                        ),
                        child: Text(
                          "Cancel",
                          style: TextStyle(
                            color: Colors.indigo,
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Expanded(
                      child: ElevatedButton(
                        onPressed: () {
                          setState(() {
                            tasks.add(
                                Task(content: _addTaskController.text.trim()));
                          });
                          Navigator.pop(context);
                          _editTaskController.clear();
                        },
                        style: ElevatedButton.styleFrom(
                          elevation: 0,
                        ),
                        child: Text(
                          "Add",
                          style: TextStyle(
                            color: Colors.indigo,
                          ),
                        ),
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),
          backgroundColor: Colors.indigo,
        );
      },
    );
  }

  void deleteTask(index) {
    setState(() {
      tasks.removeAt(index);
    });
  }

  void editTask(index) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text(
            "Enter new content",
            style: TextStyle(
              color: Colors.white,
              fontSize: 32,
            ),
            textAlign: TextAlign.center,
          ),
          content: SizedBox(
            height: 125,
            child: Column(
              children: [
                TextField(
                  controller: _editTaskController,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderSide: BorderSide.none,
                      borderRadius: BorderRadius.circular(20),
                    ),
                    fillColor: Colors.white,
                    filled: true,
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Row(
                  children: [
                    Expanded(
                      child: ElevatedButton(
                        onPressed: () {
                          Navigator.pop(context);
                          _editTaskController.clear();
                        },
                        style: ElevatedButton.styleFrom(
                          elevation: 0,
                        ),
                        child: Text(
                          "Cancel",
                          style: TextStyle(
                            color: Colors.indigo,
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Expanded(
                      child: ElevatedButton(
                        onPressed: () {
                          setState(() {
                            tasks[index].content =
                                _editTaskController.text.trim();
                          });
                          Navigator.pop(context);
                          _editTaskController.clear();
                        },
                        style: ElevatedButton.styleFrom(
                          elevation: 0,
                        ),
                        child: Text(
                          "Confirm",
                          style: TextStyle(
                            color: Colors.indigo,
                          ),
                        ),
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),
          backgroundColor: Colors.indigo,
        );
      },
    );
  }

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
              onEdit: () => editTask(index),
              onDelete: () => deleteTask(index),
            );
          },
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: addTask,
        backgroundColor: Colors.indigo,
        child: Icon(
          Icons.add,
          color: Colors.white,
        ),
      ),
    );
  }
}
