import 'package:drept_civil/services/keychain.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:drept_civil/services/app_client.dart';
import 'package:roundcheckbox/roundcheckbox.dart';
import 'package:rounded_loading_button/rounded_loading_button.dart';
import 'package:flutter_keyboard_visibility/flutter_keyboard_visibility.dart';

class LoginForm extends StatefulWidget {
  final Function hideLogo;
  final Function showLogo;

  LoginForm({@required this.hideLogo, @required this.showLogo});

  @override
  _LoginFormState createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  final _formKey = GlobalKey<FormState>();
  final _usernameFieldController = TextEditingController();
  final _passwordFieldController = TextEditingController();
  final FocusNode _usernameNode = new FocusNode();
  final FocusNode _passwordNode = new FocusNode();
  final RoundedLoadingButtonController _btnController =
      new RoundedLoadingButtonController();
  bool _rememberCredentials = false;

  @override
  void initState() {
    super.initState();
    KeyboardVisibility.onChange.listen((visible) {
      visible ? hideLogo() : showLogo();
    });
  } //TODO fix double homepage loading when using the keyboard "done" key

  @override
  void dispose() {
    // Clean up the controller when the widget is disposed.
    _usernameFieldController.dispose();
    _passwordFieldController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    //TODO add validation

    return Form(
      key: _formKey,
      child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            children: <Widget>[
              Material(
                elevation: 10,
                borderRadius: BorderRadius.circular(15),
                child: TextFormField(
                  controller: _usernameFieldController,
                  textInputAction: TextInputAction.next,
                  focusNode: _usernameNode,
                  onFieldSubmitted: (term) {
                    _usernameNode.unfocus();
                    FocusScope.of(context).requestFocus(_passwordNode);
                  },
                  decoration: InputDecoration(
                    labelText: "Nume de utilizator",
                    border: InputBorder.none,
                    focusedBorder: InputBorder.none,
                    enabledBorder: InputBorder.none,
                    errorBorder: InputBorder.none,
                    disabledBorder: InputBorder.none,
                    contentPadding: EdgeInsets.only(
                        left: 15, bottom: 11, top: 11, right: 15),
                  ),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Material(
                elevation: 10,
                borderRadius: BorderRadius.circular(15),
                child: TextFormField(
                  textInputAction: TextInputAction.done,
                  focusNode: _passwordNode,
                  onFieldSubmitted: (term) {
                    _authenticate();
                  },
                  decoration: InputDecoration(
                    labelText: "Parolă",
                    border: InputBorder.none,
                    focusedBorder: InputBorder.none,
                    enabledBorder: InputBorder.none,
                    errorBorder: InputBorder.none,
                    disabledBorder: InputBorder.none,
                    contentPadding: EdgeInsets.only(
                        left: 15, bottom: 11, top: 11, right: 15),
                  ),
                  obscureText: true,
                  controller: _passwordFieldController,
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(0, 0, 0, 15),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    RoundCheckBox(
                      onTap: (choice) {
                        _rememberCredentials = choice;
                      },
                      checkedColor: Colors.black,
                      animationDuration: Duration(milliseconds: 250),
                      size: 30,
                    ),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(8, 0, 0, 0),
                      child: Text("Memorează datele de autentificare",
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 15,
                          )),
                    )
                  ],
                ),
              ),
              RoundedLoadingButton(
                child: Text(
                  "Autentificare",
                  style: TextStyle(color: Colors.white, fontSize: 19.5),
                ),
                color: Colors.black,
                width: 150,
                controller: _btnController,
                onPressed: _authenticate,
                elevation: 15,
              )
            ],
          )),
    );
  }

  //TODO ACTUAL VALIDATION PLEASE
  Future<void> _authenticate() async {
    _btnController.start();
    final String username = _usernameFieldController.text;
    final String password = _passwordFieldController.text;
    Future result = AppClient.getInstance().authenticate(username, password);
    await result.then((authenticated) {
      if (authenticated) {
        _btnController.success();
        Future.delayed(Duration(milliseconds: 800), () {
          if (_rememberCredentials) {
            Keychain keychain = Keychain.getInstance();
            keychain.saveUsername(value: username);
            keychain.savePassword(value: password);
          }
          Navigator.pushReplacementNamed(context, "/load_chapters");
        });
      } else {
        _btnController.error();
        Future.delayed(Duration(milliseconds: 800), () {
          _btnController.reset();
        });
      }
    });
  }

  void hideLogo() {
    this.widget.hideLogo.call();
  }

  void showLogo() {
    this.widget.showLogo.call();
    _usernameNode.unfocus();
    _passwordNode.unfocus();
  }
}
