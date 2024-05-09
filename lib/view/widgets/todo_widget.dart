import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ui_flutter_course/model/entities/task_model.dart';
import 'package:ui_flutter_course/view/screens/add_edit_todo_screen.dart';

class TodoWidget extends StatefulWidget {
  final bool showIconsRow;
  final Task task;
  final VoidCallback? onDelete;
  final VoidCallback? onComplete;
  final Function(Task task)? onEdit;
  TodoWidget({
    required this.showIconsRow,
    required this.task,
    this.onDelete,
    this.onComplete,
    this.onEdit,
  });

  @override
  State<TodoWidget> createState() => _TodoWidgetState();
}

class _TodoWidgetState extends State<TodoWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 10.w),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16.r),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.4),
            blurRadius: 4,
            offset: Offset(0, 2),
          ),
        ],
      ),
      child: Padding(
        padding: EdgeInsets.all(20.r),
        child: SizedBox(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              SizedBox(
                width: 180.w,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      overflow: TextOverflow.ellipsis,
                      widget.task.title,
                      style: TextStyle(
                        fontWeight: FontWeight.w700,
                        fontSize: 17.sp,
                        color: Theme.of(context).primaryColor,
                      ),
                    ),
                    SizedBox(height: 8.h),
                    Text(
                      overflow: TextOverflow.ellipsis,
                      widget.task.description,
                      style: TextStyle(
                        fontWeight: FontWeight.w400,
                        fontSize: 12.sp,
                        color: Colors.black,
                      ),
                    ),
                  ],
                ),
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
                              task: widget.task,
                              onEdit: (Task task) async {
                                await widget.onEdit?.call(task);
                              },
                            ),
                          ),
                        );
                      },
                      icon: Icon(
                        Icons.edit_outlined,
                        color: Theme.of(context).primaryColor,
                        size: 24.sp,
                      ),
                    ),
                    IconButton(
                      onPressed: widget.onDelete,
                      icon: Icon(
                        Icons.delete_outline,
                        color: Theme.of(context).primaryColor,
                        size: 24.sp,
                      ),
                    ),
                    IconButton(
                      onPressed: widget.onComplete,
                      icon: Icon(
                        Icons.check_circle_outlined,
                        color: Theme.of(context).primaryColor,
                        size: 24.sp,
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
