import 'dart:async';

import 'package:bcrypt/bcrypt.dart';
import 'package:path/path.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:sqflite/sqflite.dart';
import 'package:study_planner/prefs.dart';

/*
  * Static implies that the object created belongs to the class
  * so when we see the variable _instance it in turn belongs to
  * the class Database Helper
  *
  * THE UNDERLYING CONCEPT: SINGLETON DATABASE PATTERN
  * We want it such that each database connection we make to SQLite
  * is in turn a single connection, that can be achieved by creating
  * a single object that has access to it. We have called the class
  * Database Helper because the helper implies that it sits between the
  * domain layer and the database, the helper thereby passes or interacts
  * with the database on our behalf. What better way of doing this than
  * using using the singleton pattern, this in turn will require static
  * and final method declarations.
  *
  * More to come...
  * Factories or just factory
  * This is a constructor that dictates HOW OBJECTS ARE CREATED
  * in this case we see a lambda expression that returns a single
  * variable.
  * factory DatabaseHelper() => _instance;
  * So we are instructing the DatabaseHelper() that each
  * time it is invoked it returns the same _instance or the variable
  * that we gave as internal(). Now the internal is a special private
  * constructor that, is named. Imagine, named?? Anyways its built
  * to sort off channel the developer calling to only use the single
  * instance that we talked about (_instance), so it somehow aligns
  * with the factory method, think of it like so, when we create the
  * static and final _instance variable and give it the named private
  * constructor of internal, to then narrow the object instantiation
  * to the that one variable, we then call the factory creational
  * design pattern through a lambda expression to simply return the
  * single instance variable we made each time we call the
  * DatabaseHelper()
  *
  * So we then transition over to getter method, or get method. Before,
  * we can move any forward, from the little knowledge that we have
  * gained, we understand that getter methods need not pass any arguments
  * or parameters, right? I mean in other languages this of course is
  * represented by properties or by simply representing it with closed
  * brackets (). Now we have a sort of foundation we can get to work,
  *
  * Future<Database> get database async {}
  *
  * This line of code simply represents our way of thinking and
  * understanding from before, right as you can see we create a
  * Future<Database> asynchronous method with the return type of
  * Database that is a get method. The name of said method is called
  * database, recall it does not have any parameters or brackets,
  * in Dart it seems we call them by their literal name such as get
  * or set, I guess. Still no clarity but I'll investigate no better
  * way to find out something. According to some literary works, it
  * seems as though that the formal explanation is said to be "This is
  * a getter, not a normal method. You can access it like a property (
  * myHelper.database)"
  *
  * static Database? _database;
  * Recall that the instance we declared is in fact, required to execute
  * in the class. And that it is final as well? To manipulate the single
  * database we want, we need to do so by creating the database FOR the
  * class. So the above code snippet is justified otherwise where else,
  * could you declare it and use it having to produce a single instance?
  *
  * */

class DatabaseHelper {
  static Database? _database;
  DatabaseHelper._internal();
  static final DatabaseHelper _instance = DatabaseHelper._internal();
  factory DatabaseHelper() => _instance;

  Future<Database> get database async {
    _database ??= await _initDb();
    return _database!;
  }

  Future<Database> _initDb() async {
    return await openDatabase(
      join(await getDatabasesPath(), 'student_planner_datasource.db'),
      version: 1,
      onCreate: (db, version) async {
        await db.execute('''
    CREATE TABLE credentials(
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    username TEXT NOT NULL, 
    firstname TEXT NOT NULL,
    password TEXT NOT NULL
    )
    ''');

        await db.execute('''
    CREATE TABLE courses(
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    title TEXT NOT NULL,
    instructor TEXT,
    schedule TEXT, 
    courseCode TEXT NOT NULL
    )
    ''');

        await db.execute('''
    CREATE TABLE avatar(
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    avatarPath TEXT
    )
    ''');

        await db.execute('''
    CREATE TABLE reminders(
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    date TEXT NOT NULL,
    content TEXT NOT NULL
    )
    ''');

        await db.execute('''
        CREATE TABLE statistics(
        id INTEGER PRIMARY KEY AUTOINCREMENT,
        assignment_count INTEGER NOT NULL,
        study_material_count INTEGER NOT NULL, 
        created_at TEXT,
        updated_at TEXT
        )
        ''');
      },
    );
  }

  Future<String> _hashPassword(String password) async {
    return BCrypt.hashpw(password, BCrypt.gensalt());
  }

  Future<bool> insertCredentials(String userName, String password) async {
    Prefs preferences = Prefs();
    final credentials = {
      'username': userName,
      'firstname': await preferences.getNameFromOnBoarding(),
      'password': await _hashPassword(password),
    }; // JSON is the mapping paradigm

    SharedPreferences prefs = await SharedPreferences.getInstance();
    final db = await database;
    final int userId = await db.insert(
      'credentials',
      credentials,
      conflictAlgorithm: ConflictAlgorithm.replace,
    );

    prefs.setInt('userId', userId);

    return true;
  }

  // TODO: REMODEL THIS
  Future<String?> setAvatarAsProfile() async {
    final db = await database;
    final SharedPreferences preferences = await SharedPreferences.getInstance();
    final Prefs prefs = Prefs();
    db.update(
      'avatar',
      {'avatarPath': await prefs.getAvatar()},
      where: 'id = ?',
      whereArgs: [preferences.getInt('userId')],
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
    return await prefs.getAvatar();
  }

  Future<bool> _checkPassword(
    String inputPassword,
    String storedHashedPassword,
  ) async {
    return BCrypt.checkpw(inputPassword, storedHashedPassword);
  }

  Future<bool> checkCredentials(String userName, String inputPassword) async {
    final db = await database;
    final SharedPreferences prefs = await SharedPreferences.getInstance();

    if (prefs.getInt('userId') == null) return false;

    final results = await db.query(
      'credentials',
      where: 'id = ?',
      whereArgs: [prefs.getInt('userId')],
      columns: ['username', 'password'],
    );

    if (results.isEmpty) return false;

    final userCredentials = results.first;
    final storedUsername = userCredentials['username'] as String;
    final storedHashedPassword = userCredentials['password'] as String;
    final bool passwordValidity = await _checkPassword(
      inputPassword,
      storedHashedPassword,
    );

    return userName == storedUsername && passwordValidity;
  }

  Future<bool> addNewCourse(Map<String, dynamic> courseList) async {
    final db = await database;

    try {
      await db.insert(
        'courses',
        courseList,
        conflictAlgorithm: ConflictAlgorithm.replace,
      );
      return true;
    } catch (e) {
      return false;
    }
  }

  Future<List<Map<String, dynamic>>> displayCourses() async {
    final db = await database;

    return await db.query('courses');
  }

  // Reading but nah not yet, there's nothing for me here yet
  Future<List<Map<String, dynamic>>> getAllCredentials() async {
    final db = await database;
    return await db.query('credentials');
  }
}
