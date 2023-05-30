import 'package:flutter/material.dart';
// import 'package:antriajaa/pages/homePage.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:antriajaa/pages/registerPage.dart';
// import 'theme.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: RegisterPage(),
      theme: ThemeData(
        textTheme: GoogleFonts.interTextTheme(),
      ),
    );
  }
}
