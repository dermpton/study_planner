import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:study_planner/course_model.dart';
import 'package:study_planner/database_helper.dart';
import 'package:study_planner/prefs.dart';
import 'package:study_planner/see_all_courses.dart';
import 'package:study_planner/view_material.dart';

class DashBoardPage extends StatefulWidget {
  const DashBoardPage({super.key});

  @override
  State<DashBoardPage> createState() => _DashboardPageState();
}

class _DashboardPageState extends State<DashBoardPage> {
  // final List<String> _courses = [
  //   'Automata Theory',
  //   'Backus Naur Form',
  //   'Computational Modelling',
  //   'Discrete Mathematics',
  //   'Electricity & Magnetism',
  // ];

  List<Course> _dynamicCourses = [];

  final DatabaseHelper _db = DatabaseHelper();
  final Prefs _prefs = Prefs();

  String? userNameFromOnboarding;

  Future<void> _loadUserNameFromOnboarding() async {
    userNameFromOnboarding = await _prefs.getNameFromOnBoarding();
    if (mounted) {
      setState(() {});
    }
  }

  Future<void> _loadCourses() async {
    final courseList = await _db.displayCourses();
    setState(() {
      _dynamicCourses =
          courseList.map((jsonCourse) => Course.fromJson(jsonCourse)).toList();
    });
  }

