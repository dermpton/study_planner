class Course {
  final String courseTitle;
  final String instructor;
  final String schedule;
  final String courseCode;

  Course({
    required this.courseTitle,
    required this.instructor,
    required this.schedule,
    required this.courseCode,
  });

  Map<String, dynamic> toJson() => {
    'title': courseTitle,
    'instructor': instructor,
    'schedule': schedule,
    'courseCode': courseCode,
  };

  factory Course.fromJson(Map<String, dynamic> json) => Course(
    courseTitle: json['title'],
    instructor: json['instructor'],
    schedule: json['schedule'],
    courseCode: json['courseCode'],
  );
}
