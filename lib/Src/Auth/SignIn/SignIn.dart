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

class _SignInState extends SignInControl {

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




}
