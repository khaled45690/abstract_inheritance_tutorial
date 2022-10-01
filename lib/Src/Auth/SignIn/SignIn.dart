// ignore_for_file: file_names

import 'package:abstract_inheritance_tutorial/Src/Auth/SignIn/widgets/TextFields.dart';
import 'package:flutter/material.dart';
import '../../../Global/GlobalControllers/AbstractControllers/GlobalController.dart';
import '../../../Global/GlobalStyle/Style.dart';
import '../AuthWidgets/Logo.dart';
import '../AuthWidgets/RegistrationButton.dart';
import '../AuthWidgets/TextButtonWidget.dart';
import '../SignUp/SignUp.dart';
import 'Control/SignInControl.dart';
import 'Model/SignInModel.dart';

class SignIn extends StatefulWidget {
  const SignIn({Key? key}) : super(key: key);

  @override
  State<SignIn> createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  // Declaring and initializing variables Section//////////////////
  late SignInControl signInControl;                              //
  GlobalController globalController = GlobalController();        //
  SignInModel signInData = SignInModel();                        //
  bool isHidden = true;                                          //
  Map loginData = SignInModel().toMap() , loginDataError = {};   //
  //  End section of Declaring and initializing variables//////////





  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height,
      decoration: Style.scaffoldDecoration,
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Logo("Sign In"),
            TextFields(visibilityChange, onChange,
                loginData , loginDataError, isHidden),
            SizedBox(height: (MediaQuery.of(context).size.height / 5.5)),
            RegistrationButton(
                "Sign in", login),
            const SizedBox(height: 30),
            TextButtonWidget(
                "Don't have account then sign up", navigate),
          ],
        ),
      ),
    ));
  }


  visibilityChange() {
    setState(() {
      isHidden = !isHidden;
    });
  }

  onChange(String variableName, String value) {
    loginData[variableName] = value;
    setState(() {
      loginDataError[variableName] = null;
    });
  }

  navigate() {
    Navigator.of(context).pop();
    globalController.navigateTo(context, const SignUp());
  }

  void login(BuildContext context) async {
    if (_check()) return;
    _removeUnwantedWhiteSpaces();

    // snackBar(responseData["message"] , context);

  }

  bool _check() {
    bool check = false;
    for (var key in loginData.keys) {
      {
      if (loginData[key] == null)
        {
          setState(() {
            check = true;
            loginDataError[key] = "this field is required";
          });
        }
    }
    }
    return check;
  }

  _removeUnwantedWhiteSpaces(){
    loginData["email"] = loginData["email"].replaceAll(' ', '');
    loginData["password"] = loginData["password"].replaceAll(' ', '');
  }
}
