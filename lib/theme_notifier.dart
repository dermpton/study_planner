import 'package:flutter/material.dart';
import 'package:study_planner/prefs.dart';

class ThemeNotifier extends ChangeNotifier {
  bool _isDark = false;
  final Prefs _prefs = Prefs();

  bool get isDark => _isDark;

  ThemeNotifier() {
    _initTheme();
  }

  void _initTheme() async {
    bool preloadedTheme = await _prefs.getTheme();
    _isDark = preloadedTheme;
    notifyListeners();
  }

  void toggleTheme() {
    _isDark = !_isDark;
    _prefs.prefersDarkMode(_isDark);
    notifyListeners();
  }
}

/*
* Provider Package
*
* So I used the Provider package to gain access to the Change Notifier
* a class that efficiently handles state management between Stateful/Stateless
* Widgets.
*
* I created my own class titled theme notifier, with this I extended the
* Change Notifier Class, this gave me access to the notifyListeners() void
* method/callback.
*
* To make it easier to visualize this is the part that you will be working
* with predominantly: Provider.of<ThemeNotifier>(context).isDark;
* so the isDark portion is actually variable it can be anything you defined
* in the ThemeNotifier class, with that said lets start with it first. The
* isDark portion is a getter method i.e., bool get isDark => _isDark; this
* can be further broken down to:
*
* bool get isDark { return _isDark } a getter or get method, to simply access
* the value we want. Well how do we set it? initially in the theme notifier class
* I don't think there is a use case where there is no attribute used, but if there
* is, that's OK too. We learn, otherwise when I think of the attribute is declared
* and given a value. I'm going further from the point, but what I can say
* is that the theme notifier has a constructor too, much like any normal class
* to be honest, the constructor is called once, and it has initial values
* much like the iniState except for classes, not widgets. You define what you
* need and you head out to the areas of practical use. But before that, I need
* you to understand that anything you define in the theme notifier should,
* notify the rest of the widgets. A notification will prompt the widgets to
* rebuild with the new data. I used shared preferences above to give you
* the gist of it and the hang but always use the notifyListeners() void method
* we can disable listeners using the Provider.of<ThemeNotifier>(context, listen: false).isDark;
*
* We move to the first area of important reference, wrap the contents of the
* runApp() method with the ChangeNotifierProvider() Widget, this provides the
* parameter called create: because we are passing no parameters to it
* we simply leave an underscore (wildcard that means we don't care for the
* data which is being passed whether it even exists or not), there should be
* a child parameter that should give way to the main app widget.
*
* Go to the areas you want to exact the theme provider and use the first
* statement I gave you: Provider.of<ThemeNotifier>(context).isDark or
* whatever you deemed worthy of being dubbed a getter method.
* */
