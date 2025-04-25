import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class SettingsPage extends StatefulWidget {
  const SettingsPage({super.key});

  @override
  State<SettingsPage> createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.all(8),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  SizedBox(height: 8),
                  Text(
                    'Settings',
                    style: GoogleFonts.poppins(
                      fontSize: 32,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  SizedBox(height: 8),
                ],
              ),
              Expanded(
                child: ListView(
                  children: [
                    Text(
                      'Account',
                      style: GoogleFonts.poppins(fontWeight: FontWeight.w600),
                    ),
                    SizedBox(height: 2),
                    Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(50)),
                        color:
                            Theme.of(
                              context,
                            ).colorScheme.surfaceContainerHighest,
                      ),

                      child: ListTile(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.all(Radius.circular(50)),
                        ),
                        leading: Icon(Icons.edit),
                        title: Text(
                          'Edit Profile',
                          style: GoogleFonts.poppins(fontSize: 12),
                        ),
                        trailing: IconButton(
                          onPressed: () {},
                          icon: Icon(Icons.chevron_right),
                        ),
                      ),
                    ),
                    SizedBox(height: 2),
                    Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(50)),
                      ),
                      child: ListTile(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.all(Radius.circular(50)),
                        ),
                        leading: Icon(Icons.password_sharp),
                        title: Text(
                          'Change Password',
                          style: GoogleFonts.poppins(fontSize: 12),
                        ),
                        trailing: IconButton(
                          onPressed: () {},
                          icon: Icon(Icons.chevron_right),
                        ),
                      ),
                    ),
                    SizedBox(height: 2),
                    Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(50)),
                      ),
                      child: ListTile(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.all(Radius.circular(50)),
                        ),
                        leading: Icon(Icons.language_sharp),
                        title: Text(
                          'Language',
                          style: GoogleFonts.poppins(fontSize: 12),
                        ),
                        trailing: IconButton(
                          onPressed: () {},
                          icon: Icon(Icons.chevron_right),
                        ),
                      ),
                    ),
                    SizedBox(height: 2),
                    Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(50)),
                      ),
                      child: ListTile(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.all(Radius.circular(50)),
                        ),
                        leading: Icon(Icons.notifications),
                        title: Text(
                          'Notifications',
                          style: GoogleFonts.poppins(fontSize: 12),
                        ),
                        trailing: IconButton(
                          onPressed: () {},
                          icon: Icon(Icons.chevron_right),
                        ),
                      ),
                    ),
                    SizedBox(height: 4),
                    Text(
                      'Application',
                      style: GoogleFonts.poppins(fontWeight: FontWeight.w600),
                    ),
                    SizedBox(height: 2),
                    Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(50)),
                      ),
                      child: ListTile(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.all(Radius.circular(50)),
                        ),
                        leading: Icon(Icons.privacy_tip_sharp),
                        title: Text(
                          'Privacy Policy',
                          style: GoogleFonts.poppins(fontSize: 12),
                        ),
                        trailing: IconButton(
                          onPressed: () {},
                          icon: Icon(Icons.chevron_right),
                        ),
                      ),
                    ),
                    SizedBox(height: 2),
                    Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(50)),
                      ),
                      child: ListTile(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.all(Radius.circular(50)),
                        ),
                        leading: Icon(Icons.question_answer_sharp),
                        title: Text(
                          'FAQ',
                          style: GoogleFonts.poppins(fontSize: 12),
                        ),
                        trailing: IconButton(
                          onPressed: () {},
                          icon: Icon(Icons.chevron_right),
                        ),
                      ),
                    ),
                    SizedBox(height: 2),
                    Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(50)),
                      ),
                      child: ListTile(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.all(Radius.circular(50)),
                        ),
                        leading: Icon(Icons.pageview_sharp),
                        title: Text(
                          'Terms of Service',
                          style: GoogleFonts.poppins(fontSize: 12),
                        ),
                        trailing: IconButton(
                          onPressed: () {},
                          icon: Icon(Icons.chevron_right),
                        ),
                      ),
                    ),
                    SizedBox(height: 2),
                    Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(50)),
                      ),
                      child: ListTile(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.all(Radius.circular(50)),
                        ),
                        leading: Icon(Icons.star_rate_sharp),
                        title: Text(
                          'Rate Study Planner App',
                          style: GoogleFonts.poppins(fontSize: 12),
                        ),
                        trailing: IconButton(
                          onPressed: () {},
                          icon: Icon(Icons.chevron_right),
                        ),
                      ),
                    ),
                    SizedBox(height: 2),
                    Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(50)),
                      ),
                      child: ListTile(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.all(Radius.circular(50)),
                        ),
                        leading: Icon(Icons.support_sharp),
                        title: Text(
                          'Support',
                          style: GoogleFonts.poppins(fontSize: 12),
                        ),
                        trailing: IconButton(
                          onPressed: () {},
                          icon: Icon(Icons.chevron_right),
                        ),
                      ),
                    ),
                    SizedBox(height: 2),
                    Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(50)),
                      ),
                      child: ListTile(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.all(Radius.circular(50)),
                        ),
                        leading: Icon(Icons.logout_sharp),
                        title: Text(
                          'Logout',
                          style: GoogleFonts.poppins(fontSize: 12),
                        ),
                        trailing: IconButton(
                          onPressed: () {},
                          icon: Icon(Icons.chevron_right),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
