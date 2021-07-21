import 'package:flutter/material.dart';
import 'package:tindev/page/login.dart';
import 'package:tindev/page/sign_up_option.dart';

import 'package:tindev/components/rounded_button.dart';
import 'package:tindev/constants.dart';
import 'package:flutter_svg/svg.dart';

class WelcomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final deviceSize = MediaQuery.of(context).size;

    return Scaffold(
      body: Container(
        height: deviceSize.height,
        width: double.infinity,
        child: Stack(
          alignment: Alignment.center,
          children: <Widget>[
            Container(
              height: deviceSize.height,
              width: deviceSize.width,
              child: Image(
                image: AssetImage('assets/welcome_working.jpg'),
                fit: BoxFit.cover,
              ),
            ),
            Container(
              height: deviceSize.height,
              width: deviceSize.width,
              color: Colors.white.withOpacity(0.7),
            ),
            Positioned(
              child: SingleChildScrollView(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    // Text(
                    //   "WELCOME",
                    //   style: TextStyle(fontWeight: FontWeight.bold),
                    // ),
                    SizedBox(height: MediaQuery.of(context).size.height * 0.3),
                    SvgPicture.asset(
                      "assets/Tindev_logo.svg",
                      fit: BoxFit.cover,
                      height: MediaQuery.of(context).size.height * 0.1,
                    ),
                    SizedBox(height: MediaQuery.of(context).size.height * 0.3),
                    RoundedButton(
                      text: "SIGN IN",
                      press: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) {
                              return Login();
                            },
                          ),
                        );
                      },
                    ),
                    RoundedButton(
                      text: "SIGN UP",
                      color: kPrimaryLightColor,
                      textColor: Colors.black,
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
            ),
          ],
        ),
      ),
    );
  }
}
