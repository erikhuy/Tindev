
import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:searchable_dropdown/searchable_dropdown.dart';
import 'package:tindev/components/rounded_button.dart';
import 'package:tindev/models/ComAcc.dart';
import 'package:tindev/models/JobList.dart';

class EditInfoCom extends StatefulWidget {
  final String token;
  final CompanyClass com;
  final List<JobRec> listJobReq;
  final List<String> listCity, listJobType, listSkill;

  const EditInfoCom({
    Key key,
    this.com,
    this.listCity,
    this.listJobType,
    this.listSkill,
    this.listJobReq,
    this.token,
  }) : super(key: key);

  @override
  _EditInfoComState createState() => _EditInfoComState();
}

class _EditInfoComState extends State<EditInfoCom> {
  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  String selectedCity, getNewCity;
  TextEditingController phoneController = TextEditingController();
  TextEditingController taxCodeController = TextEditingController();
  TextEditingController descController = TextEditingController();

  String error = "";

  void _validate() {
    setState(() {
      _doSaveInfo(context);
    });
  }

  void _doSaveInfo(BuildContext context) async {
    var url = Uri.parse(
        "https://tindev-api-team-chicken.herokuapp.com/api/v1/companies/my-info");
    var response = await http.put(
      url,
      headers: {
        'Content-Type': 'application/json; charset=UTF-8',
        'Authorization': 'Bearer ' + widget.token,
      },
      body: jsonEncode({
        "name": nameController.text,
        "phone": phoneController.text,
        "city": getNewCity,
        "tax_code": taxCodeController.text,
        "description": descController.text,
        "facebook_url": "",
        "linkedin_url": "",
        "photo_id": "",
        "twitter_url": ""
      }),
    );
    if (response.statusCode == 200) {
      setState(() {
        Navigator.of(context).pop();
      });
    } else {
      setState(() {
        print(response.statusCode.toString() + response.body);
      });
    }
  }

  void clearError() {
    error = "";
  }

  @override
  void initState() {
    super.initState();
    nameController.text = widget.com.name;
    emailController.text = widget.com.email;
    selectedCity = widget.com.city;
    getNewCity = selectedCity;
    phoneController.text = widget.com.phone;
    taxCodeController.text = widget.com.taxCode;
    descController.text = widget.com.description;
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        iconTheme: IconThemeData(color: Colors.black),
        title: Text(
          'Edit Information',
          style: TextStyle(
            color: Colors.black,
          ),
        ),
        backgroundColor: Colors.white,
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
                  //txtTitle1
                  Container(
                    padding: EdgeInsets.only(left: size.width * 0.1),
                    child: Align(
                      alignment: Alignment.bottomLeft,
                      child: Text(
                        "Employer",
                        style: TextStyle(
                          fontSize: 32.0,
                          fontWeight: FontWeight.w900,
                          color: Colors.blue[600],
                        ),
                      ),
                    ),
                  ),
                  //txtTitle2
                  Container(
                    padding: EdgeInsets.only(left: size.width * 0.1),
                    child: Align(
                      alignment: Alignment.bottomLeft,
                      child: Text(
                        "Information",
                        style: TextStyle(
                          fontSize: 32.0,
                          fontWeight: FontWeight.w900,
                          color: Colors.blue[600],
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: size.height * 0.02),
                  //txtEmail
                  Container(
                    width: size.width * 0.8,
                    child: TextField(
                      controller: emailController,
                      readOnly: true,
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
                  //txtComName
                  Container(
                    width: size.width * 0.8,
                    child: TextField(
                      controller: nameController,
                      keyboardType: TextInputType.text,
                      style: TextStyle(fontSize: 16),
                      decoration: InputDecoration(
                        labelText: "Company's Name",
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
                      child: SearchableDropdown(
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
                        value: selectedCity,
                        onChanged: (valueCity) {
                          setState(() {
                            selectedCity = valueCity;
                            selectedCity = "";
                            getNewCity = valueCity;
                            clearError();
                          });
                        },
                        isExpanded: true,
                        iconSize: 16.0,
                        displayClearIcon: false,
                      ),
                    ),
                  ),
                  SizedBox(height: size.height * 0.02),
                  //txtPhone
                  Container(
                    width: size.width * 0.8,
                    child: Row(
                      children: [
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
                  SizedBox(height: size.height * 0.02),
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
                  SizedBox(height: size.height * 0.05),
                  //btnFinish
                  Container(
                    child: RoundedButton(
                      text: "Save",
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
