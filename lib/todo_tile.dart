import 'package:flutter/material.dart';

class TodoTile extends StatefulWidget {
  final String content;
  const TodoTile({
    super.key,
    required this.content,
  });

  @override
  State<TodoTile> createState() => _TodoTileState();
}

class _TodoTileState extends State<TodoTile> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(7),
      height: 75,
      alignment: Alignment.centerLeft,
      padding: EdgeInsets.only(
        left: 12,
      ),
      decoration: BoxDecoration(
        color: Colors.indigo,
        borderRadius: BorderRadius.circular(10.0),
      ),
      child: Text(
        widget.content,
        style: TextStyle(
          color: Colors.white,
          fontSize: 30,
        ),
        textAlign: TextAlign.start,
      ),
    );
  }
}
