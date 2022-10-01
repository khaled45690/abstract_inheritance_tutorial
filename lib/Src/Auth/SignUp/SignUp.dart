// ignore_for_file: file_names, prefer_const_constructors

import 'package:flutter/material.dart';
import '../../../Global/GlobalControllers/AbstractControllers/GlobalController.dart';
import '../../../Global/GlobalStyle/Style.dart';
import '../AuthWidgets/Logo.dart';
import '../AuthWidgets/RegistrationButton.dart';
import '../AuthWidgets/TextButtonWidget.dart';
import '../SignIn/SignIn.dart';
import 'Model/SignUpModel.dart';
import 'Widgets/InfoTextFields.dart';

class SignUp extends StatefulWidget {
  const SignUp({Key? key}) : super(key: key);

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  // Declaring and initializing variables Section/////////////////////////////////
  GlobalController globalController = GlobalController();                       //
  Map<String, bool> isHidden = {"password": true, "confirmPassword": true};     //
  Map signUpData = SignUpModel().toMap(), signUpDataError = {};                 //
  //  End section of Declaring and initializing variables/////////////////////////

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SingleChildScrollView(
      child: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        decoration: Style.scaffoldDecoration,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Logo("Sign up"),
            SizedBox(height: 15),
            InfoTextFields(onChange, signUpData, signUpDataError, isHidden,
                visibiltyChange),
            RegistrationButton("Sign up", signup),
            const SizedBox(height: 20),
            TextButtonWidget(
                "Already have account sign in instead", navigateToSignIn),
          ],
        ),
      ),
    ));
  }

  visibiltyChange(variableName) {
    setState(() {
      isHidden[variableName] = isHidden[variableName]!;
    });
  }

  onChange(String variableName, String value) {
    setState(() {
      signUpData[variableName] = value;
      signUpDataError[variableName] = null;
    });
  }

  navigateToSignIn() {
    Navigator.of(context).pop();
    globalController.navigateTo(context, const SignIn());
  }

  signup(BuildContext context) async {
    _removeUnwantedWhiteSpaces();
    if (_nullCheck()) return;
    if (_gmailCheck()) return;
    if (_unMatchPassword()) return;

    // snackBar(responseData["message"] , context);
  }

  bool _nullCheck() {
    bool check = false;
    for (var key in signUpData.keys) {
      {
        if (signUpData[key] == null) {
          setState(() {
            check = true;
            signUpDataError[key] = "this field is required";
          });
        }
      }
    }
    return check;
  }

  bool _gmailCheck() {
    // ^[a-z0-9](\.?[a-z0-9]){5,}@g(oogle)?mail\.com$
    bool gmailCheck;

    RegExp alphanumeric =
        RegExp(r'^[a-z0-9](\.?[a-z0-9]){5,}@g(oogle)?mail\.com$');
    gmailCheck = alphanumeric.hasMatch(signUpData["email"]);
    if (!gmailCheck) {
      setState(() {
        signUpDataError["email"] = "please enter gmail account";
      });
    }

    return !gmailCheck;
  }

  bool _unMatchPassword() {
    bool unMatchPassword;
    unMatchPassword = signUpData["password"] == signUpData["confirmPassword"];
    if (!unMatchPassword) {
      setState(() {
        signUpDataError["password"] =
            "please make sure password match confirm password";
        signUpDataError["confirmPassword"] =
            "please make sure password match confirm password";
      });
    }

    return !unMatchPassword;
  }

  _removeUnwantedWhiteSpaces() {
    signUpData["email"] = signUpData["email"].replaceAll(' ', '');
    signUpData["password"] = signUpData["password"].replaceAll(' ', '');
  }
}
