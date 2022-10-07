// ignore_for_file: file_names, prefer_typing_uninitialized_variables, non_constant_identifier_names, use_build_context_synchronously

import 'package:flutter/cupertino.dart';

import '../../../../Global/GlobalControllers/AbstractControllers/GlobalController.dart';
import '../../SignUp/SignUp.dart';
import '../Model/SignInModel.dart';
import '../SignIn.dart';

abstract class SignInControl extends State<SignIn> with GlobalController {
  // Declaring and initializing variables Section//////////////////
  late SignInControl signInControl; //
  SignInModel signInData = SignInModel(); //
  bool isHidden = true; //
  Map loginData = SignInModel().toMap(), loginDataError = {}; //
  //  End section of Declaring and initializing variables//////////

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    print("this is from initstate");
  }

  @override
  getContext() {
    return context;
  }

  @override
  getString() {
    return "this is from signin";
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
    navigateTo(const SignUp());
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
        if (loginData[key] == null) {
          setState(() {
            check = true;
            loginDataError[key] = "this field is required";
          });
        }
      }
    }
    return check;
  }

  _removeUnwantedWhiteSpaces() {
    loginData["email"] = loginData["email"].replaceAll(' ', '');
    loginData["password"] = loginData["password"].replaceAll(' ', '');
  }
}
