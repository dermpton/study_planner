import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:study_planner/home_page.dart';
import 'package:study_planner/login_page.dart';
import 'package:study_planner/splash_screen.dart';

class AppLauncher extends StatefulWidget {
  const AppLauncher({super.key});

  @override
  State<AppLauncher> createState() => _AppLauncherState();
}

class _AppLauncherState extends State<AppLauncher> {
  bool _isLoading = true;
  bool _isLoggedIn = false;

  @override
  void initState() {
    super.initState();
    _queryPreferences();
  }

  Future<void> _queryPreferences() async {
    await Future.delayed(Duration(seconds: 2));
    SharedPreferences preferences = await SharedPreferences.getInstance();
    bool loggedIn = preferences.getBool('loggedIn?') ?? false;

    if (mounted) {
      setState(() {
        _isLoggedIn = loggedIn;
        _isLoading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    if (_isLoading) {
      return SplashScreen();
    } else if (_isLoggedIn) {
      return HomePage();
    } else {
      return LoginPage();
    }
  }
}
