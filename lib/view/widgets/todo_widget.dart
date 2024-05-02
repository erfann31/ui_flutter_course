import 'package:flutter/material.dart';
import 'package:ui_flutter_course/model/consts.dart';
import 'package:ui_flutter_course/model/entities/task_model.dart';
import 'package:ui_flutter_course/view/screens/add_edit_todo_screen.dart';

class TodoWidget extends StatefulWidget {
  final bool showIconsRow;
  final Task task;
  final VoidCallback onDelete;
  final VoidCallback onComplete;
  TodoWidget({required this.showIconsRow, required this.task, required this.onDelete, required this.onComplete});

  @override
  State<TodoWidget> createState() => _TodoWidgetState();
}

class _TodoWidgetState extends State<TodoWidget> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {},
      child: Container(
        margin: EdgeInsets.symmetric(vertical: 10),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(16),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.4),
              blurRadius: 4,
              offset: Offset(0, 2),
            ),
          ],
        ),
        child: Padding(
          padding: EdgeInsets.all(20),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    widget.task.title,
                    style: TextStyle(
                      fontWeight: FontWeight.w700,
                      fontSize: 17,
                      color: Theme.of(context).primaryColor,
                    ),
                  ),
                  SizedBox(height: 8),
                  Text(
                    widget.task.description,
                    style: TextStyle(
                      fontWeight: FontWeight.w400,
                      fontSize: 12,
                      color: Colors.black,
                    ),
                  ),
                ],
              ),
              if (widget.showIconsRow)
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    IconButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => AddEditTodoScreen(
                              isEdit: true,
                            ),
                          ),
                        );
                      },
                      icon: Icon(
                        Icons.edit_outlined,
                        color: Theme.of(context).primaryColor,
                        size: 24,
                      ),
                    ),
                    IconButton(
                      onPressed: widget.onDelete,
                      icon: Icon(
                        Icons.delete_outline,
                        color: Theme.of(context).primaryColor,
                        size: 24,
                      ),
                    ),
                    IconButton(
                      onPressed: widget.onComplete,
                      icon: Icon(
                        Icons.check_circle_outlined,
                        color: Theme.of(context).primaryColor,
                        size: 24,
                      ),
                    ),
                  ],
                ),
            ],
          ),
        ),
      ),
    );
  }
}
