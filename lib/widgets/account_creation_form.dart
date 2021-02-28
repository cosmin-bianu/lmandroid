import 'package:drept_civil/services/app_client.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:rounded_loading_button/rounded_loading_button.dart';
import 'package:flutter_keyboard_visibility/flutter_keyboard_visibility.dart';
import 'package:string_validator/string_validator.dart';

class AccountCreationForm extends StatefulWidget {
  final Function hideLogo;
  final Function showLogo;

  AccountCreationForm({@required this.hideLogo, @required this.showLogo});

  @override
  _AccountCreationFormState createState() => _AccountCreationFormState();
}

class _AccountCreationFormState extends State<AccountCreationForm> {
  final _formKey = GlobalKey<FormState>();
  final RoundedLoadingButtonController _btnController =
      new RoundedLoadingButtonController();
  final _usernameFieldController = TextEditingController();
  final _emailFieldController = TextEditingController();
  final _passwordFieldController = TextEditingController();
  final _confirmPasswordFieldController = TextEditingController();
  final FocusNode _usernameNode = new FocusNode();
  final FocusNode _emailNode = new FocusNode();
  final FocusNode _passwordNode = new FocusNode();
  final FocusNode _confirmPasswordNode = new FocusNode();

  @override
  void initState() {
    super.initState();
    KeyboardVisibility.onChange.listen((visible) {
      visible ? hideLogo() : showLogo();
    });
  } //TODO fix double homepage loading when using the keyboard "done" key

  @override
  Widget build(BuildContext context) {
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
                  validator: _validateCredential,
                  onFieldSubmitted: (term) {
                    _usernameNode.unfocus();
                    FocusScope.of(context).requestFocus(_emailNode);
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
                  controller: _emailFieldController,
                  textInputAction: TextInputAction.next,
                  focusNode: _emailNode,
                  validator: _validateEmail,
                  onFieldSubmitted: (term) {
                    _emailNode.unfocus();
                    FocusScope.of(context).requestFocus(_passwordNode);
                  },
                  decoration: InputDecoration(
                    labelText: "Adresa de e-mail",
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
                    _emailNode.unfocus();
                    FocusScope.of(context).requestFocus(_confirmPasswordNode);
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
                  validator: _validateCredential,
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
                  focusNode: _confirmPasswordNode,
                  onFieldSubmitted: (term) {
                    _register();
                  },
                  decoration: InputDecoration(
                    labelText: "Confirmare parolă",
                    border: InputBorder.none,
                    focusedBorder: InputBorder.none,
                    enabledBorder: InputBorder.none,
                    errorBorder: InputBorder.none,
                    disabledBorder: InputBorder.none,
                    contentPadding: EdgeInsets.only(
                        left: 15, bottom: 11, top: 11, right: 15),
                  ),
                  obscureText: true,
                  controller: _confirmPasswordFieldController,
                  validator: _validateConfirmPassword,
                ),
              ),
              SizedBox(
                height: 20,
              ),
              RoundedLoadingButton(
                child: Text(
                  "Înregistrare",
                  style: TextStyle(color: Colors.white, fontSize: 19.5),
                ),
                color: Colors.black,
                width: 150,
                controller: _btnController,
                onPressed: _register,
                elevation: 15,
              )
            ],
          ),
        ));
  }

  String _validateEmail(String email) {
    if (!isEmail(email)) return "Adresa de e-mail nu este validă.";
  }

  String _validateCredential(String value) {
    bool hasUpperCase = false;
    bool hasLowerCase = false;
    bool hasNumber = false;

    for (int i = 0; i < value.length; i++) {
      String char = value[i];
      if (isNumeric(char))
        hasNumber = true;
      else if (isAlpha(char) && equals(char.toUpperCase(), char))
        hasUpperCase = true;
      else if (isAlpha(char) && equals(char.toLowerCase(), char))
        hasLowerCase = true;
    }

    if (!(hasUpperCase && hasLowerCase && hasNumber))
      return "Cel puțin majusculă, minusculă și o cifră";
  }

  String _validateConfirmPassword(String confirmationPassword) {
    if (!equals(confirmationPassword, _passwordFieldController.text))
      return "Câmpurile pentru parolă trebuie să coincidă";
  }

  Future<void> _register() async {
    _btnController.start();
    if (_formKey.currentState.validate()) {
      String username = _usernameFieldController.text;
      String password = _passwordFieldController.text;
      String email = _emailFieldController.text;
      var response = await AppClient.getInstance().signUp(username, password, email);
      if (response.success) {
        if (await AppClient.getInstance().authenticate(username, password)) {
          _btnController.success();
          Future.delayed(Duration(milliseconds: 700), () {
            Navigator.pushNamed(context, "/load_chapters");
          });
        }
      } else {
        String status;
        switch(response.statusCode){
          default: status = "Pula";
        } //todo

        _btnController.error();
        Scaffold.of(context).showSnackBar(SnackBar(
          content: Text(status),
        ));
        Future.delayed(Duration(milliseconds: 700), () {
          _btnController.reset();
        });
        //HANDLE ERROR
      }
    } else {
      _btnController.error();
      Future.delayed(Duration(milliseconds: 700), () {
        _btnController.reset();
      });
    }
  }

  void hideLogo() {
    this.widget.hideLogo.call();
  }

  void showLogo() {
    this.widget.showLogo.call();
    _usernameNode.unfocus();
    _emailNode.unfocus();
    _passwordNode.unfocus();
    _confirmPasswordNode.unfocus();
  }
}
