import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:tindev/components/rounded_button.dart';
import 'package:tindev/page/SignUp/SignUpCom/sign_up_com_2.dart';
import 'package:tindev/services/CityServices.dart';

class SignUpCom1 extends StatefulWidget {
  @override
  _SignUpCom1State createState() => _SignUpCom1State();
}

class _SignUpCom1State extends State<SignUpCom1> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController rePasswordController = TextEditingController();

  String error = "";
  static List<String> _listCities;

  void _validate() {
    setState(() {
      if (emailController.text.isEmpty && passwordController.text.isEmpty) {
        error = "Email & Password cannot blank!";
      } else if (emailController.text.isEmpty ||
          passwordController.text.isEmpty) {
        error = "Email & Password cannot blank!";
      } else if (rePasswordController.text != passwordController.text) {
        error = "Re-Password is not match!";
      } else {
        _sendDataToScreen2(context);
      }
    });
  }

  void _sendDataToScreen2(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => SignUpCom2(
          email: emailController.text,
          password: passwordController.text,
          role: 'Company',
          listCity: _listCities,
        ),
      ),
    );
  }

  void clearError() {
    error = "";
  }

  @override
  void initState() {
    super.initState();
    CityServices.getCities().then((cities) {
      setState(() {
        // ignore: deprecated_member_use
        List<String> listCityName = new List();
        for (var i = 0; i < cities.length; i++) {
          listCityName.add(cities[i].name);
        }
        _listCities = listCityName;
      });
    });
    //account mẫu
    // emailController.text = "testCom@gmail.com";
    // passwordController.text = "111111";
    // rePasswordController.text = "111111";
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
          alignment: Alignment.topLeft,
          children: <Widget>[
            SingleChildScrollView(
              child: Column(
                children: <Widget>[
                  SizedBox(height: size.height * 0.01),
                  //txtTitle
                  Container(
                    padding: EdgeInsets.only(left: size.width * 0.04),
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
                  //txtTitle
                  Container(
                    padding: EdgeInsets.only(left: size.width * 0.04),
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
                  //txtEmail
                  Container(
                    width: size.width * 0.8,
                    child: TextField(
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
                  SizedBox(height: size.height * 0.05),
                  //txtPass
                  Container(
                    width: size.width * 0.8,
                    child: TextField(
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
                      onTap: () {
                        clearError();
                      },
                    ),
                  ),
                  SizedBox(height: size.height * 0.05),
                  //txtRePass
                  Container(
                    width: size.width * 0.8,
                    child: TextField(
                      controller: rePasswordController,
                      keyboardType: TextInputType.text,
                      style: TextStyle(fontSize: 16),
                      decoration: InputDecoration(
                        labelText: "Re-password",
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
                  SizedBox(height: size.height * 0.25),
                  //btnNext
                  Container(
                    width: size.width * 0.8,
                    child: RoundedButton(
                      text: "Next",
                      press: () {
                        _validate();
                      },
                    ),
                  ),
                  SizedBox(height: size.height * 0.02),
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
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}