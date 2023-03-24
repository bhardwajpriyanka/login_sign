import 'dart:math';
import 'package:flutter/material.dart';
import 'package:signin_signup/screen/createaccount/view/createaccount_screen.dart';
import 'package:signin_signup/screen/login/login_screen.dart';
import 'package:signin_signup/screen/welcome/welcome_screen.dart';

void main() {
  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      routes: {
        '/':(context) => LoginScreen(),
        'signup':(context) => Createaccount(),
        'welcome':(context) =>WelComeScreen(),
      },
    ),
  );
}