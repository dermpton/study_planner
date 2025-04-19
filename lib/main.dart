import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'home_page.dart';

void main() {
  runApp(const StudyPlanner());
}

class StudyPlanner extends StatelessWidget {
  const StudyPlanner({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Study Planner App',
      home: HomePage(),
      debugShowCheckedModeBanner: true,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.brown),
        textTheme: GoogleFonts.poppinsTextTheme(),
        useMaterial3: true,
      ),
    );
  }
}
