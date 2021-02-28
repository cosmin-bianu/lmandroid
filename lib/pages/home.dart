import 'package:drept_civil/services/app_client.dart';
import 'package:drept_civil/services/keychain.dart';
import 'package:rounded_loading_button/rounded_loading_button.dart';
import 'package:drept_civil/widgets/chapter_list.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Home extends StatelessWidget {
  final RoundedLoadingButtonController _btnController =
      new RoundedLoadingButtonController();

  @override
  Widget build(BuildContext context) {
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
                    "Drept civil",
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 30,
                    ),
                  ),
                  centerTitle: true,
                  stretchModes: <StretchMode>[StretchMode.fadeTitle],
                ),
                backgroundColor: Colors.white,
                leading: new Container(),
                actions: <Widget>[
                  Text("Setări")
                ],
              ),
              ChapterList(),
    //          SliverToBoxAdapter(
    //            child: Padding(
    //              padding: const EdgeInsets.symmetric(vertical: 16.0),
    //              child: RoundedLoadingButton(
    //                child: Text(
    //                  "Log out",
    //                  style: TextStyle(color: Colors.white, fontSize: 19.5),
    //                ),
    //                color: Colors.red,
    //                width: 150,
    //                controller: _btnController,
    //                onPressed: () {
    //                  _logout(context: context);
    //                },
    //                elevation: 15,
    //              ),
    //            ),
    //          )
            ],
          ),
      )
    );
  }

  void _logout({@required var context}) {
    _btnController.start();
    Keychain.getInstance().destroyCredentials();
    AppClient.getInstance().logout();

    if (Navigator.canPop(context)) {
      Navigator.pop(context);
    } else {
      Navigator.pushReplacementNamed(context, "/");
    }
  }
}
