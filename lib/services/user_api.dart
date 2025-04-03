import 'dart:io';

import 'package:dio/dio.dart';
import 'package:festival_diary_app/constants/baseurl_constant.dart';
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

      final responseData = await dio.post(
        '${baseUrl}/user/',
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

  //สร้างเมธอดเรียกใช้ API ให้เอาชื่อผู้ใช้และรหัสผ่านไปตรวจสอบ
  Future<UserTb> checkLogin(UserTb user) async {
    try {
      final responseData = await dio.get(
        '${baseUrl}/user/${user.userName}/${user.userPassword}',
      );
      if (responseData.statusCode == 200) {
        //ถ้าสำเร็จให้แปลงข้อมูลที่ได้จาก API เป็น UserTb
        return UserTb.fromJson(responseData.data['info']);
      } else {
        return UserTb();
      }
    } catch (e) {
      print('Exception: $e');
      return UserTb();
    }
  }
}
