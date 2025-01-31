import 'package:flutter/material.dart';

class TodoTile extends StatefulWidget {
  final String content;
  final VoidCallback onEdit;
  final VoidCallback onDelete;

  const TodoTile({
    super.key,
    required this.content,
    required this.onEdit,
    required this.onDelete,
  });

  @override
  State<TodoTile> createState() => _TodoTileState();
}

class _TodoTileState extends State<TodoTile> {
  String? _content;
  VoidCallback? onEdit;
  VoidCallback? onDelete;
  @override
  void initState() {
    super.initState();
    _content = widget.content;
    onEdit = widget.onEdit;
    onDelete = widget.onDelete;
  }

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
      child: Row(
        children: [
          Text(
            _content ?? "Null",
            style: TextStyle(
              color: Colors.white,
              fontSize: 30,
            ),
            textAlign: TextAlign.start,
          ),
          Spacer(),
          //! Edit button
          IconButton(
            onPressed: onEdit,
            icon: Icon(
              Icons.edit,
              color: Colors.white,
            ),
          ),
          //! Delete button
          IconButton(
            onPressed: onDelete,
            icon: Icon(
              Icons.delete,
              color: Colors.white,
            ),
          ),
          Padding(
            padding: EdgeInsets.only(
              right: 7,
            ),
          )
        ],
      ),
    );
  }
}
