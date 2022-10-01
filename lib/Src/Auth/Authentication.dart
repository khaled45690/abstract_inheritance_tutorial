// ignore_for_file: file_names, prefer_const_constructors, use_key_in_widget_constructors

import 'package:flutter/material.dart';

import 'SignIn/SignIn.dart';
import 'SignUp/SignUp.dart';

class Authentication extends StatefulWidget {
  // the RegistrationType variable gets it's value from parent widget to determine
  // if it will the SignIn screen or SignUp screen
  final bool registrationType;
  const Authentication(this.registrationType);

  @override
  State<Authentication> createState() => _AuthenticationState();
}

class _AuthenticationState extends State<Authentication> {
  @override
  Widget build(BuildContext context) {
    return widget.registrationType ? SignIn() : SignUp();
  }
}

