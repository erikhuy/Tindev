import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:searchable_dropdown/searchable_dropdown.dart';
import 'package:tindev/components/rounded_button.dart';
import 'package:tindev/page/SignInPage/sign_in.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';
import 'package:http/http.dart' as http;

class SignUpCom2 extends StatefulWidget {
  final String email, password, role;
  final List<String> listCity;

  const SignUpCom2({
    Key key,
    this.email,
    this.password,
    this.role,
    this.listCity,
  }) : super(key: key);

  @override
  _SignUpCom2State createState() => _SignUpCom2State();
}

class _SignUpCom2State extends State<SignUpCom2> {
  TextEditingController nameController = TextEditingController();
  String selectedCity;
  TextEditingController phoneController = TextEditingController();
  TextEditingController taxCodeController = TextEditingController();
  TextEditingController descController = TextEditingController();

  String error = "";

  File _image;
  final picker = ImagePicker();
  Future getImage() async {
    final pickedFile = await picker.getImage(source: ImageSource.gallery);
    setState(() {
      if (pickedFile != null) {
        _image = File(pickedFile.path);
      } else {
        print('No image selected');
      }
    });
  }

  void _validate() {
    setState(() {
      _doSignUpForEmp(context);
    });
  }

  Future<void> _doSignUpForEmp(BuildContext context) async {
    var url = Uri.parse(
        "https://tindev-api-team-chicken.herokuapp.com/api/v1/user/register");
    var response = await http.post(
      url,
      headers: {
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode({
        'email': widget.email,
        'password': widget.password,
        'role': widget.role,
        'company': {
          'name': nameController.text,
          'phone': phoneController.text,
          'city': selectedCity,
          'tax_code': taxCodeController.text,
          'description': descController.text,
        }
      }),
    );
    if (response.statusCode == 200) {
      setState(() {
        Navigator.pushAndRemoveUntil(
          context,
          MaterialPageRoute(
            builder: (context) => SignIn(),
          ),
          (route) => false,
        );
      });
    } else {
      setState(() {
        print(response.body);
        error = "Fail!";
      });
    }
  }

  void clearError() {
    error = "";
  }

  @override
  void initState() {
    super.initState();
    //empInfo Mẫu
    // nameController.text = "Test Com";
    // selectedCity = "Hồ Chí Minh";
    // phoneController.text = "0908000002";
    // taxCodeController.text = "0790000002";
    // descController.text = "Test Description for Company";
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
                  //header
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          //txtTitle1
                          Container(
                            padding: EdgeInsets.only(left: size.width * 0.04),
                            child: Align(
                              alignment: Alignment.bottomLeft,
                              child: Text(
                                "Employer",
                                style: TextStyle(
                                  fontSize: 48.0,
                                  fontWeight: FontWeight.w900,
                                  color: Colors.blue[600],
                                ),
                              ),
                            ),
                          ),
                          //txtTitle2
                          Container(
                            padding: EdgeInsets.only(left: size.width * 0.04),
                            child: Align(
                              alignment: Alignment.bottomLeft,
                              child: Text(
                                "Information",
                                style: TextStyle(
                                  fontSize: 48.0,
                                  fontWeight: FontWeight.w900,
                                  color: Colors.blue[600],
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                      Container(
                        padding: EdgeInsets.only(left: size.width * 0.01),
                        width: size.width * 0.25,
                        height: size.width * 0.25,
                        child: InputDecorator(
                          decoration: InputDecoration(
                            labelText: "Image",
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                            labelStyle: TextStyle(
                              color: Colors.blue[600],
                              fontSize: 16.0,
                            ),
                            floatingLabelBehavior: FloatingLabelBehavior.always,
                          ),
                          child: _image == null
                              ? FloatingActionButton(
                                  onPressed: getImage,
                                  tooltip: 'Increment',
                                  child: Icon(
                                    Icons.add_a_photo,
                                  ),
                                )
                              : Image.file(_image),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: size.height * 0.02),
                  //txtName
                  Container(
                    width: size.width * 0.8,
                    child: TextField(
                      controller: nameController,
                      keyboardType: TextInputType.text,
                      style: TextStyle(fontSize: 16),
                      decoration: InputDecoration(
                        labelText: "Name",
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
                  SizedBox(height: size.height * 0.025),
                  //txtCity
                  Container(
                    width: size.width * 0.8,
                    height: size.height * 0.125,
                    child: InputDecorator(
                      decoration: InputDecoration(
                        labelText: "City",
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                        labelStyle: TextStyle(
                          color: Colors.blue[600],
                          fontSize: 16.0,
                        ),
                        floatingLabelBehavior: FloatingLabelBehavior.always,
                      ),
                      child: SearchableDropdown.single(
                        items: widget.listCity
                                ?.map((city) => DropdownMenuItem<String>(
                                    value: city, child: Text(city)))
                                ?.toList() ??
                            [],
                        hint: Text(
                          "Select City",
                          style: TextStyle(
                            fontSize: 16,
                            color: Colors.black54,
                          ),
                        ),
                        onChanged: (valueCity) {
                          setState(() {
                            selectedCity = valueCity;
                            clearError();
                          });
                        },
                        isExpanded: true,
                        iconSize: 16.0,
                        displayClearIcon: false,
                      ),
                    ),
                  ),
                  SizedBox(height: size.height * 0.025),
                  //txtPhone-txtTaxCode
                  Container(
                    width: size.width * 0.8,
                    child: Row(
                      children: [
                        //txtPhone
                        Container(
                          width: size.width * 0.38,
                          child: TextField(
                            controller: phoneController,
                            keyboardType: TextInputType.number,
                            style: TextStyle(fontSize: 16),
                            decoration: InputDecoration(
                              labelText: "Phone Number",
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10),
                              ),
                              labelStyle: TextStyle(
                                color: Colors.blue[600],
                                fontSize: 16.0,
                              ),
                              floatingLabelBehavior:
                                  FloatingLabelBehavior.always,
                            ),
                            onTap: () {
                              clearError();
                            },
                          ),
                        ),
                        SizedBox(width: size.width * 0.04),
                        //txtTaxCode
                        Container(
                          width: size.width * 0.38,
                          child: TextField(
                            controller: taxCodeController,
                            keyboardType: TextInputType.number,
                            style: TextStyle(fontSize: 16),
                            decoration: InputDecoration(
                              labelText: "Tax Code",
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10),
                              ),
                              labelStyle: TextStyle(
                                color: Colors.blue[600],
                                fontSize: 16.0,
                              ),
                              floatingLabelBehavior:
                                  FloatingLabelBehavior.always,
                            ),
                            onTap: () {
                              clearError();
                            },
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: size.height * 0.025),
                  //txtDescription
                  Container(
                    width: size.width * 0.8,
                    child: TextField(
                      controller: descController,
                      minLines: 5,
                      maxLines: null,
                      keyboardType: TextInputType.text,
                      style: TextStyle(fontSize: 16),
                      decoration: InputDecoration(
                        labelText: "Description",
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
                  SizedBox(height: size.height * 0.083),
                  //btnNext
                  Container(
                    width: size.width * 0.8,
                    child: RoundedButton(
                      text: "Finish",
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