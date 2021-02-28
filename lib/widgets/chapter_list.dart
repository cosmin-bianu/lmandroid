import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ChapterList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Map args = ModalRoute.of(context).settings.arguments;
    List<Map<String, String>> chapters = args['chapters'];
    final List<Widget> chapterWidgets = [];

    chapters.forEach((chapter) {
      chapterWidgets.add(Padding(
        padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 1),
        child: Card(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(26),
            ),
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: ListTile(
                leading: Text(
                  chapter["order_number"],
                  style: TextStyle(
                    fontSize: 30.0,
                  ),
                ),
                title: Text(chapter["name"]),
                subtitle: Text(chapter["description"]),
                onTap: () {
                  Navigator.pushNamed(context, "/load_courses", arguments: {
                    "chapter_id": chapter["chapter_id"],
                    "chapter_name": chapter["name"]
                  });
                },
              ),
            ),
            elevation: 6.0),
      ));
    });
    return SliverList(delegate: SliverChildListDelegate(chapterWidgets));
  }
}
