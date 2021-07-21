import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:searchable_dropdown/searchable_dropdown.dart';
import 'package:tindev/components/rounded_button.dart';
import 'package:tindev/page/SignUp/SignUpDev/sign_up_dev_3.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';

import 'package:tindev/components/button_widget.dart';
import 'package:intl/intl.dart';

import 'package:tindev/services/JobTypeServices.dart';
import 'package:tindev/services/SkillServices.dart';

class SignUpDev2 extends StatefulWidget {
  final String email, password, role;
  final List<String> listCity;

  const SignUpDev2({
    Key key,
    this.email,
    this.password,
    this.role,
    this.listCity,
  }) : super(key: key);

  @override
  _SignUpDev2State createState() => _SignUpDev2State();
}

class _SignUpDev2State extends State<SignUpDev2> {
  TextEditingController nameController = TextEditingController();
  DateTime dateTime;
  String gender;
  TextEditingController phoneController = TextEditingController();
  String selectedCity;
  TextEditingController descController = TextEditingController();

  String error = "";

  static List<String> _listJobTypes;
  static List<String> _listSkills;
  List listGender = ["Male", "Female"];

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

  String getDateTime() {
    if (dateTime == null) {
      return '-';
    } else {
      return DateFormat('yyyy-MM-dd').format(dateTime);
    }
  }

  Future pickDateTime(BuildContext context) async {
    final date = await pickDate(context);
    if (date == null) return;

    setState(() {
      dateTime = DateTime(
        date.year,
        date.month,
        date.day,
      );
    });
  }

  Future<DateTime> pickDate(BuildContext context) async {
    final initialDate = DateTime.now();
    final newDate = await showDatePicker(
      context: context,
      initialDate: dateTime ?? initialDate,
      firstDate: DateTime(DateTime.now().year - 100),
      lastDate: DateTime.now(),
    );

    if (newDate == null) return null;

    return newDate;
  }

  void _validate() {
    setState(() {
      _sendDataToScreen3(context);
    });
  }

  void _sendDataToScreen3(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => SignUpDev3(
          email: widget.email,
          password: widget.password,
          role: widget.role,
          name: nameController.text,
          dob: DateTime.parse(getDateTime()),
          phone: phoneController.text,
          gender: gender,
          city: selectedCity,
          description: descController.text,
          listCity: widget.listCity,
          listJobType: _listJobTypes,
          listSkill: _listSkills,
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
    JobTypeServices.getJobType().then((jobTypes) {
      setState(() {
        // ignore: deprecated_member_use
        List<String> listJobTypeName = new List();
        for (var i = 0; i < jobTypes.length; i++) {
          listJobTypeName.add(jobTypes[i].name);
        }
        _listJobTypes = listJobTypeName;
      });
    });
    SkillServices.getSkills().then((skills) {
      setState(() {
        // ignore: deprecated_member_use
        List<String> listSkillName = new List();
        for (var i = 0; i < skills.length; i++) {
          listSkillName.add(skills[i].name);
        }
        _listSkills = listSkillName;
      });
    });
    //perInfo mẫu
    // nameController.text = "Test Dev";
    // dateTime = DateTime.parse("2000-01-01");
    // gender = "Male";
    // phoneController.text = "0908000001";
    // selectedCity = "Hồ Chí Minh";
    // descController.text = "About me";
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
                                "Personal",
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
                      //imagePicker
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
                                // FloatingActionButton(
                                //   onPressed: getImage,
                                //   tooltip: 'Increment',
                                //   child: Icon(
                                //     Icons.add_a_photo,
                                //   ),
                                // ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: size.height * 0.01),
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
                  //txtBirthday-txtGender
                  Container(
                    width: size.width * 0.8,
                    child: Row(
                      children: [
                        ButtonHeaderWidget(
                          //txtBirthday
                          width: size.width * 0.4,
                          height: 60,
                          marginIndex: 20.0,
                          title: 'Birthday',
                          text: getDateTime(),
                          onClicked: () => pickDateTime(context),
                        ),
                        SizedBox(width: size.width * 0.04),
                        Container(
                          //txtGender
                          width: size.width * 0.36,
                          height: 60,
                          child: InputDecorator(
                            decoration: InputDecoration(
                              labelText: "Gender",
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10)),
                              labelStyle: TextStyle(
                                color: Colors.blue[600],
                                fontSize: 16.0,
                              ),
                              floatingLabelBehavior:
                                  FloatingLabelBehavior.always,
                            ),
                            child: DropdownButton(
                              items: listGender.map((chosenGender) {
                                return DropdownMenuItem(
                                  value: chosenGender,
                                  child: Text(chosenGender),
                                );
                              }).toList(),
                              hint: Text(""),
                              dropdownColor: Colors.white,
                              icon: Icon(
                                Icons.arrow_drop_down_rounded,
                                color: Colors.blue[600],
                              ),
                              iconSize: 16,
                              isExpanded: true,
                              underline: SizedBox(),
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 16,
                              ),
                              value: gender,
                              onChanged: (newValue) {
                                setState(() {
                                  gender = newValue;
                                  clearError();
                                });
                              },
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  //txtPhone
                  Container(
                    width: size.width * 0.8,
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
                            fontSize: 20,
                            color: Colors.black54,
                          ),
                        ),
                        onChanged: (value) {
                          setState(() {
                            selectedCity = value;
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
                  //txtDescription
                  Container(
                    width: size.width * 0.8,
                    child: TextField(
                      controller: descController,
                      minLines: 4,
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
                  SizedBox(height: size.height * 0.026),
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