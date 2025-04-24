import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:study_planner/login_page.dart';

void main() {
  runApp(const StudyPlanner());
}

class StudyPlanner extends StatefulWidget {
  const StudyPlanner({super.key});

  @override
  State<StudyPlanner> createState() => _StudyPlannerState();
}

class _StudyPlannerState extends State<StudyPlanner> {
  bool _isDark = false;

  void _toggleDarkTheme() {
    setState(() {
      _isDark = !_isDark;
    });
  }

  Future<void> _saveWelcomeDismissed(bool dismissed) async {
    try {
      final SharedPreferences prefs = await SharedPreferences.getInstance();
      await prefs.setBool('welcomeDismissed', dismissed);
      print('Welcome dismissed state saved: $dismissed');
    } catch (e) {
      debugPrintStack();
    }
  }

  Future<bool> _getWelcomeDismissed() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    final bool? dismissed = prefs.getBool('welcomeDismissed');
    return dismissed ?? false;
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Study Planner App',
      debugShowCheckedModeBanner: true,
      darkTheme: ThemeData(
        brightness: Brightness.dark,
        useMaterial3: true,
        colorScheme: ColorScheme.fromSeed(
          seedColor: Colors.deepPurple,
          brightness: Brightness.dark,
        ),
        textTheme: GoogleFonts.poppinsTextTheme().apply(
          bodyColor: Colors.white,
        ),
      ),
      theme: ThemeData(
        brightness: Brightness.light,
        colorScheme: ColorScheme.fromSeed(
          seedColor: Colors.brown,
          brightness: Brightness.light,
        ),
        textTheme: GoogleFonts.poppinsTextTheme(),
        useMaterial3: true,
      ),
      themeMode: _isDark ? ThemeMode.dark : ThemeMode.light,
      home: LoginPage(),
      // home: HomePage(isDark: _isDark, toggleDarkTheme: _toggleDarkTheme),
    );
  }
}
