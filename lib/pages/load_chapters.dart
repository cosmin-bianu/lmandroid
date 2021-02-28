import 'package:drept_civil/services/app_client.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class LoadChapters extends StatefulWidget {
  @override
  _LoadChaptersState createState() => _LoadChaptersState();
}

class _LoadChaptersState extends State<LoadChapters> {
  Future<void> getChapters() async {
    List<Map<String, String>> chapters =
        await AppClient.getInstance().retrieveChapters();
    Navigator.pushReplacementNamed(context, "/home",
        arguments: {'chapters': chapters});
  }

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) => getChapters());
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
