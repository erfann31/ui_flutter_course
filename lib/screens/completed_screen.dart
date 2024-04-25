
import 'package:flutter/material.dart';
import 'package:ui_flutter_course/widgets/todo_widget.dart';

class CompletedScreen extends StatelessWidget {
  final VoidCallback onBack;

  CompletedScreen({required this.onBack});
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
            onTap: onBack,
            child: Icon(
              Icons.arrow_back,
              color: Colors.white,
              size: 36,
            ),
          ),
        ),
      ),
      body: ListView.builder(
        padding: EdgeInsets.all(10),
        itemCount: 10,
        itemBuilder: (BuildContext context, int index) {
          return TodoWidget(
            showIconsRow: false,
          );
        },
      ),
    );
  }
}
