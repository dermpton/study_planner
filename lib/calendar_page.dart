import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:syncfusion_flutter_calendar/calendar.dart';

class CalendarPage extends StatefulWidget {
  const CalendarPage({super.key});

  @override
  State<CalendarPage> createState() => _CalendarPageState();
}

class _CalendarPageState extends State<CalendarPage> {
  /*
  * For the table_calendar api, I guess I'll have to implement the function based
  * Approach I wanted to avoid, I'll do it later there's a whole lot more UI,
  * that needs to be dealt with before any functionality is instead recommended
  *
  * Scratch that we will use the sync_fusion_calendar api
  *  */

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: SafeArea(
        child: Padding(
          padding: EdgeInsets.all(8),
          child: Center(
            child: Column(
              children: [
                Text(
                  'Calendar',
                  style: GoogleFonts.poppins(
                    fontSize: 12,
                    fontWeight: FontWeight.w600,
                    color: Colors.grey,
                  ),
                ),
                SizedBox(height: 16),
                Text(
                  'My Class Schedules',
                  style: GoogleFonts.poppins(
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                SizedBox(height: 8),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    OutlinedButton(
                      onPressed: () {},
                      style: OutlinedButton.styleFrom(
                        backgroundColor: Colors.brown[400],
                      ),
                      child: Text(
                        'This Week',
                        style: TextStyle(fontSize: 11, color: Colors.black),
                      ),
                    ),
                    SizedBox(width: 12),
                    OutlinedButton(
                      onPressed: () {},
                      style: OutlinedButton.styleFrom(
                        backgroundColor: Colors.transparent,
                      ),
                      child: Text(
                        'Next Week',
                        style: TextStyle(fontSize: 11, color: Colors.black),
                      ),
                    ),
                    SizedBox(width: 12),
                    OutlinedButton(
                      onPressed: () {},
                      style: OutlinedButton.styleFrom(
                        backgroundColor: Colors.transparent,
                      ),
                      child: Text(
                        'Today',
                        style: TextStyle(fontSize: 11, color: Colors.black),
                      ),
                    ),
                    SizedBox(width: 12),
                    OutlinedButton(
                      onPressed: () {},
                      style: OutlinedButton.styleFrom(
                        backgroundColor: Colors.transparent,
                      ),
                      child: Icon(
                        Icons.tune_sharp,
                        size: 11,
                        color: Colors.black,
                      ),
                    ),
                    SizedBox(height: 8),
                  ],
                ),
                SfCalendar(
                  view: CalendarView.month,
                  initialSelectedDate: DateTime.now(),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
