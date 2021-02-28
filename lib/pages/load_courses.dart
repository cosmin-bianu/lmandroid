import 'package:drept_civil/services/app_client.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class LoadCourses extends StatefulWidget {
  @override
  _LoadCoursesState createState() => _LoadCoursesState();
}

class _LoadCoursesState extends State<LoadCourses> {
  Future<void> getCourses() async {
    Map args = ModalRoute.of(context).settings.arguments;
//    int chapter_id = args['chapter_id'];
//    CourseRetriever courseRetriever = new CourseRetriever(url: "httpshit", id: chapter_id);
    List<Map<String, String>> courses = await AppClient.getInstance()
        .retrieveCourses(int.parse(args['chapter_id']));
    Navigator.pushReplacementNamed(context, "/courses", arguments: {
      'courses': courses,
      'chapter_name': args['chapter_name'],
    });
  }

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) => getCourses());
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
          child: SpinKitThreeBounce(
        color: Colors.grey[800],
        size: 60.0,
      )),
      color: Colors.white,
    );
  }
}
