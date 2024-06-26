import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ui_flutter_course/model/entities/task_model.dart';

class AddEditTodoScreen extends StatefulWidget {
  final bool isEdit;
  final Task? task;
  final Function(Task task)? onCreate;
  final Function(Task task)? onEdit;

  AddEditTodoScreen({
    required this.isEdit,
    this.task,
    this.onCreate,
    this.onEdit,
  });

  @override
  State<AddEditTodoScreen> createState() => _AddEditTodoScreenState();
}

class _AddEditTodoScreenState extends State<AddEditTodoScreen> {
  final TextEditingController titleController = TextEditingController();
  final TextEditingController descController = TextEditingController();
  bool isLoading = false;

  @override
  void initState() {
    if (widget.task != null) {
      titleController.text = widget.task!.title;
      descController.text = widget.task!.description;
    }
    super.initState();
  }

  void handleNewTask() async {
    setState(() {
      isLoading = true;
    });
    if (titleController.text.trim() == "" || descController.text.trim() == "") {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text("Please fill all of text fields"),
        ),
      );
    } else {
      Task task = Task(
        title: titleController.text.trim(),
        description: descController.text.trim(),
      );
      try {
        await widget.onCreate?.call(task);
      } catch (error) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text("An error occurred while creating a new task: $error"),
          ),
        );
      } finally {
        setState(() {
          isLoading = false;
        });
      }
    }
  }

  void handleEditTask() async {
    setState(() {
      isLoading = true;
    });
    if (titleController.text.trim() == "" || descController.text.trim() == "") {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text("Please fill all of text fields"),
        ),
      );
    } else {
      Task task = Task(
        id: widget.task?.id,
        title: titleController.text.trim(),
        description: descController.text.trim(),
      );
      try {
        await widget.onEdit?.call(task);
      } catch (error) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text("An error occurred while creating a new task: $error"),
          ),
        );
      } finally {
        setState(() {
          isLoading = false;
        });
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        toolbarHeight: 80.h,
        elevation: 0,
        backgroundColor: Theme.of(context).primaryColor,
        title: Padding(
          padding: EdgeInsets.all(12.0.r),
          child: Text(
            widget.isEdit ? "Edit Task" : "Add Task",
            style: TextStyle(
              fontWeight: FontWeight.w700,
              fontStyle: FontStyle.normal,
              fontSize: 24.sp,
              color: Colors.white,
            ),
          ),
        ),
        leading: Padding(
          padding: EdgeInsets.only(left: 12.0.w),
          child: GestureDetector(
            onTap: () {
              Navigator.pop(context);
            },
            child: Icon(
              Icons.arrow_back,
              color: Colors.white,
              size: 36.sp,
            ),
          ),
        ),
      ),
      body: Padding(
        padding: EdgeInsets.all(20.r),
        child: Column(
          children: [
            TextField(
              controller: titleController,
              style: TextStyle(
                fontWeight: FontWeight.w400,
                fontSize: 14.sp,
              ),
              decoration: InputDecoration(
                hintText: "Title",
                hintStyle: TextStyle(
                  fontWeight: FontWeight.w400,
                  fontSize: 14.sp,
                  color: Colors.grey,
                ),
                contentPadding: EdgeInsets.symmetric(
                  vertical: 8.w,
                  horizontal: 12.h,
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(top: 20.h),
              child: TextField(
                controller: descController,
                style: TextStyle(
                  fontWeight: FontWeight.w400,
                  fontSize: 14.sp,
                ),
                decoration: InputDecoration(
                  hintText: "Detail",
                  hintStyle: TextStyle(
                    fontWeight: FontWeight.w400,
                    fontSize: 14.sp,
                    color: Colors.grey,
                  ),
                  contentPadding: EdgeInsets.symmetric(
                    vertical: 8.w,
                    horizontal: 12.h,
                  ),
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(top: 40.h),
              child: widget.isEdit
                  ? Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        ElevatedButton(
                          onPressed: handleEditTask,
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Theme.of(context).primaryColor,
                            elevation: 8,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(16.r),
                            ),
                            padding: EdgeInsets.symmetric(
                              horizontal: 16.h,
                              vertical: 8.w,
                            ),
                            minimumSize: Size(0.38.sw, 0.08.sh),
                          ),
                          child: isLoading
                              ? CircularProgressIndicator(
                                  color: Colors.white,
                                )
                              : Text(
                                  "Update",
                                  style: TextStyle(
                                    fontSize: 14.sp,
                                    fontWeight: FontWeight.w500,
                                    color: Colors.white,
                                  ),
                                ),
                        ),
                        ElevatedButton(
                          onPressed: () {
                            Navigator.pop(context);
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Theme.of(context).primaryColor,
                            elevation: 8,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(16.r),
                            ),
                            padding: EdgeInsets.symmetric(
                              horizontal: 16.h,
                              vertical: 8.w,
                            ),
                            minimumSize: Size(0.38.sw, 0.08.sh),
                          ),
                          child: Text(
                            "Cancel",
                            style: TextStyle(
                              fontSize: 14.sp,
                              fontWeight: FontWeight.w500,
                              color: Colors.white,
                            ),
                          ),
                        )
                      ],
                    )
                  : ElevatedButton(
                      onPressed: handleNewTask,
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Theme.of(context).primaryColor,
                        elevation: 8,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(16.r),
                        ),
                        padding: EdgeInsets.symmetric(
                          horizontal: 16.h,
                          vertical: 8.w,
                        ),
                        minimumSize: Size(double.infinity, 0.085.sh),
                      ),
                      child: isLoading
                          ? CircularProgressIndicator(
                              color: Colors.white,
                            )
                          : Text(
                              "ADD",
                              style: TextStyle(
                                fontSize: 20.sp,
                                fontWeight: FontWeight.w700,
                                color: Colors.white,
                              ),
                            ),
                    ),
            )
          ],
        ),
      ),
    );
  }
}
