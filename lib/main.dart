import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:next_offer/Pages/landing_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSwatch().copyWith(
          primary: Color(0xFF2E3440),
          secondary: Color(0xFF5E81AC),
          surface: Color(0xFFF3F3F3),
          onSurface: Color(0xFF2E3440),
        ),
        fontFamily: GoogleFonts.poppins().fontFamily,
      ),
      home: const LandingPage(),
    );
  }
}
