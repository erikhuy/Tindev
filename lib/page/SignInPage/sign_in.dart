import 'dart:convert';

import 'package:jwt_decoder/jwt_decoder.dart';
import 'package:tindev/components/already_have_an_account_check.dart';
import 'package:tindev/constants.dart';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:tindev/page/RecoverPage/recover_password.dart';

import 'package:tindev/page/SignUp/sign_up_option.dart';

import 'package:http/http.dart' as http;
import 'package:tindev/provider/AccountProvider.dart';

class SignIn extends StatefulWidget {
  @override
  _SignInState createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  String error = "";

  void _validate() {
    setState(() {
      if (emailController.text.isEmpty && passwordController.text.isEmpty) {
        error = "Incorrect Email or Password";
      } else if (emailController.text.isEmpty ||
          passwordController.text.isEmpty) {
        error = "Incorrect Email or Password";
      } else {
        _doLogin(emailController.text, passwordController.text);
      }
    });
  }

  void _doLogin(String email, String password) async {
    var url = Uri.parse(
        "https://tindev-api-team-chicken.herokuapp.com/api/v1/user/login");
    var response = await http.post(
      url,
      headers: {
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode({
        'email': email,
        'password': password,
      }),
    );
    if (response.statusCode == 200) {
      var token = response.body.toString();
      var decodedToken = JwtDecoder.decode(response.body.toString());
      setState(() {
        Navigator.pushAndRemoveUntil(
          context,
          MaterialPageRoute(
            builder: (_) => AccountProvider(
              token: token,
              account: decodedToken,
            ),
          ),
          (route) => false,
        );
      });
    } else {
      setState(() {
        print("Error: " + response.body);
        error = "Incorrect Email or Password";
      });
    }
  }

  void clearError() {
    error = "";
  }

  @override
  void initState() {
    super.initState();
    // account mẫu 1
    // emailController.text = "hautt@gmail.com";
    // passwordController.text = "111111";
    // account mẫu 2
    // emailController.text = "dxloc1@gmail.com";
    // passwordController.text = "111111";
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          width: size.width,
          height: size.height,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              SizedBox(height: size.height * 0.105),
              //logo
              SvgPicture.asset(
                "assets/login.svg",
                // "assets/Tindev_logo.svg",
                height: size.height * 0.35,
              ),
              SizedBox(height: size.height * 0.05),
              //txtEmail
              Container(
                width: size.width * 0.8,
                child: TextFormField(
                  controller: emailController,
                  keyboardType: TextInputType.text,
                  style: TextStyle(fontSize: 16),
                  decoration: InputDecoration(
                    labelText: "Email",
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    labelStyle: TextStyle(
                      color: Colors.blue[600],
                      fontSize: 16.0,
                    ),
                    floatingLabelBehavior: FloatingLabelBehavior.always,
                  ),
                  onTap: () {
                    clearError();
                  },
                ),
              ),
              SizedBox(height: size.height * 0.02),
              //txtPass
              Container(
                width: size.width * 0.8,
                child: TextFormField(
                  controller: passwordController,
                  keyboardType: TextInputType.text,
                  style: TextStyle(fontSize: 16),
                  decoration: InputDecoration(
                    labelText: "Password",
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    labelStyle: TextStyle(
                      color: Colors.blue[600],
                      fontSize: 16.0,
                    ),
                    floatingLabelBehavior: FloatingLabelBehavior.always,
                  ),
                  obscureText: true,
                  onTap: () {
                    clearError();
                  },
                ),
              ),
              SizedBox(height: size.height * 0.02),
              //btnForgotPass
              Container(
                width: size.width * 0.8,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    GestureDetector(
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
                      child: Text(
                        'Forgot your password?',
                        style: TextStyle(
                          color: kPrimaryColor,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: size.height * 0.045),
              //btnSignin
              Container(
                alignment: Alignment.center,
                // ignore: deprecated_member_use
                child: RaisedButton(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(80.0),
                  ),
                  textColor: Colors.white,
                  padding: const EdgeInsets.all(0),
                  onPressed: () {
                    _validate();
                  },
                  child: Container(
                    alignment: Alignment.center,
                    height: 50.0,
                    width: size.width * 0.45,
                    decoration: new BoxDecoration(
                      //color: Colors.blue,
                      borderRadius: BorderRadius.circular(80.0),
                      gradient: new LinearGradient(
                        colors: [
                          Colors.blue[400],
                          Colors.blue[600],
                        ],
                      ),
                    ),
                    padding: const EdgeInsets.all(0),
                    child: Text(
                      "SIGN IN",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 24,
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(height: size.height * 0.06),
              //txtError
              Container(
                alignment: Alignment.center,
                width: size.width * 0.9,
                child: GestureDetector(
                  onTap: () => {},
                  child: Text(
                    error,
                    style: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.bold,
                      color: Colors.red,
                    ),
                  ),
                ),
              ),
              SizedBox(height: size.height * 0.06),
              //btnSignUp
              AlreadyHaveAnAccountCheck(
                press: () {
                  Navigator.pushAndRemoveUntil(
                    context,
                    MaterialPageRoute(
                      builder: (context) {
                        return SignUpOption();
                      },
                    ),
                    (route) => false,
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
