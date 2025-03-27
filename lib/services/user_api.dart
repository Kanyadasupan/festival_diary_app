import 'dart:io';

import 'package:dio/dio.dart';
import 'package:festival_diary_app/models/user_tb.dart';

class UserAPI {
  final Dio dio = Dio();

  Future<bool> regiterUser(UserTb user, File? userFile) async {
    try {
      final formData = FormData.fromMap({
        'userFullname': user.userFullname,
        'userName': user.userName,
        'userPassword': user.userPassword,
        if (userFile != null)
          'userImage': await MultipartFile.fromFile(
            userFile.path,
            filename: userFile.path.split('/').last,
            contentType: DioMediaType('image', userFile.path.split('.').last),
          ),
      });

      final responseData = dio.post(
        'http://172.17.34.23:2424/user/',
        data: formData,
        options: Options(headers: {'Content-Type': 'multipart/form-data'}),
      );
      if (responseData.statusCode == 201) {
        return true;
      } else {
        return false;
      }
    } catch (e) {
      print('Exception: $e');
      return false;
    }
  }
}

extension on Future<Response> {
  get statusCode => null;
}
