import 'package:shared_preferences/shared_preferences.dart';

class Prefs {
  const Prefs();

  Future<void> isLoggedIn(bool loggedIn) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setBool('loggedIn?', loggedIn);
  }

  Future<void> nameDuringOnboarding(String name) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString('name', name);
  }

  Future<String?> getNameFromOnBoarding() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString('name');
  }

  Future<void> prefersDarkMode(bool isDark) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setBool('darkTheme', isDark);
  }

  Future<bool> getTheme() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getBool('darkTheme')!;
  }

  Future<void> hasDoneOnboarding(bool hasOnboarded) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setBool('onboarding?', hasOnboarded);
  }

  Future<String?> getAvatar() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString('avatarPath');
  }

  Future<void> selectedAvatar(String avatarPath) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString('avatarPath', avatarPath);
  }
}
