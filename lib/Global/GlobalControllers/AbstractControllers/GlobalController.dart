// ignore_for_file: file_names, non_constant_identifier_names

import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart';

import '../../GlobalString/Strings.dart';

abstract class GlobalController{

  snackBar(text , context) {
    SnackBar snackBar =  SnackBar(
        content: Text(
          text,
          style: const TextStyle(fontSize: 18),
        ));
    ScaffoldMessenger.of(getContext()).showSnackBar(snackBar);
  }

  getContext();
  getString();

  navigateTo(destintaion){
    print(getString());
    Navigator.push(
      getContext(),
      MaterialPageRoute(builder: (context) => destintaion),
    );
  }


  Future<Response> HttpPost(String api , Map body) async{
    var url = Uri.parse("${Strings.serverURL}$api");
    return await post(url,   headers: {"Content-Type": "application/json"},  body: jsonEncode(body));
  }


}