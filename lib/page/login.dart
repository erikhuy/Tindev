import 'package:tindev/components/already_have_an_account_acheck.dart';
import 'package:tindev/components/rounded_button.dart';
import 'package:tindev/components/rounded_input_field.dart';
import 'package:tindev/components/rounded_password_field.dart';
import 'package:tindev/constants.dart';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:tindev/page/home_company.dart';
import 'package:tindev/page/recover_password.dart';

import 'package:tindev/page/sign_up_option.dart';
import 'package:tindev/page/home_developer.dart';

class Login extends StatefulWidget {
  const Login({Key key}) : super(key: key);
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  // String role = "dev";
  String role = "company";

  TextEditingController _textEditingControllerEmail =
      new TextEditingController();
  TextEditingController _textEditingControllerPassword =
      new TextEditingController();
  bool isNoVisiblePassword = true;
  bool isRecoverPassword = false;
  bool isSignUp = false;

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      // appBar:
      //  AppBar(
      //   backgroundColor: Colors.blue[600],
      //   elevation: 0,
      //   centerTitle: true,
      //   title: Text(
      //     'Login',
      //     style: TextStyle(
      //       color: Colors.white,
      //       fontWeight: FontWeight.bold,
      //       fontSize: 20,
      //     ),
      //   ),
      // ),
      body: Container(
        width: double.infinity,
        height: size.height,
        child: Stack(
          alignment: Alignment.center,
          children: <Widget>[
            SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  SizedBox(height: size.height * 0.08),
                  SvgPicture.asset(
                    "assets/login.svg",
                    height: size.height * 0.35,
                  ),
                  SizedBox(height: size.height * 0.03),
                  RoundedInputField(
                    hintText: "Your Email",
                    onChanged: (value) {},
                  ),
                  RoundedPasswordField(
                    onChanged: (value) {},
                  ),
                  Container(
                      padding: EdgeInsets.only(top: 5, bottom: 5, left: 190),
                      child: GestureDetector(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) {
                                  return RecoverPassword();
                                },
                              ),
                            );
                          },
                          child: Text("Forgot password ?",
                              style: TextStyle(
                                color: kPrimaryColor,
                                fontWeight: FontWeight.bold,
                              )))),
                  RoundedButton(
                    text: "LOG IN",
                    press: () {
                      if (role == "company") {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) {
                              return CompanyHome();
                            },
                          ),
                        );
                      } else {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) {
                              return HomeDeveloper();
                            },
                          ),
                        );
                      }
                    },
                  ),
                  SizedBox(height: size.height * 0.12),
                  AlreadyHaveAnAccountCheck(
                    press: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) {
                            return SignUpOption();
                          },
                        ),
                      );
                    },
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
   
    );
  }

  void clearInputValue() {
    this._textEditingControllerPassword.clear();
    this._textEditingControllerEmail.clear();
  }
}
