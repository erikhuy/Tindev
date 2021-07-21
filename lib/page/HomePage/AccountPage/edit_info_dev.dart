import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:searchable_dropdown/searchable_dropdown.dart';
import 'package:tindev/models/DevAcc.dart';
import 'package:tindev/theme/colors.dart';
import 'package:tindev/components/button_widget.dart';
import 'package:tindev/components/rounded_button.dart';
import 'package:intl/intl.dart';
import 'package:multi_select_flutter/multi_select_flutter.dart';
import 'package:http/http.dart' as http;

class EditInfoDev extends StatefulWidget {
  final String token;
  final DeveloperClass dev;
  final List<String> listCity, listJobType, listSkill;

  const EditInfoDev({
    Key key,
    this.token,
    this.dev,
    this.listCity,
    this.listJobType,
    this.listSkill,
  }) : super(key: key);

  @override
  _EditInfoDevState createState() => _EditInfoDevState();
}

class _EditInfoDevState extends State<EditInfoDev> {
  TextEditingController emailController = TextEditingController();
  TextEditingController nameController = TextEditingController();
  DateTime birthDay;
  String gender;
  TextEditingController phoneController = TextEditingController();
  String selectedCity, getNewCity;

  String selectedJobType, getNewJobType;
  TextEditingController exTimeController = TextEditingController();
  TextEditingController exSalaryController = TextEditingController();
  String selectedWorkPlace, getNewWorkPlace;
  List<String> _listSelectedSkills;
  TextEditingController descController = TextEditingController();

  String error = "";

  List listItem = ["Male", "Female"];
  final _multiSelectKey = GlobalKey<FormFieldState>();

  String getDateTime() {
    if (birthDay == null) {
      return '-';
    } else {
      return DateFormat('yyyy-MM-dd').format(birthDay);
    }
  }

