import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:ui_flutter_course/screens/add_edit_todo_screen.dart';

class TodoWidget extends StatelessWidget {
  final bool showIconsRow;

  TodoWidget({required this.showIconsRow});

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.white,
      elevation: 4,
      margin: EdgeInsets.symmetric(vertical: 10),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12.0),
      ),
      child: Padding(
        padding: EdgeInsets.symmetric(vertical: 20, horizontal: 20),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "TODO TITLE",
                  style: TextStyle(
                    fontWeight: FontWeight.w700,
                    fontSize: 18,
                    color: Theme.of(context).primaryColor,
                  ),
                ),
                SizedBox(height: 8),
                Text(
                  "TODO SUB TITLE",
                  style: TextStyle(
                    fontWeight: FontWeight.w300,
                    fontSize: 12,
                    color: Colors.black,
                  ),
                ),
              ],
            ),
            if (showIconsRow)
              Row(
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
                  SizedBox(width: 16),
                  IconButton(
                    onPressed: () {},
                    icon: Icon(
                      Icons.delete_outline,
                      color: Theme.of(context).primaryColor,
                      size: 24,
                    ),
                  ),
                  SizedBox(width: 16),
                  IconButton(
                    onPressed: () {},
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
    );
  }
}
