// ignore_for_file: sort_child_properties_last, prefer_is_empty

import 'dart:math';

import 'package:festival_diary_app/constants/color_constant.dart';
import 'package:festival_diary_app/models/user_tb.dart';
import 'package:festival_diary_app/services/user_api.dart';
import 'package:festival_diary_app/views/home_ui.dart';
import 'package:festival_diary_app/views/register_ui.dart';
import 'package:flutter/material.dart';

class LoginUi extends StatefulWidget {
  const LoginUi({super.key});

  @override
  State<LoginUi> createState() => _LoginUiState();
}

class _LoginUiState extends State<LoginUi> {
  //สรัางตัวควบุคม TextFile
  TextEditingController userNameCtrl = TextEditingController();
  TextEditingController userPasswordCtrl = TextEditingController();

  //สร้างตัวจัดการการเปิดปิดตากับช่องป้อนรหัสผ่าน
  bool isShowUserPassword = true;

  //เมธอดแสดง SnakeBar คำเตือน
  showWraningSnakeBar(context, msg) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Align(alignment: Alignment.center, child: Text(msg)),
        backgroundColor: Colors.red,
        duration: Duration(seconds: 2),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: mainColor,
        title: Text(
          "Festival Diary",
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
      ),
      body: GestureDetector(
        onTap: () {
          // ปิดคีย์บอร์ดที่กดตรงไหนก็ได้
          FocusScope.of(context).unfocus();
        },
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.only(left: 40, right: 40),
            child: Center(
              child: Column(
                children: [
                  SizedBox(height: 40),
                  Image.asset('assets/images/festlogo.png', width: 120.0),
                  SizedBox(height: 20),
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Text("ชื่อผู้ใช้"),
                  ),
                  SizedBox(height: 10.0),
                  TextField(
                    controller: userNameCtrl,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      prefixIcon: Icon(Icons.person),
                    ),
                  ),
                  SizedBox(height: 20),
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Text('รหัสผ่าน'),
                  ),
                  SizedBox(height: 10.0),
                  TextField(
                    obscureText: isShowUserPassword,
                    controller: userPasswordCtrl,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      prefixIcon: Icon(Icons.lock),
                      suffixIcon: IconButton(
                        onPressed: () {
                          setState(() {
                            isShowUserPassword = !isShowUserPassword;
                          });
                        },
                        icon:
                            isShowUserPassword == true
                                ? Icon(Icons.visibility_off)
                                : Icon(Icons.visibility),
                      ),
                    ),
                  ),
                  SizedBox(height: 20),
                  ElevatedButton(
                    onPressed: () async {
                      //validate UI
                      if (userNameCtrl.text.length == 0) {
                        showWraningSnakeBar(context, 'ป้อนชื่อผู้ใช้ด้วย...');
                      } else if (userPasswordCtrl.text.length == 0) {
                        showWraningSnakeBar(context, 'ป้อนรหัสผ่านด้วย...');
                      } else {
                        //ส่งชื่อผู้ใช้และรหัสผ่านไปตรวจสอบที่ API
                        //แพ็คข้อมูลที่ต้องส่งไปให้กับ checkLogin()
                        UserTb user = UserTb(
                          userName: userNameCtrl.text,
                          userPassword: userPasswordCtrl.text,
                        );
                        //เรียกใช้ checkLogin()
                        user = await UserAPI().checkLogin(user);

                        if (user.userId != null) {
                          //แปลว่าชื่อผู้ใช้และรหัสผ่านถูกต้อง เปิดไปหน้า HomeUI()
                          Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                              builder: (context) => HomeUi(userTb: user),
                            ),
                          );
                        } else {
                          //แปลว่าชื่อผู้ใช้และรหัสผ่านไม่ถูกต้อง แสดงข้อความแจ้งเตือน
                          showWraningSnakeBar(
                            context,
                            'ชื่อผู้ใช้หรือรหัสผ่านไม่ถูกต้อง...',
                          );
                        }
                      }
                    },
                    child: Text(
                      "Login",
                      style: TextStyle(fontSize: 20, color: Colors.white),
                    ),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: mainColor,
                      fixedSize: Size(MediaQuery.of(context).size.width, 60.0),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(5.0),
                      ),
                    ),
                  ),
                  SizedBox(height: 10),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "ยังไม่มีบัญชีผู้ใช้?",
                        style: TextStyle(fontSize: 16),
                      ),
                      TextButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => RegisterUi(),
                            ),
                          );
                        },
                        child: Text(
                          "ลงทะเบียน",
                          style: TextStyle(fontSize: 16, color: mainColor),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 40),
                  Text("Coppyright © 2025"),
                  Text("Created by Kanyada"),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
