import 'package:tindev/components/already_have_an_account_check.dart';
import 'package:tindev/components/rounded_button.dart';
import 'package:tindev/constants.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:tindev/page/RecoverPage/recovery_password_confirm.dart';
import 'package:tindev/page/SignInPage/sign_in.dart';
import 'package:http/http.dart' as http;

class RecoverPassword extends StatefulWidget {
  @override
  _RecoverPasswordState createState() => _RecoverPasswordState();
}

class _RecoverPasswordState extends State<RecoverPassword> {
  TextEditingController emailController = TextEditingController();

  String error = "";

  bool isValidate = false;
  String email;

  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  void _validate() {
    if (formKey.currentState.validate()) {
      setState(() {
        isValidate = true;
        if (isValidate && emailController.text != "") {
          _doSendConfirmEmail(context);
        } else {
          error = "Please input your email";
        }
      });
    }
  }

  void _doSendConfirmEmail(BuildContext context) async {
    var url = Uri.parse(
        "https://tindev-api-team-chicken.herokuapp.com/api/v1/user/forgot-password/${emailController.text}");
    var response = await http.post(
      url,
    );
    if (200 == response.statusCode) {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) {
            return RecoverPasswordConfirm();
          },
        ),
      );
    } else {
      setState(() {
        // error = "Invalid Email";
        error = response.body;
      });
    }
  }

  void clearError() {
    error = "";
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        automaticallyImplyLeading: false,
        elevation: 0,
        leading: Navigator.canPop(context)
            ? IconButton(
                padding: EdgeInsets.fromLTRB(8, 24.0, 0.0, 0.0),
                icon: Icon(
                  Icons.arrow_back_ios_new_rounded,
                  color: Colors.blue[600],
                  size: 32,
                ),
                onPressed: () => Navigator.of(context).pop(),
              )
            : null,
      ),
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
                  SizedBox(height: size.height * 0.02),
                  Text(
                    "Forgot your password ?",
                    style: TextStyle(
                      color: Colors.blue[600],
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: size.height * 0.015),
                  Text(
                    "Enter your registered email to receive reset intruction",
                    style: TextStyle(
                      color: Colors.blue[800],
                      fontSize: 12,
                      fontWeight: FontWeight.w400,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(height: size.height * 0.05),
                  SvgPicture.asset(
                    "assets/login.svg",
                    height: size.height * 0.35,
                  ),
                  SizedBox(height: size.height * 0.03),
                  Form(
                    key: formKey,
                    child: Column(
                      children: [
                        Container(
                          margin: EdgeInsets.symmetric(vertical: 10),
                          padding:
                              EdgeInsets.symmetric(horizontal: 20, vertical: 5),
                          width: size.width * 0.8,
                          decoration: BoxDecoration(
                            color: kPrimaryLightColor,
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: TextFormField(
                            controller: emailController,
                            keyboardType: TextInputType.emailAddress,
                            decoration: InputDecoration(
                              icon: Icon(
                                Icons.person,
                                color: kPrimaryColor,
                              ),
                              hintText: "Your's Email",
                              border: InputBorder.none,
                            ),
                            // validator: (value) {
                            //   if (value.isEmpty) {
                            //     error = "*Please input your email";
                            //     return null;
                            //   } else {
                            //     return null;
                            //   }
                            // },
                            onTap: () {
                              clearError();
                              // print("EMAILLLLLLLLLLL"+emailController.text+"HAI");
                            },
                          ),
                        ),
                        SizedBox(height: size.height * 0.03),
                        Container(
                          width: size.width * 0.4,
                          child: RoundedButton(
                            text: "CONFIRM",
                            press: () {
                              _validate();
                            },
                          ),
                        ),
                        SizedBox(height: size.height * 0.03),
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
                      ],
                    ),
                  ),
                  SizedBox(height: size.height * 0.072),
                  AlreadyHaveAnAccountCheck(
                    login: false,
                    remember: true,
                    press: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) {
                            return SignIn();
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
}
