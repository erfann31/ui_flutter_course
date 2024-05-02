import 'dart:async';

import 'package:flutter/material.dart';
import 'package:ui_flutter_course/model/entities/task_model.dart';
import 'package:ui_flutter_course/model/repositories/task_repository.dart';

class TaskViewModel extends ChangeNotifier {
  var repository = TaskRepository();

  List<Task> completedTasks = [];
  List<Task> unCompletedTasks = [];

  Future<void> getCompleteTasks() async {
    completedTasks = await repository.getCompleted();
    notifyListeners();
  }

  Future<void> getUnCompleteTasks() async {
    unCompletedTasks = await repository.getUncompleted();
    notifyListeners();
  }

  Future<void> addTask(Task task) async {
    unCompletedTasks.add(await repository.addTask(task));
    notifyListeners();
  }

  Future<void> deleteTask(Task task) async {
    await repository.deleteTask(task.id);
    unCompletedTasks.remove(task);
    notifyListeners();
  }

  Future<void> completeTask(Task task) async {
    await repository.completeTask(task.id);
    unCompletedTasks.remove(task);
    completedTasks.add(task);
    notifyListeners();
  }

  Future<void> editTask(Task task) async {
    await repository.editTask(task);
    int index = -1;
    for (int i = 0; i < unCompletedTasks.length; i++) {
      if (unCompletedTasks[i].id == task.id) {
        index = i;
        break;
      }
    }

    if (index != -1) {
      unCompletedTasks[index] = task;
      notifyListeners();
    }
  }
}
