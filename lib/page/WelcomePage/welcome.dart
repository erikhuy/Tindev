import 'package:flutter/material.dart';
import 'package:tindev/page/SignInPage/sign_in.dart';
import 'package:tindev/page/SignUp/sign_up_option.dart';

import 'package:tindev/components/rounded_button.dart';
import 'package:tindev/constants.dart';
import 'package:flutter_svg/svg.dart';

class Welcome extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      body: Container(
        height: size.height,
        width: double.infinity,
        child: Stack(
          alignment: Alignment.center,
          children: <Widget>[
            Container(
              height: size.height,
              width: size.width,
              child: Image(
                image: AssetImage('assets/welcome_working.jpg'),
                fit: BoxFit.cover,
              ),
            ),
            Container(
              height: size.height,
              width: size.width,
              color: Colors.white.withOpacity(0.7),
            ),
            Positioned(
              child: SingleChildScrollView(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    SizedBox(height: size.height * 0.3),
                    SvgPicture.asset(
                      "assets/Tindev_logo.svg",
                      fit: BoxFit.cover,
                      height: size.height * 0.1,
                    ),
                    SizedBox(height: size.height * 0.3),
                    RoundedButton(
                      text: "SIGN IN",
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
                    RoundedButton(
                      text: "SIGN UP",
                      color: kPrimaryLightColor,
                      textColor: Colors.black,
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
          ],
        ),
      ),
    );
  }
}