  Future pickDateTime(BuildContext context) async {
    final date = await pickDate(context);
    if (date == null) return;
    setState(() {
      birthDay = DateTime(
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
      initialDate: birthDay ?? initialDate,
      firstDate: DateTime(DateTime.now().year - 100),
      lastDate: DateTime(DateTime.now().year + 5),
    );

    if (newDate == null) return null;

    return newDate;
  }

  void _validate() {
    setState(() {
      _doSaveInfo(context);
    });
  }

  void _doSaveInfo(BuildContext context) async {
    var url = Uri.parse(
        'https://tindev-api-team-chicken.herokuapp.com/api/v1/developers/my-info');
    var response = await http.put(
      url,
      headers: {
        'Content-Type': 'application/json; charset=UTF-8',
        'Authorization': 'Bearer ' + widget.token,
      },
      body: jsonEncode({
        "full_name": nameController.text,
        "birthday": birthDay.toString(),
        "phone": phoneController.text,
        "gender": gender,
        "city": getNewCity,
        "facebook_url": "",
        "linkedin_url": "",
        "twitter_url": "",
        "photo_id": "",
        "description": descController.text,
        "job_expectation": {
          "job_type": getNewJobType,
          "year_experience": int.parse(exTimeController.text),
          "expected_salary": int.parse(exSalaryController.text),
          "work_place": getNewWorkPlace
        },
        "skills": _listSelectedSkills
      }),
    );
    if (response.statusCode == 200) {
      setState(() {
        Navigator.of(context).pop();
        // Navigator.pushAndRemoveUntil(
        //   context,
        //   MaterialPageRoute(
        //     builder: (context) => HomeDev(),
        //   ),
        //   (route) => false,
        // );
      });
    } else {
      setState(() {
        print(response.body);
      });
    }
  }

  void clearError() {
    error = "";
  }

  @override
  void initState() {
    super.initState();
    emailController.text = widget.dev.email;
    nameController.text = widget.dev.fullName;
    birthDay = widget.dev.birthday;
    gender = widget.dev.gender;
    phoneController.text = widget.dev.phone;
    selectedCity = widget.dev.city;
    getNewCity = selectedCity;

    selectedJobType = widget.dev.jobExpectation.jobType;
    getNewJobType = selectedJobType;
    exTimeController.text = widget.dev.jobExpectation.yearExperience.toString();
    exSalaryController.text =
        widget.dev.jobExpectation.expectedSalary.toString();
    selectedWorkPlace = widget.dev.jobExpectation.workPlace;
    getNewWorkPlace = selectedWorkPlace;
    _listSelectedSkills = widget.dev.skills.toList();
    descController.text = widget.dev.description;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: grey.withOpacity(0.2),
      body: getBody(),
    );
  }

  Widget getBody() {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(color: Colors.black),
        title: Text(
          'Edit Information',
          style: TextStyle(
            color: Colors.black,
          ),
        ),
        backgroundColor: white,
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
                        "Personal",
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
                        "Infomation",
                        style: TextStyle(
                          fontSize: 32.0,
                          fontWeight: FontWeight.w900,
                          color: Colors.blue[600],
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: size.height * 0.03),
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
                        //txtBirthday
                        ButtonHeaderWidget(
                          width: size.width * 0.38,
                          height: 60,
                          marginIndex: 20.0,
                          title: 'Birthday',
                          text: getDateTime(),
                          onClicked: () {
                            setState(() {
                              pickDateTime(context);
                            });
                          },
                        ),
                        SizedBox(width: size.width * 0.04),
                        //txtGender
                        Container(
                          width: size.width * 0.38,
                          height: 60,
                          child: InputDecorator(
                            decoration: InputDecoration(
                              labelText: "Gender",
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
                            child: DropdownButton(
                              items: listItem.map((valueItem) {
                                return DropdownMenuItem(
                                  value: valueItem,
                                  child: Text(valueItem),
                                );
                              }).toList(),
                              hint: Text(""),
                              value: gender,
                              onChanged: (valueGender) {
                                setState(() {
                                  gender = valueGender;
                                });
                              },
                              isExpanded: true,
                              iconSize: 16,
                              dropdownColor: Colors.white,
                              icon: Icon(
                                Icons.arrow_drop_down_rounded,
                                color: Colors.black54,
                              ),
                              underline: SizedBox(),
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 16,
                              ),
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
                  SizedBox(height: size.height * 0.02),
                  //txtCity
                  Container(
                    width: size.width * 0.8,
                    height: size.height * 0.1425,
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
                  SizedBox(height: size.height * 0.03),
                  //txtTitle3
                  Container(
                    padding: EdgeInsets.only(left: size.width * 0.1),
                    child: Align(
                      alignment: Alignment.bottomLeft,
                      child: Text(
                        "Job",
                        style: TextStyle(
                          fontSize: 32.0,
                          fontWeight: FontWeight.w900,
                          color: Colors.blue[600],
                        ),
                      ),
                    ),
                  ),
                  //txtTitle4
                  Container(
                    padding: EdgeInsets.only(left: size.width * 0.1),
                    child: Align(
                      alignment: Alignment.bottomLeft,
                      child: Text(
                        "Expectation",
                        style: TextStyle(
                          fontSize: 32.0,
                          fontWeight: FontWeight.w900,
                          color: Colors.blue[600],
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: size.height * 0.03),
                  //txtJobType
                  Container(
                    width: size.width * 0.8,
                    height: size.height * 0.1425,
                    child: InputDecorator(
                      decoration: InputDecoration(
                        labelText: "Job Type",
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
                        items: widget.listJobType
                                ?.map((jobType) => DropdownMenuItem<String>(
                                    value: jobType, child: Text(jobType)))
                                ?.toList() ??
                            [],
                        hint: Text(
                          "Select Job Type",
                          style: TextStyle(
                            fontSize: 16,
                            color: Colors.black54,
                          ),
                        ),
                        value: selectedJobType,
                        onChanged: (valueJobType) {
                          setState(() {
                            selectedJobType = valueJobType;
                            selectedJobType = "";
                            getNewJobType = valueJobType;
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
                  //txtExpTime-txtExSalary
                  Container(
                    width: size.width * 0.8,
                    child: Row(
                      children: [
                        //txtExpTime
                        Container(
                          width: size.width * 0.38,
                          child: TextField(
                            controller: exTimeController,
                            keyboardType: TextInputType.text,
                            style: TextStyle(fontSize: 16),
                            decoration: InputDecoration(
                              labelText: "Experience Time",
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
                        //txtExSalary
                        Container(
                          width: size.width * 0.38,
                          height: 60,
                          child: TextField(
                            controller: exSalaryController,
                            keyboardType: TextInputType.number,
                            style: TextStyle(fontSize: 16),
                            decoration: InputDecoration(
                              labelText: "Expected Salary",
                              suffixText: "\$",
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
                  //txtWorkPlace
                  Container(
                    width: size.width * 0.8,
                    height: size.height * 0.1425,
                    child: InputDecorator(
                      decoration: InputDecoration(
                        labelText: "Place to work",
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
                        value: selectedWorkPlace,
                        onChanged: (valueWorkPlace) {
                          setState(() {
                            selectedWorkPlace = valueWorkPlace;
                            selectedWorkPlace = "";
                            getNewWorkPlace = valueWorkPlace;
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
                  //txtSkill
                  Container(
                    width: size.width * 0.8,
                    child: InputDecorator(
                      decoration: InputDecoration(
                        labelText: "Skills",
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                        labelStyle: TextStyle(
                          color: Colors.blue[600],
                          fontSize: 16.0,
                        ),
                        floatingLabelBehavior: FloatingLabelBehavior.always,
                      ),
                      child: MultiSelectBottomSheetField<String>(
                        items: widget.listSkill
                                ?.map((skill) =>
                                    MultiSelectItem<String>(skill, skill))
                                ?.toList() ??
                            [],
                        buttonIcon: Icon(
                          Icons.arrow_drop_down_rounded,
                          color: Colors.blue[600],
                          size: 16,
                        ),
                        key: _multiSelectKey,
                        initialChildSize: 0.7,
                        maxChildSize: 0.95,
                        title: Text('''    Search Skills'''),
                        buttonText: Text(
                          "Select Skills",
                          style: TextStyle(
                            fontSize: 16,
                            color: Colors.black54,
                          ),
                        ),
                        searchable: true,
                        initialValue: _listSelectedSkills,
                        onConfirm: (skillValues) {
                          setState(() {
                            _listSelectedSkills = skillValues;
                            clearError();
                          });
                          _multiSelectKey.currentState.validate();
                        },
                        chipDisplay: MultiSelectChipDisplay(
                          onTap: (item) {
                            setState(() {
                              _listSelectedSkills.remove(item);
                            });
                            _multiSelectKey.currentState.validate();
                          },
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(32.0),
                            side: BorderSide(width: 1, color: Colors.blue),
                          ),
                          chipColor: Colors.blue[600],
                          textStyle: TextStyle(color: white),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: size.height * 0.02),
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
                  //btnSave
                  Container(
                    width: size.width * 0.8,
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
