// ignore_for_file: sort_child_properties_last

import 'package:festival_diary_app/views/register_ui.dart';
import 'package:flutter/material.dart';

class LoginUi extends StatefulWidget {
  const LoginUi({super.key});

  @override
  State<LoginUi> createState() => _LoginUiState();
}

class _LoginUiState extends State<LoginUi> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Color(0xFF00FFFF),
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
                    obscureText: true,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      prefixIcon: Icon(Icons.lock),
                      suffixIcon: IconButton(
                        onPressed: () {},
                        icon: Icon(Icons.visibility_off),
                      ),
                    ),
                  ),
                  SizedBox(height: 20),
                  ElevatedButton(
                    onPressed: () {},
                    child: Text(
                      "Login",
                      style: TextStyle(fontSize: 20, color: Colors.white),
                    ),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Color(0xFF00FFFF),
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
                          style: TextStyle(
                            fontSize: 16,
                            color: Color(0xFF00FFFF),
                          ),
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
