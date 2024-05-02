import 'package:dio/dio.dart';
import 'package:ui_flutter_course/model/viewModel/task_viewmodel.dart';

const baseUrl = "https://todo-app-backend-4yru.onrender.com/api/v1/";


final options = BaseOptions(
  baseUrl: baseUrl,
  validateStatus: (status) => true,
  connectTimeout: const Duration(seconds: 200),
  receiveTimeout: const Duration(seconds: 200),
  contentType: 'application/json',
);

final dio = Dio(options);
final viewModel = TaskViewModel();