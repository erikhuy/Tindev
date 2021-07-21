import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:tindev/page/login.dart';
import 'package:tindev/page/recover_password.dart';
import 'package:tindev/page/sign_up_for_developer_1.dart';
import 'package:tindev/page/sign_up_for_employer_1.dart';
import 'package:tindev/page/sign_up_option.dart';
import 'package:tindev/page/welcome_screen.dart';


void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Tindev',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: WelcomeScreen(),
    );
  }

  Widget widgetLogin() {
    return Login();
  }

  Widget widgetResetPassword() {
    return RecoverPassword();
  }

  Widget widgetSignUpOption(){
    return SignUpOption(
    );
  }

  Widget widgetSignUpForDeveloper() {
    return SignUpForDeveloper();
  }

  Widget widgetSignUpForEmployer() {
    return SignUpForEmployer();
  }
}
