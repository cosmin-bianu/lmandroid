import 'package:drept_civil/services/app_client.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class LoadCourseContent extends StatefulWidget {
  @override
  _LoadCourseContentState createState() => _LoadCourseContentState();
}

class _LoadCourseContentState extends State<LoadCourseContent> {
  Future<void> getCourseContent() async {
    Map args = ModalRoute.of(context).settings.arguments;
    List<String> contents =
        await AppClient.getInstance().retrieveCourseContents(args['course_id']);
    Navigator.pushReplacementNamed(context, "/view_course", arguments: {
      'contents': contents,
      'name': args['name'],
    });
  }

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance
        .addPostFrameCallback((timeStamp) => getCourseContent());
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
