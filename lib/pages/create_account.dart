import 'package:drept_civil/widgets/account_creation_form.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class CreateAccount extends StatefulWidget {
  @override
  _CreateAccountState createState() => _CreateAccountState();
}

class _CreateAccountState extends State<CreateAccount> {
  bool _isLogoVisible = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
          color: Colors.white,
          child: Column(
            mainAxisAlignment: _isLogoVisible
                ? MainAxisAlignment.center
                : MainAxisAlignment.end,
            children: <Widget>[
              Visibility(
                child: Image(
                  image: AssetImage('assets/icon/icon.png'),
                  height: 200,
                  width: 200,
                ),
                visible: _isLogoVisible,
              ),
              AccountCreationForm(
                hideLogo: () {
                  setState(() {
                    _isLogoVisible = false;
                  });
                },
                showLogo: () {
                  setState(() {
                    _isLogoVisible = true;
                  });
                },
              ),
              SizedBox(
                height: 10,
              )
            ],
          )),
    );
  }
}
