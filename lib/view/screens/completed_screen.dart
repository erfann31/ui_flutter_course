import 'package:flutter/material.dart';
import 'package:ui_flutter_course/model/consts.dart';
import 'package:ui_flutter_course/model/viewModel/task_viewmodel.dart';
import 'package:ui_flutter_course/view/widgets/todo_widget.dart';

class CompletedScreen extends StatefulWidget {
  final VoidCallback onBack;

  CompletedScreen({required this.onBack});

  @override
  State<CompletedScreen> createState() => _CompletedScreenState();
}

class _CompletedScreenState extends State<CompletedScreen> {
  @override
  void initState() {
    fetchCompletedTasks();
    super.initState();
  }

  Future<void> fetchCompletedTasks() async {
    await viewModel.getCompleteTasks();
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
            "Completed Task",
            style: TextStyle(
              fontWeight: FontWeight.w700,
              fontStyle: FontStyle.normal,
              fontSize: 24,
              color: Colors.white,
            ),
          ),
        ),
        leading: Padding(
          padding: const EdgeInsets.only(left: 12.0),
          child: GestureDetector(
            onTap: widget.onBack,
            // {
            // Navigator.push(
            // context,
            // MaterialPageRoute(
            // builder: (context) => HomeScreen(),
            // ),
            // );
            // }
            child: Icon(
              Icons.arrow_back,
              color: Colors.white,
              size: 36,
            ),
          ),
        ),
      ),
      body: viewModel.completedTasks.isEmpty // Check if completedTasks is empty
          ? Center(child: CircularProgressIndicator()) // Show loading indicator if tasks are being fetched
          : Padding(
            padding: const EdgeInsets.all(8.0),
            child: ListView.builder(
                itemCount: viewModel.completedTasks.length,
                itemBuilder: (context, index) {
                  final task = viewModel.completedTasks[index];
                  return TodoWidget(
                    task: task,
                    showIconsRow: false,
                    onDelete: () {},
                    onComplete: () {},
                  );
                },
              ),
          ),
    );
  }
}
