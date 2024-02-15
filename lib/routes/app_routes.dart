import 'package:flutter/material.dart';
import 'package:ui_flutter_course/presentation/todo_page_container_screen/todo_page_container_screen.dart';
import 'package:ui_flutter_course/presentation/add_todo_screen/add_todo_screen.dart';
import 'package:ui_flutter_course/presentation/edit_todo_screen/edit_todo_screen.dart';
import 'package:ui_flutter_course/presentation/completed_task_screen/completed_task_screen.dart';
import 'package:ui_flutter_course/presentation/app_navigation_screen/app_navigation_screen.dart';

class AppRoutes {
  static const String todoPage = '/todo_page';

  static const String todoPageContainerScreen = '/todo_page_container_screen';

  static const String addTodoScreen = '/add_todo_screen';

  static const String editTodoScreen = '/edit_todo_screen';

  static const String completedTaskScreen = '/completed_task_screen';

  static const String appNavigationScreen = '/app_navigation_screen';

  static Map<String, WidgetBuilder> routes = {
    todoPageContainerScreen: (context) => TodoPageContainerScreen(),
    addTodoScreen: (context) => AddTodoScreen(),
    editTodoScreen: (context) => EditTodoScreen(),
    completedTaskScreen: (context) => CompletedTaskScreen(),
    appNavigationScreen: (context) => AppNavigationScreen()
  };
}
