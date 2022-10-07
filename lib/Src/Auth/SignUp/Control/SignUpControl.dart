// ignore_for_file: file_names, prefer_typing_uninitialized_variables, use_build_context_synchronously



 import 'package:flutter/cupertino.dart';

import '../../../../Global/GlobalControllers/AbstractControllers/GlobalController.dart';
import '../../SignIn/SignIn.dart';
import '../Model/SignUpModel.dart';
import '../SignUp.dart';

abstract class SignUpControl extends  State<SignUp> with GlobalController{
 // Declaring and initializing variables Section/////////////////////////////////
 Map<String, bool> isHidden = {"password": true, "confirmPassword": true};     //
 Map signUpData = SignUpModel().toMap(), signUpDataError = {};                 //
 //  End section of Declaring and initializing variables/////////////////////////


 @override
 getContext() {
  return context;
 }

 @override
 getString() {
  return "this is from Signup screen";
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
   navigateTo(const SignIn());
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

