import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:study_planner/add_course.dart';
import 'package:study_planner/calendar_page.dart';
import 'package:study_planner/dashboard_page.dart';
import 'package:study_planner/login_page.dart';
import 'package:study_planner/settings/settings_page.dart';
import 'package:study_planner/statistics_page.dart';
import 'package:study_planner/theme_notifier.dart';

class HomePage extends StatefulWidget {
  // final bool? isDark;
  // final VoidCallback? toggleDarkTheme;

  const HomePage({super.key /*this.isDark, this.toggleDarkTheme*/});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _currentIndex = 0;
  final List<Widget> _routes = [
    DashBoardPage(),
    CalendarPage(),
    StatsPage(),
    SettingsPage(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.surfaceContainerHighest,
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.surfaceContainerHighest,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            IconButton(
              onPressed: () {
                Provider.of<ThemeNotifier>(
                  context,
                  listen: false,
                ).toggleTheme();
                // widget.toggleDarkTheme!(); // I put null checks here be wary
              },
              icon: Consumer<ThemeNotifier>(
                builder: (context, themeNotifier, child) {
                  return Icon(
                    themeNotifier.isDark
                        // widget.isDark!
                        ? Icons.light_mode_sharp
                        : Icons
                            .dark_mode_sharp, // I put null checks here as well be wary
                  );
                },
              ),
            ),
            SizedBox(width: 8),
            CircleAvatar(
              backgroundColor:
                  Theme.of(context).colorScheme.surfaceContainerHigh,
              child: Icon(Icons.person),
            ),
          ],
        ),
      ),

      resizeToAvoidBottomInset: true,
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.of(
            context,
          ).push(MaterialPageRoute(builder: (context) => AddCoursePage()));
        },
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(50)),
        child: Icon(Icons.add, size: 40),
      ),

      drawer: Padding(
        padding: EdgeInsets.all(8),
        child: Drawer(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(50)),
          ),
          child: ListView(
            padding: EdgeInsets.all(8),
            children: [
              DrawerHeader(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Study Planner App',
                      style: GoogleFonts.poppins(
                        fontSize: 20,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    CircleAvatar(
                      backgroundColor: Colors.black,
                      foregroundColor: Colors.white,
                      child: Icon(Icons.north_east, size: 20),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 8),
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(50)),
                  color: Theme.of(context).colorScheme.surfaceContainerHighest,
                ),
                child: ListTile(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(50)),
                  ),
                  leading: Icon(Icons.person_sharp),
                  title: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text(
                        'Profile',
                        style: GoogleFonts.poppins(
                          fontSize: 12,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(height: 8),
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(50)),
                  color: Theme.of(context).colorScheme.surfaceContainerHighest,
                ),
                child: ListTile(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(50)),
                  ),
                  leading: Icon(Icons.help_sharp),
                  title: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text(
                        'Help & Feedback',
                        style: GoogleFonts.poppins(
                          fontSize: 12,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(height: 8),
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(50)),
                  color: Theme.of(context).colorScheme.surfaceContainerHighest,
                ),
                child: ListTile(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(50)),
                  ),
                  onTap: () {
                    Navigator.pop(context);
                    showAboutDialog(
                      context: context,
                      applicationName: 'Study Planner App',
                      applicationIcon: const FlutterLogo(),
                      applicationVersion: '1.0.0',
                      applicationLegalese: '© dermpton. All rights reserved.',
                    );
                  },
                  leading: Icon(Icons.info_sharp),
                  title: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text(
                        'About',
                        style: GoogleFonts.poppins(
                          fontSize: 12,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(height: 8),
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(50)),
                  color: Theme.of(context).colorScheme.surfaceContainerHighest,
                ),
                child: ListTile(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(50)),
                  ),
                  leading: Icon(Icons.logout_sharp),
                  onTap: () {
                    Navigator.pushAndRemoveUntil(
                      context,
                      MaterialPageRoute(builder: (context) => LoginPage()),
                      (Route<dynamic> route) => false,
                    );
                  },
                  title: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text(
                        'Logout',
                        style: GoogleFonts.poppins(
                          fontSize: 12,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(height: 8),
            ],
          ),
        ),
      ),

      body: _routes[_currentIndex],

      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Theme.of(context).colorScheme.surfaceContainer,
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.dashboard_sharp, color: Colors.black),
            label: 'Dashboard',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.calendar_month_sharp, color: Colors.black),
            label: 'Calendar',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.calculate_sharp, color: Colors.black),
            label: 'Statistics',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.settings_sharp, color: Colors.black),
            label: 'Settings',
          ),
        ],
        currentIndex: _currentIndex,
        onTap: (int index) {
          setState(() {
            _currentIndex = index;
          });
        },
        selectedItemColor: Colors.black,
        unselectedItemColor: Colors.grey[400],
        selectedLabelStyle: GoogleFonts.poppins(fontSize: 8),
        unselectedLabelStyle: GoogleFonts.poppins(fontSize: 8),
        type: BottomNavigationBarType.fixed,
      ),
    );
  }
}
