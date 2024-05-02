import 'package:flutter/material.dart';
import 'package:ui_flutter_course/model/consts.dart';
import 'package:ui_flutter_course/model/viewModel/task_viewmodel.dart';
import 'package:ui_flutter_course/view/screens/add_edit_todo_screen.dart';
import 'package:ui_flutter_course/view/widgets/todo_widget.dart';

class ToDoScreen extends StatefulWidget {
  @override
  State<ToDoScreen> createState() => _ToDoScreenState();
}

class _ToDoScreenState extends State<ToDoScreen> {
  @override
  void initState() {
    fetchUncompletedTasks();
    super.initState();
  }

  Future<void> fetchUncompletedTasks() async {
    await viewModel.getUnCompleteTasks();
    setState(() {});
  }

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
      body: viewModel.unCompletedTasks.isEmpty // Check if completedTasks is empty
          ? Center(child: CircularProgressIndicator()) // Show loading indicator if tasks are being fetched
          : ListView.builder(
              itemCount: viewModel.unCompletedTasks.length,
              itemBuilder: (context, index) {
                final task = viewModel.unCompletedTasks[index];
                return TodoWidget(
                  task: task,
                  showIconsRow: true,
                  onDelete: () async {
                    await viewModel.deleteTask(task);
                    setState(() {});
                  },
                  onComplete: () async {
                    await viewModel.completeTask(task);
                    setState(() {});
                  },
                );
              },
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