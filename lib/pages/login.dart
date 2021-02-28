import 'package:drept_civil/widgets/login_form.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class Login extends StatefulWidget {
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
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
              LoginForm(
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
                height: 5,
              ),
              InkWell(
                child: Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Text("Creează un cont",
                      style: TextStyle(
                        color: Colors.grey,
                        fontSize: 15,
                      )),
                ),
                onTap: () {
                  Navigator.pushNamed(context, "/create_account");
                },
              )
            ],
          )),
    );
  }
}
