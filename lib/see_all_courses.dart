import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:study_planner/course_model.dart';
import 'package:study_planner/database_helper.dart';
import 'package:study_planner/home_page.dart';

class SeeAllCoursesPage extends StatefulWidget {
  final List<Course> courses;
  const SeeAllCoursesPage({super.key, required this.courses});

  @override
  State<SeeAllCoursesPage> createState() => _SeeAllCoursesPageState();
}

class _SeeAllCoursesPageState extends State<SeeAllCoursesPage> {
  final TextEditingController _controller = TextEditingController();
  final DatabaseHelper _db = DatabaseHelper();

  // TODO: IMPLEMENT THE FETCH_COURSES LOGIC
  List<Course> studentCourses = [];

  @override
  void initState() {
    super.initState();
    _reloadCourses();
  }

  Future<void> _reloadCourses() async {
    final allCourses = await _db.displayCourses();
    if (!mounted) return;
    setState(() {
      studentCourses =
          allCourses.map((courseJson) => Course.fromJson(courseJson)).toList();
    });
  }
  // TODO: IMPLEMENT THE FETCH_COURSES LOGIC

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.surfaceContainer,
      resizeToAvoidBottomInset: true,
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(8),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              SizedBox(height: 24),
              Align(
                alignment: Alignment.topLeft,
                child: IconButton(
                  onPressed: () {
                    Navigator.of(context).pop(true);
                  },
                  icon: Icon(Icons.chevron_left_sharp),
                ),
              ),
              SizedBox(height: 16),
              Transform.translate(
                offset: Offset(-110, 0),
                child: RichText(
                  text: TextSpan(
                    style: GoogleFonts.poppins(
                      fontSize: 10,
                      fontWeight: FontWeight.w600,
                      color: Colors.black,
                    ),

                    children: [
                      TextSpan(text: "Dashboard > "),
                      WidgetSpan(
                        child: Container(
                          padding: EdgeInsets.symmetric(
                            vertical: 2.0,
                            horizontal: 8.0,
                          ),
                          decoration: BoxDecoration(
                            color: Colors.lightBlueAccent[100],
                            borderRadius: BorderRadius.circular(5),
                          ),
                          child: Text(
                            'See All',
                            style: GoogleFonts.poppins(
                              fontSize: 10,
                              fontWeight: FontWeight.w600,
                              color: Colors.lightBlue,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(height: 16),
              Transform.translate(
                offset: Offset(-100, 0),
                child: Column(
                  children: [
                    Text(
                      'All Courses',
                      style: GoogleFonts.poppins(
                        fontSize: 30,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 16),
              Container(
                height: MediaQuery.of(context).size.height,
                decoration: BoxDecoration(
                  color: Theme.of(context).colorScheme.surfaceContainerHighest,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(50),
                    topRight: Radius.circular(50),
                  ),
                ),
                child: ListView.separated(
                  itemBuilder: (BuildContext context, int index) {
                    final courseInSeeAll = widget.courses[index];

                    return Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(35)),
                        color:
                            Theme.of(
                              context,
                            ).colorScheme.surfaceContainerHighest,
                      ),
                      child: ListTile(
                        title: Text(
                          courseInSeeAll.courseTitle,
                          style: GoogleFonts.poppins(
                            fontSize: 10,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        leading: CircleAvatar(
                          radius: 35,
                          child: Icon(Icons.book_sharp),
                        ),
                        trailing: SizedBox(
                          width: MediaQuery.of(context).size.width * 0.25,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              IconButton(
                                onPressed: () {},
                                icon: Icon(Icons.edit),
                              ),
                              IconButton(
                                onPressed: () async {
                                  if (!mounted) return;

                                  showAdaptiveDialog(
                                    context: context,
                                    builder: (context) {
                                      return AlertDialog(
                                        actions: [
                                          TextButton(
                                            onPressed: () {
                                              Navigator.of(context).pop();
                                            },
                                            child: Text(
                                              'Cancel',
                                              style: GoogleFonts.poppins(
                                                fontSize: 8,
                                                fontWeight: FontWeight.w600,
                                              ),
                                            ),
                                          ),
                                          TextButton(
                                            onPressed: () async {
                                              if (await _db.deleteCourse(
                                                courseInSeeAll.courseTitle,
                                              )) {
                                                setState(() {
                                                  _reloadCourses();
                                                });

                                                ScaffoldMessenger.of(
                                                  context,
                                                ).showSnackBar(
                                                  SnackBar(
                                                    backgroundColor:
                                                        Colors.black,
                                                    behavior:
                                                        SnackBarBehavior
                                                            .floating,
                                                    duration: Duration(
                                                      seconds: 2,
                                                    ),
                                                    content: Text(
                                                      'Course Deleted',
                                                      style:
                                                          GoogleFonts.poppins(
                                                            fontSize: 8,
                                                          ),
                                                    ),
                                                  ),
                                                );
                                                Navigator.of(
                                                  context,
                                                ).pushAndRemoveUntil(
                                                  MaterialPageRoute(
                                                    builder: (_) => HomePage(),
                                                  ),
                                                  (Route<dynamic> route) =>
                                                      false,
                                                );
                                              }
                                            },
                                            style: TextButton.styleFrom(
                                              backgroundColor:
                                                  Theme.of(
                                                    context,
                                                  ).colorScheme.primary,
                                              foregroundColor: Colors.white,
                                            ),
                                            child: Text(
                                              'Delete',
                                              style: GoogleFonts.poppins(
                                                fontSize: 8,
                                                fontWeight: FontWeight.w600,
                                              ),
                                            ),
                                          ),
                                        ],
                                        content: Text(
                                          "Delete ${courseInSeeAll.courseTitle}?",
                                          style: GoogleFonts.poppins(
                                            fontSize: 12,
                                            fontWeight: FontWeight.w600,
                                          ),
                                        ),
                                      );
                                    },
                                  );
                                },
                                icon: Icon(Icons.delete_sharp),
                              ),
                            ],
                          ),
                        ),
                      ),
                    );
                  },

                  separatorBuilder: (BuildContext context, int index) {
                    // return SizedBox(height: 4);
                    return Divider();
                  },
                  itemCount: widget.courses.length,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
