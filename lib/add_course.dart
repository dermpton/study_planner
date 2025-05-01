import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:study_planner/course_model.dart';
import 'package:study_planner/database_helper.dart';
import 'package:study_planner/home_page.dart';

class AddCoursePage extends StatefulWidget {
  const AddCoursePage({super.key});

  @override
  State<AddCoursePage> createState() => _AddCoursePageState();
}

class _AddCoursePageState extends State<AddCoursePage> {
  final TextEditingController _courseTitleController = TextEditingController();
  final TextEditingController _instructorController = TextEditingController();
  final TextEditingController _scheduleController = TextEditingController();
  final TextEditingController _courseCodeController = TextEditingController();
  final DatabaseHelper _db = DatabaseHelper();

  @override
  void dispose() {
    _courseCodeController.dispose();
    _courseTitleController.dispose();
    _instructorController.dispose();
    _scheduleController.dispose();

    super.dispose();
  }

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
                    Navigator.of(context).pop();
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
                            'Add Course',
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
                      'Add Course',
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
                padding: EdgeInsets.all(16),
                height: MediaQuery.of(context).size.height,
                decoration: BoxDecoration(
                  color: Theme.of(context).colorScheme.surfaceContainerHighest,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(50),
                    topRight: Radius.circular(50),
                  ),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    SizedBox(height: 8),
                    TextField(
                      controller: _courseTitleController,
                      autocorrect: true,
                      decoration: InputDecoration(
                        labelText: 'Course Title',
                        border: UnderlineInputBorder(),
                      ),
                    ),
                    SizedBox(height: 16),
                    TextField(
                      controller: _instructorController,
                      autocorrect: true,
                      decoration: InputDecoration(
                        labelText: 'Instructor',
                        border: UnderlineInputBorder(),
                      ),
                    ),
                    SizedBox(height: 16),
                    TextField(
                      controller: _courseCodeController,
                      autocorrect: true,
                      decoration: InputDecoration(
                        labelText: 'Course Code',
                        border: UnderlineInputBorder(),
                      ),
                    ),
                    SizedBox(height: 16),
                    TextField(
                      controller: _scheduleController,
                      autocorrect: true,
                      decoration: InputDecoration(
                        labelText: 'Schedule',
                        border: UnderlineInputBorder(),
                      ),
                    ),
                    SizedBox(height: 8),
                    SizedBox(
                      width: MediaQuery.of(context).size.width * 0.7,
                      child: FilledButton(
                        onPressed: () async {
                          if (_courseTitleController.text.isEmpty ||
                              _instructorController.text.isEmpty ||
                              _scheduleController.text.isEmpty ||
                              _courseCodeController.text.isEmpty) {
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(
                                duration: Duration(seconds: 2),
                                backgroundColor: Colors.black,
                                behavior: SnackBarBehavior.floating,
                                content: Text(
                                  'All fields must be filled.',
                                  style: GoogleFonts.poppins(fontSize: 8),
                                ),
                              ),
                            );
                            return;
                          }

                          final Course course = Course(
                            courseTitle: _courseTitleController.text.trim(),
                            instructor: _instructorController.text.trim(),
                            schedule: _scheduleController.text.trim(),
                            courseCode: _courseCodeController.text.trim(),
                          );

                          if (!mounted) return;

                          if (await _db.addNewCourse(course.toJson())) {
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(
                                duration: Duration(seconds: 2),
                                backgroundColor: Colors.black,
                                behavior: SnackBarBehavior.floating,
                                content: Text(
                                  'New Course Added.',
                                  style: GoogleFonts.poppins(fontSize: 8),
                                ),
                              ),
                            );
                            Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(
                                builder: (context) => HomePage(),
                              ),
                            );
                          }
                        },
                        child: Text("Save"),
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
