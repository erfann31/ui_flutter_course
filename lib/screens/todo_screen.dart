import 'package:flutter/material.dart';
import 'package:ui_flutter_course/screens/add_edit_todo_screen.dart';
import 'package:ui_flutter_course/widgets/todo_widget.dart';

class ToDoScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 80,
        backgroundColor: Theme.of(context).primaryColor,
        title: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Text(
            "TODO APP",
            style: TextStyle(
              fontWeight: FontWeight.w700,
              fontSize: 24,
              color: Colors.white,
            ),
          ),
        ),
        actions: [
          Padding(
            padding: EdgeInsets.only(
              right: 20,
            ),
            child: Icon(Icons.calendar_today_outlined, color: Colors.white, size: 32),
          ),
        ],
      ),
      body: Expanded(
        child: ListView.builder(
          padding: EdgeInsets.all(10),
          shrinkWrap: true,
          itemCount: 4,
          itemBuilder: (BuildContext context, index) {
            return TodoWidget(
              showIconsRow: true,
            );
          },
        ),
      ),
      floatingActionButton: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Container(
          width: 75,
          height: 75,
          child: FloatingActionButton(
            elevation: 5,
            shape: CircleBorder(),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => AddEditTodoScreen(
                    isEdit: false,
                  ),
                ),
              );
            },
            backgroundColor: Theme.of(context).primaryColor,
            child: Icon(
              Icons.add,
              color: Colors.white,
              size: 32,
            ),
          ),
        ),
      ),
    );
  }
}
