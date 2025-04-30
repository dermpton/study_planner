import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:study_planner/app_launcher.dart';

import 'theme_notifier.dart';

void main() async {
  runApp(
    ChangeNotifierProvider(
      create: (_) => ThemeNotifier(),
      child: const StudyPlanner(),
    ),
  );
  WidgetsFlutterBinding.ensureInitialized();
  //   I got the following from https://docs.flutter.dev/cookbook/persistence/sqlite
}

class StudyPlanner extends StatefulWidget {
  const StudyPlanner({super.key});

  @override
  State<StudyPlanner> createState() => _StudyPlannerState();
}

class _StudyPlannerState extends State<StudyPlanner> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Study Planner App',
      debugShowCheckedModeBanner: false,
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
      themeMode:
          Provider.of<ThemeNotifier>(context).isDark
              ? ThemeMode.dark
              : ThemeMode.light,
      // home: OnboardingPage2(),
      home: AppLauncher(),
    );
  }
}
