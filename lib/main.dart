import 'package:drept_civil/pages/courses.dart';
import 'package:drept_civil/pages/load_chapters.dart';
import 'package:drept_civil/pages/load_course_contents.dart';
import 'package:drept_civil/pages/load_courses.dart';
import 'package:drept_civil/pages/view_course.dart';
import 'package:drept_civil/services/app_client.dart';
import 'package:drept_civil/services/keychain.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'pages/home.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  AppClient.initialize();
  Keychain keychain = Keychain.getInstance();
  String initialRoute = '/';
//  if (await keychain.areCredentialsSaved()) {
//    bool success = await keychain.authenticateUsingSavedCredentials();
//    if (success)
//      initialRoute = '/load_chapters';
//    else
//      keychain.destroyCredentials();
//  }
  runApp(MaterialApp(initialRoute: '/load_chapters', routes: {
//    "/": (context) => Login(),
    "/load_chapters": (context) => LoadChapters(),
    "/home": (context) => Home(),
    "/load_courses": (context) => LoadCourses(),
    "/courses": (context) => Courses(),
    "/load_course_content": (context) => LoadCourseContent(),
    "/view_course": (context) => ViewCourse(),
//    "/create_account": (context) => CreateAccount(),
  }));
}
