import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class CourseList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Map args = ModalRoute.of(context).settings.arguments;
    List<Map<String, String>> courses = args["courses"];
    final List<Widget> courseWidgets = [];

    courses.forEach((course) {
      courseWidgets.add(Padding(
        padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 1),
        child: Card(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(26),
          ),
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: ListTile(
              leading: Text(
                course["order_number"],
                style: TextStyle(
                  fontSize: 30.0,
                ),
              ),
              title: Text(course["name"]),
              onTap: () {
                Navigator.pushNamed(context, "/load_course_content",
                    arguments: {
                      'course_id': course['id'],
                      'name': course["name"]
                    });
              },
            ),
          ),
          elevation: 6.0,
        ),
      ));
    });
    return SliverList(delegate: SliverChildListDelegate(courseWidgets));
  }
}
