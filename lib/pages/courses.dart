import 'package:drept_civil/widgets/course_list.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class Courses extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Map args = ModalRoute.of(context).settings.arguments;

    String chapterName = args['chapter_name'];

    return SafeArea(
        child: Container(
      color: Colors.white,
      child: CustomScrollView(
        slivers: <Widget>[
          SliverAppBar(
            expandedHeight: 220,
            floating: false,
            pinned: false,
            snap: false,
            flexibleSpace: FlexibleSpaceBar(
              title: Text(
                chapterName,
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 30,
                ),
              ),
              centerTitle: true,
              stretchModes: <StretchMode>[StretchMode.fadeTitle],
            ),
            backgroundColor: Colors.white,
            iconTheme: IconThemeData(
              color: Colors.black,
            ),
          ),
          CourseList()
        ],
      ),
    ));
  }
}
