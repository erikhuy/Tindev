import 'package:tindev/components/rounded_button.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:tindev/page/login.dart';

class RecoverPasswordConfirm extends StatefulWidget {
  final email;
  const RecoverPasswordConfirm({Key key, this.email}) : super(key: key);
  @override
  _RecoverPasswordConfirmState createState() => _RecoverPasswordConfirmState();
}

class _RecoverPasswordConfirmState extends State<RecoverPasswordConfirm> {
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
                  Container(
                    child: Text(
                      "Email has been sent",
                      style: TextStyle(
                        color: Colors.blue[600],
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  SizedBox(height: size.height * 0.032),
                  Container(
                    child: Text(
                      "Please check your inbox and follow the instruction",
                      style: TextStyle(
                        color: Colors.blue[800],
                        fontSize: 12,
                        fontWeight: FontWeight.w400,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                  SizedBox(height: size.height * 0.05),
                  SvgPicture.asset(
                    "assets/login.svg",
                    height: size.height * 0.35,
                  ),
                  SizedBox(height: size.height * 0.14),
                  
                  RoundedButton(
                    text: "Back To Login",
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
                  SizedBox(height: size.height * 0.12),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
