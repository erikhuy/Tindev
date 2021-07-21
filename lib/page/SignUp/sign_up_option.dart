import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:tindev/components/already_have_an_account_check.dart';
import 'package:flutter_svg/svg.dart';
import 'package:tindev/page/SignInPage/sign_in.dart';
import 'package:tindev/page/SignUp/SignUpCom/sign_up_com_1.dart';
import 'package:tindev/page/SignUp/SignUpDev/sign_up_dev_1.dart';

class SignUpOption extends StatefulWidget {
  const SignUpOption({Key key}) : super(key: key);
  @override
  _SignUpOptionState createState() => _SignUpOptionState();
}

class _SignUpOptionState extends State<SignUpOption> {
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            SizedBox(height: size.height * 0.05),
            SvgPicture.asset(
              "assets/signup.svg",
              height: size.height * 0.35,
            ),
            SizedBox(height: size.height * 0.1),
            Container(
              width: size.width * 0.9,
              child: Text(
                "Please choose your type of account",
                style: TextStyle(
                  fontSize: 20.0,
                  fontWeight: FontWeight.bold,
                ),
                textAlign: TextAlign.center,
              ),
            ),
            SizedBox(height: size.height * 0.1),
            Container(
              width: size.width * 0.8,
              child: Row(
                children: [
                  Container(
                    width: size.width * 0.38,
                    padding: EdgeInsets.only(right: size.width * 0.03),
                    child: Column(
                      children: [
                        ClipRRect(
                          borderRadius: BorderRadius.circular(10),
                          // ignore: deprecated_member_use
                          child: FlatButton(
                            padding: EdgeInsets.symmetric(
                              vertical: 0,
                              horizontal: 0,
                            ),
                            color: Colors.white,
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) {
                                    return SignUpDev1();
                                  },
                                ),
                              );
                            },
                            child: SvgPicture.asset(
                              "assets/developer_role.svg",
                              height: size.height * 0.18,
                            ),
                          ),
                        ),
                        SizedBox(height: size.height * 0.02),
                        Text(
                          "Developer",
                          style: TextStyle(
                            fontSize: 14.0,
                            fontWeight: FontWeight.bold,
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ],
                    ),
                  ),
                  SizedBox(width: size.width * 0.04),
                  Container(
                    width: size.width * 0.38,
                    child: Column(
                      children: [
                        ClipRRect(
                          borderRadius: BorderRadius.circular(10),
                          // ignore: deprecated_member_use
                          child: FlatButton(
                            padding: EdgeInsets.symmetric(
                              vertical: 0,
                              horizontal: 0,
                            ),
                            color: Colors.white,
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) {
                                    return SignUpCom1();
                                  },
                                ),
                              );
                            },
                            child: SvgPicture.asset(
                              "assets/business_role.svg",
                              height: size.height * 0.18,
                            ),
                          ),
                        ),
                        SizedBox(height: size.height * 0.02),
                        Text(
                          "Company",
                          style: TextStyle(
                            fontSize: 14.0,
                            fontWeight: FontWeight.bold,
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: size.height * 0.1),
            AlreadyHaveAnAccountCheck(
              login: false,
              press: () {
                Navigator.pushAndRemoveUntil(
                  context,
                  MaterialPageRoute(
                    builder: (context) {
                      return SignIn();
                    },
                  ),
                  (route) => false,
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}