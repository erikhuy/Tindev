import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:searchable_dropdown/searchable_dropdown.dart';
import 'package:tindev/components/rounded_button.dart';
import 'package:multi_select_flutter/multi_select_flutter.dart';
import 'package:tindev/page/SignInPage/sign_in.dart';
import 'package:tindev/theme/colors.dart';
import 'package:http/http.dart' as http;

class SignUpDev3 extends StatefulWidget {
  final String email, password, role, name, phone, gender, city, description;
  final DateTime dob;
  final List<String> listJobType, listCity, listSkill;

  const SignUpDev3({
    Key key,
    this.email,
    this.password,
    this.role,
    this.name,
    this.dob,
    this.phone,
    this.gender,
    this.city,
    this.description,
    this.listJobType,
    this.listCity,
    this.listSkill,
  }) : super(key: key);

  @override
  _SignUpDev3State createState() => _SignUpDev3State();
}

class _SignUpDev3State extends State<SignUpDev3> {
  String selectedJobType;
  TextEditingController yOEController = TextEditingController();
  TextEditingController exSalaryController = TextEditingController();
  String selectedCity;
  List<String> _listSelectedSkills = [];

  String error = "";

  final _multiSelectKey = GlobalKey<FormFieldState>();

  void _validate() {
    setState(() {
      _doSignUpForDev(context);
    });
  }

  void _doSignUpForDev(BuildContext context) async {
    var url = Uri.parse(
        "https://tindev-api-team-chicken.herokuapp.com/api/v1/user/register");
    var response = await http.post(
      url,
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode({
        'email': widget.email,
        'password': widget.password,
        'role': widget.role,
        'developer': {
          'full_name': widget.name,
          'birthday': widget.dob.toString(),
          'phone': widget.phone,
          'gender': widget.gender,
          'city': widget.city,
          'description': widget.description,
          'job_expectation': {
            'job_type': selectedJobType,
            'year_experience': int.parse(yOEController.text),
            'expected_salary': int.parse(exSalaryController.text),
            'work_place': selectedCity,
          },
          'skills': _listSelectedSkills,
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
    //jobExpec Mẫu
    // selectedJobType = "AI / Machine Learning / Big Data";
    // yOEController.text = "2";
    // exSalaryController.text = "500";
    // selectedCity = "Hồ Chí Minh";
    // _listSelectedSkills = ["C language", "JavaScript", ".NET"];
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
                  //txtTitle1
                  Container(
                    padding: EdgeInsets.only(left: size.width * 0.04),
                    child: Align(
                      alignment: Alignment.bottomLeft,
                      child: Text(
                        "Job",
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
                        "Expectation",
                        style: TextStyle(
                          fontSize: 48.0,
                          fontWeight: FontWeight.w900,
                          color: Colors.blue[600],
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: size.height * 0.05),
                  //txtJobType
                  Container(
                    width: size.width * 0.8,
                    height: size.height * 0.125,
                    child: InputDecorator(
                      decoration: InputDecoration(
                        labelText: "Job type",
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
                        onChanged: (jobTypeValue) {
                          setState(() {
                            selectedJobType = jobTypeValue;
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
                  //txtYoE-txtExSalary
                  Container(
                    width: size.width * 0.8,
                    child: Row(
                      children: [
                        //txtYoE
                        Container(
                          width: size.width * 0.38,
                          child: TextField(
                            controller: yOEController,
                            keyboardType: TextInputType.number,
                            style: TextStyle(fontSize: 16),
                            decoration: InputDecoration(
                              labelText: "Year of Experience",
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
                  SizedBox(height: size.height * 0.025),
                  //txtWorkPlace
                  Container(
                    width: size.width * 0.8,
                    height: size.height * 0.125,
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
                        searchHint: null,
                        onChanged: (cityValue) {
                          setState(() {
                            selectedCity = cityValue;
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
                  SizedBox(height: size.height * 0.01),
                  //btnFinish
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
