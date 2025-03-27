import 'package:festival_diary_app/views/splash_screen_ui.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

void main() {
  runApp(FestivalDiaryApp());
}

class FestivalDiaryApp extends StatefulWidget {
  const FestivalDiaryApp({super.key});

  @override
  State<FestivalDiaryApp> createState() => _FestivalDiaryAppState();
}

class _FestivalDiaryAppState extends State<FestivalDiaryApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: SplashScreenUi(),
      theme: ThemeData(
        textTheme: GoogleFonts.poppinsTextTheme(Theme.of(context).textTheme),
      ),
    );
  }
}