  @override
  void initState() {
    super.initState();
    _loadUserNameFromOnboarding();
    _loadCourses();
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: SafeArea(
        child: Padding(
          padding: EdgeInsets.all(8),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(height: 8),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text(
                    'Hi there, $userNameFromOnboarding',
                    style: GoogleFonts.poppins(fontSize: 12),
                  ),
                ],
              ),
              SizedBox(height: 8),
              Center(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    SizedBox(height: 16),
                    Center(
                      child: Row(
                        children: [
                          SizedBox(
                            width: 190,
                            child: Card(
                              elevation: 0,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.all(
                                  Radius.circular(35),
                                ),
                              ),
                              color:
                                  Theme.of(
                                    context,
                                  ).colorScheme.surfaceContainer,
                              child: Padding(
                                padding: EdgeInsets.symmetric(
                                  vertical: 15,
                                  horizontal: 16,
                                ),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    const Icon(Icons.assignment, size: 48),
                                    SizedBox(height: 16),
                                    Text(
                                      '99',
                                      style: GoogleFonts.poppins(
                                        fontWeight: FontWeight.w500,
                                        fontSize: 32,
                                      ),
                                    ),
                                    Text(
                                      'Assignments',
                                      style: GoogleFonts.poppins(fontSize: 10),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                          SizedBox(
                            width: 190,
                            child: Card(
                              elevation: 0,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.all(
                                  Radius.circular(35),
                                ),
                              ),
                              color:
                                  Theme.of(
                                    context,
                                  ).colorScheme.surfaceContainer,
                              child: Padding(
                                padding: EdgeInsets.symmetric(
                                  vertical: 15,
                                  horizontal: 16,
                                ),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    const Icon(Icons.message_rounded, size: 48),
                                    SizedBox(height: 16),
                                    Text(
                                      '99',
                                      style: GoogleFonts.poppins(
                                        fontWeight: FontWeight.w500,
                                        fontSize: 32,
                                      ),
                                    ),
                                    Text(
                                      'Announcements',
                                      style: GoogleFonts.poppins(fontSize: 10),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 8),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "My Classes",
                    style: GoogleFonts.poppins(
                      fontWeight: FontWeight.w600,
                      fontSize: 12,
                    ),
                  ),
                  SizedBox(
                    width: 95,
                    child: OutlinedButton(
                      onPressed: () {
                        Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: (context) => SeeAllCoursesPage(),
                          ),
                        );
                      },
                      child: Text(
                        'See all',
                        style: GoogleFonts.poppins(fontSize: 12),
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 8),
              _dynamicCourses.isEmpty
                  ? Center(
                    child: Image.asset(
                      "assets/pngs/No Courses Yet Solution - Transparent Background.png",
                      width: MediaQuery.of(context).size.width * 0.75,
                      height: MediaQuery.of(context).size.width * 0.75,
                    ),
                  )
                  : ListView.separated(
                    shrinkWrap: true,
                    physics: NeverScrollableScrollPhysics(),
                    itemCount: _dynamicCourses.length,
                    itemBuilder: (BuildContext context, int index) {
                      final course = _dynamicCourses[index];
                      return Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(35)),
                          color:
                              Theme.of(
                                context,
                              ).colorScheme.surfaceContainerHigh,
                        ),
                        child: ListTile(
                          title: Text(
                            course.courseTitle,
                            style: GoogleFonts.poppins(
                              fontSize: 12,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          leading: CircleAvatar(
                            radius: 35,
                            child: Icon(Icons.book_sharp),
                          ),
                          trailing: IconButton(
                            onPressed: () {
                              showModalBottomSheet(
                                context: context,
                                isScrollControlled: true,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.only(
                                    topLeft: Radius.circular(35),
                                    topRight: Radius.circular(35),
                                  ),
                                ),
                                builder: (BuildContext context) {
                                  final showModalCourseInfo =
                                      _dynamicCourses[index];

                                  return SizedBox(
                                    height:
                                        MediaQuery.of(context).size.height *
                                        0.85,
                                    child: Container(
                                      padding: EdgeInsets.all(8),
                                      child: Column(
                                        mainAxisSize: MainAxisSize.min,
                                        children: [
                                          SizedBox(height: 8),
                                          Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.start,
                                            children: [
                                              Text(
                                                showModalCourseInfo.courseTitle,
                                                style: GoogleFonts.poppins(
                                                  fontSize: 20,
                                                  fontWeight: FontWeight.w600,
                                                ),
                                              ),
                                            ],
                                          ),
                                          SizedBox(height: 2),
                                          Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.start,
                                            children: [
                                              Text(
                                                showModalCourseInfo.instructor,
                                                style: GoogleFonts.poppins(
                                                  fontSize: 12,
                                                ),
                                              ),
                                            ],
                                          ),
                                          SizedBox(height: 8),
                                          SizedBox(
                                            width: double.infinity,
                                            child: FilledButton(
                                              style: FilledButton.styleFrom(
                                                backgroundColor: Colors.black,
                                              ),
                                              onPressed: () {
                                                Navigator.of(context).push(
                                                  MaterialPageRoute(
                                                    builder:
                                                        (
                                                          context,
                                                        ) => ViewMaterialPage(
                                                          /* Add CourseId here to then store the relevant symlinks */
                                                        ),
                                                  ),
                                                );
                                              },
                                              child: Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceBetween,
                                                children: [
                                                  Icon(Icons.check),
                                                  Text(
                                                    'View Material',
                                                    style: GoogleFonts.poppins(
                                                      fontSize: 16,
                                                      fontWeight:
                                                          FontWeight.w600,
                                                    ),
                                                  ),
                                                  Icon(
                                                    Icons
                                                        .keyboard_double_arrow_right,
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ),
                                          SizedBox(height: 16),
                                          Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.start,
                                            children: [
                                              Text(
                                                'Course Overview',
                                                style: GoogleFonts.poppins(
                                                  fontSize: 20,
                                                  fontWeight: FontWeight.w600,
                                                ),
                                              ),
                                            ],
                                          ),
                                          Center(
                                            child: Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.start,
                                              children: [
                                                SizedBox(
                                                  height: 190,
                                                  width: 190,
                                                  child: Card(
                                                    color:
                                                        Colors
                                                            .lightGreenAccent[100],
                                                    elevation: 0,
                                                    shape:
                                                        RoundedRectangleBorder(
                                                          borderRadius:
                                                              BorderRadius.all(
                                                                Radius.circular(
                                                                  35,
                                                                ),
                                                              ),
                                                        ),
                                                    child: Column(
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .start,
                                                      children: [
                                                        SizedBox(height: 16),
                                                        CircularProgressIndicator(
                                                          value: 0.75,
                                                          color: Colors.black,
                                                          strokeCap:
                                                              StrokeCap.round,
                                                          backgroundColor:
                                                              Colors
                                                                  .lightGreen[50],
                                                        ),
                                                        SizedBox(height: 8),
                                                        Padding(
                                                          padding:
                                                              EdgeInsets.all(
                                                                16,
                                                              ),
                                                          child: Text(
                                                            showModalCourseInfo
                                                                .schedule,
                                                            style:
                                                                GoogleFonts.poppins(
                                                                  fontSize: 8,
                                                                ),
                                                          ),
                                                        ),
                                                        SizedBox(height: 8),
                                                        Text(
                                                          showModalCourseInfo
                                                              .courseCode,
                                                          style:
                                                              GoogleFonts.poppins(
                                                                fontSize: 8,
                                                              ),
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                ),
                                                SizedBox(
                                                  height: 190,
                                                  width: 190,
                                                  child: Card(
                                                    color: Colors.purple[100],
                                                    elevation: 0,
                                                    shape:
                                                        RoundedRectangleBorder(
                                                          borderRadius:
                                                              BorderRadius.all(
                                                                Radius.circular(
                                                                  35,
                                                                ),
                                                              ),
                                                        ),
                                                    child: Column(
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .start,
                                                      children: [
                                                        SizedBox(height: 16),
                                                        CircularProgressIndicator(
                                                          value: 0.75,
                                                          color: Colors.black,
                                                          strokeCap:
                                                              StrokeCap.round,
                                                          backgroundColor:
                                                              Colors.purple[50],
                                                        ),
                                                        SizedBox(height: 8),
                                                        Padding(
                                                          padding:
                                                              EdgeInsets.all(
                                                                16,
                                                              ),
                                                          child: Text(
                                                            'Schedule: Mondays & Wednesdays, 10:00AM',
                                                            style:
                                                                GoogleFonts.poppins(
                                                                  fontSize: 8,
                                                                ),
                                                          ),
                                                        ),
                                                        SizedBox(height: 8),
                                                        Text(
                                                          'Course Code: SCS9999',
                                                          style:
                                                              GoogleFonts.poppins(
                                                                fontSize: 8,
                                                              ),
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                          SizedBox(height: 8),
                                          Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.start,
                                            children: [
                                              Text(
                                                'Reminders 🔔',
                                                style: GoogleFonts.poppins(
                                                  fontSize: 20,
                                                  fontWeight: FontWeight.w600,
                                                ),
                                              ),
                                            ],
                                          ),
                                          FilledButton(
                                            style: FilledButton.styleFrom(
                                              backgroundColor: Colors.black,
                                            ),
                                            onPressed: () {},
                                            child: Text(
                                              'Create',
                                              style: GoogleFonts.poppins(
                                                fontSize: 16,
                                                fontWeight: FontWeight.w600,
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  );
                                },
                              );
                            },
                            icon: Icon(Icons.chevron_right),
                          ),
                          subtitle: Text(
                            '${course.courseTitle} | ${course.schedule}',
                            style: GoogleFonts.poppins(fontSize: 9),
                          ),
                        ),
                      );
                    },
                    separatorBuilder: (BuildContext context, int index) {
                      return SizedBox(height: 4);
                    },
                  ),
            ],
          ),
        ),
      ),
    );
  }
}
