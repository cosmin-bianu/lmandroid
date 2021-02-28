import 'package:drept_civil/widgets/course_content_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:carousel_slider/carousel_slider.dart';

class ViewCourse extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Map args = ModalRoute.of(context).settings.arguments;

    List<String> contents = args['contents'];
    String courseName = args['name'];

    var padding = MediaQuery.of(context).padding;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Text(
          courseName,
          style: TextStyle(
            color: Colors.black,
          ),
        ),
        iconTheme: IconThemeData(
          color: Colors.black,
        ),
        centerTitle: true,
        elevation: 15,
      ),
      body: CarouselSlider.builder(
        itemCount: contents.length,
        itemBuilder: (context, index) => CourseContentCard(
          content: contents[index],
        ),
        options: CarouselOptions(
          scrollDirection: Axis.vertical,
          initialPage: 0,
          enableInfiniteScroll: false,
          autoPlay: false,
          enlargeCenterPage: true,
          height:
              MediaQuery.of(context).size.height - padding.top - kToolbarHeight,
        ),
      ),
      backgroundColor: Colors.white,
    );
  }
}
