// ignore_for_file: file_names, prefer_const_constructors

import 'package:flutter/material.dart';
import '../../../Global/GlobalStyle/Style.dart';
import '../AuthWidgets/Logo.dart';
import '../AuthWidgets/RegistrationButton.dart';
import '../AuthWidgets/TextButtonWidget.dart';
import 'Control/SignUpControl.dart';
import 'Widgets/InfoTextFields.dart';

class SignUp extends StatefulWidget {
  const SignUp({Key? key}) : super(key: key);

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends SignUpControl {

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



}
