import 'package:ui_flutter_course/model/consts.dart';
import 'package:ui_flutter_course/model/entities/user_model.dart';

class StoreRepository {

  Future<String?> signup(User user) async {
    try {
      var response = await dio.post(
        'account/signup/',
        data: user,
      );
      print('response: ${response.statusMessage}');
      print('response: ${response.data}');
      if (response.statusCode == 200) {
        return null;
      } else {
        return response.data['error'];
      }
    } catch (e) {
      print('Error signing up: $e');
      return 'An error occurred while signing up. Please try again later.';
    }
  }

  Future<String?> login(User user) async {
    try {
      var response = await dio.post(
        'account/login/',
        data: user,
      );
      print('response: ${response.statusMessage}');
      print('response: ${response.data}');
      if (response.statusCode == 200) {
        dio.options.headers["Authorization"] = "Token ${response.data['token']}";
        return null;
      } else {
        return response.data['error'];
      }
    } catch (e) {
      print('Error logging in: $e');
      return 'An error occurred while logging in. Please try again later.';
    }
  }
}
