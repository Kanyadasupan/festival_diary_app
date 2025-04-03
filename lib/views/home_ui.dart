import 'package:festival_diary_app/constants/baseurl_constant.dart';
import 'package:festival_diary_app/constants/color_constant.dart';
import 'package:festival_diary_app/models/user_tb.dart';
import 'package:flutter/material.dart';

class HomeUi extends StatefulWidget {
  //สรา้งตัวแปรสำหรับรับค่าจากหน้า login
  UserTb? userTb;

  //เอาตัวแปรที่สร้างมารับคำจากหน้าlogin
  HomeUi({super.key, this.userTb});

  @override
  State<HomeUi> createState() => _HomeUiState();
}

class _HomeUiState extends State<HomeUi> {
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
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          children: [
            SizedBox(height: 40),
            widget.userTb!.userImage! == ''
                ? Image.asset(
                  'assets/iamges/festlogo.png',
                  width: 100,
                  height: 100,
                  fit: BoxFit.cover,
                )
                : Image.network(
                  '${baseUrl}/images/users/${widget.userTb!.userImage!}',
                  width: 100,
                  height: 100,
                ),
            SizedBox(height: 20),
            Text(widget.userTb!.userFullname!, style: TextStyle(fontSize: 18)),
          ],
        ),
      ),
    );
  }
}
