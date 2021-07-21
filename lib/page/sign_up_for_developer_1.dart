import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:tindev/components/rounded_button.dart';
import 'package:tindev/page/sign_up_for_developer_2.dart';

class SignUpForDeveloper extends StatefulWidget {
  @override
  _SignUpForDeveloperState createState() => _SignUpForDeveloperState();
}

class _SignUpForDeveloperState extends State<SignUpForDeveloper> {
  // TextEditingController _textEditingControllerEmail =
  //     new TextEditingController();
  // TextEditingController _textEditingControllerPassword =
  //     new TextEditingController();
  bool isNoVisiblePassword = true;

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
          alignment: Alignment.topLeft,
          children: <Widget>[
            SingleChildScrollView(
              child: Column(
                children: <Widget>[
                  SizedBox(height: size.height * 0.02),
                  Container(
                    padding: EdgeInsets.only(left: 15),
                    child: Align(
                      alignment: Alignment.bottomLeft,
                      child: Text(
                        "Account",
                        style: TextStyle(
                          fontSize: 48.0,
                          fontWeight: FontWeight.w900,
                          color: Colors.blue[600],
                        ),
                      ),
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.only(left: 15),
                    child: Align(
                      alignment: Alignment.bottomLeft,
                      child: Text(
                        "Infomation",
                        style: TextStyle(
                          fontSize: 48.0,
                          fontWeight: FontWeight.w900,
                          color: Colors.blue[600],
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: size.height * 0.05),
                  Container(
                    width: size.width * 0.8,
                    child: TextField(
                      keyboardType: TextInputType.text,
                      style: TextStyle(fontSize: 16),
                      decoration: InputDecoration(
                        labelText: "Email",
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10)),
                        labelStyle: TextStyle(
                          color: Colors.blue[600],
                          fontSize: 16.0,
                        ),
                        floatingLabelBehavior: FloatingLabelBehavior.always,
                      ),
                    ),
                  ),
                  SizedBox(height: size.height * 0.05),
                  Container(
                    width: size.width * 0.8,
                    child: TextField(
                      keyboardType: TextInputType.text,
                      style: TextStyle(fontSize: 16),
                      decoration: InputDecoration(
                        labelText: "Password",
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          // borderSide: BorderSide(color: Colors.white),
                        ),
                        labelStyle: TextStyle(
                          color: Colors.blue[600],
                          fontSize: 16.0,
                        ),
                        floatingLabelBehavior: FloatingLabelBehavior.always,
                      ),
                    ),
                  ),
                  SizedBox(height: size.height * 0.05),
                  Container(
                    width: size.width * 0.8,
                    child: TextField(
                      keyboardType: TextInputType.text,
                      style: TextStyle(fontSize: 16),
                      decoration: InputDecoration(
                        labelText: "Re-password",
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          // borderSide: BorderSide(color: Colors.white),
                        ),
                        labelStyle: TextStyle(
                          color: Colors.blue[600],
                          fontSize: 16.0,
                        ),
                        floatingLabelBehavior: FloatingLabelBehavior.always,
                      ),
                    ),
                  ),
                  SizedBox(height: size.height * 0.05),
                  Container(
                    width: size.width * 0.8,
                    child: RoundedButton(
                      text: "Next",
                      press: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) {
                              return SignUpForDeveloper2();
                            },
                          ),
                        );
                      },
                    ),
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