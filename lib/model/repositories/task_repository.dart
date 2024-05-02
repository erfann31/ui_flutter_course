import 'package:ui_flutter_course/model/consts.dart';
import 'package:ui_flutter_course/model/entities/task_model.dart';

class TaskRepository {
  Future<List<Task>> getCompleted() async {
    var response = await dio.get('task/completed/');
    print('response: ${response.statusMessage}');
    print('response: ${response.data}');
    if (response.data is List) {
      List<dynamic> dataList = response.data;
      List<Task> tasks = [];
      for (var data in dataList) {
        if (data is Map<String, dynamic>) {
          var collectionServer = Task.fromJson(data);
          tasks.add(collectionServer);
        }
      }
      return tasks;
    } else {
      throw Exception('Invalid response');
    }
  }

  Future<List<Task>> getUncompleted() async {
    var response = await dio.get('task/uncompleted/');
    print('response: ${response.statusMessage}');
    print('response: ${response.data}');
    if (response.data is List) {
      List<dynamic> dataList = response.data;
      List<Task> tasks = [];
      for (var data in dataList) {
        if (data is Map<String, dynamic>) {
          var collectionServer = Task.fromJson(data);
          tasks.add(collectionServer);
        }
      }
      return tasks;
    } else {
      throw Exception('Invalid response');
    }
  }

  Future<Task> addTask(Task task) async {
    var response = await dio.post(
      'task/create/',
      data: task,
    );
    print('response: ${response.statusMessage}');
    final newTask = Task.fromJson(response.data);
    return newTask;
  }

  Future<void> editTask(Task task) async {
    var response = await dio.patch(
      'task/edit/${task.id}/',
      data: task,
    );
    print('response: ${response.statusMessage}');
  }

  Future<void> deleteTask(int taskId) async {
    var response = await dio.delete(
      'task/delete/${taskId}/',
    );
    print('response: ${response.statusMessage}');
  }

  Future<void> completeTask(int taskId) async {
    var response = await dio.get(
      'task/complete/${taskId}/',
    );
    print('response: ${response.statusMessage}');
  }
}
