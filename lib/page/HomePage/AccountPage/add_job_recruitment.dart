import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:multi_select_flutter/bottom_sheet/multi_select_bottom_sheet_field.dart';
import 'package:multi_select_flutter/multi_select_flutter.dart';
import 'package:searchable_dropdown/searchable_dropdown.dart';
import 'package:tindev/components/button_widget.dart';
import 'package:tindev/components/rounded_button.dart';
import 'package:tindev/theme/colors.dart';

class AddRecruitment extends StatefulWidget {
  final String token;
  final List<String> listCity, listJobType, listSkill;

  const AddRecruitment({
    Key key,
    this.listCity,
    this.listJobType,
    this.listSkill,
    this.token,
  }) : super(key: key);
  @override
  _AddRecruitmentState createState() => _AddRecruitmentState();
}

class Skill {
  final int id;
  final String name;

  Skill({
    this.id,
    this.name,
  });
}

class _AddRecruitmentState extends State<AddRecruitment> {
  TextEditingController jobTitleController = TextEditingController();
  TextEditingController yOEController = TextEditingController();
  DateTime expiredDay;
  RangeValues valueRange = RangeValues(0, 5000);
  String selectedWorkPlace, getNewWorkPlace;
  String selectedJobType, getNewJobType;
  List<String> _listSelectedSkills;
  TextEditingController jobDescController = TextEditingController();

  String error = "";
  final _multiSelectKey = GlobalKey<FormFieldState>();


  String getDateTime() {
    if (expiredDay == null) {
      return '-';
    } else {
      return DateFormat('yyyy-MM-dd').format(expiredDay);
    }
  }

  Future pickDateTime(BuildContext context) async {
    final date = await pickDate(context);
    if (date == null) return;
    setState(() {
      expiredDay = DateTime(
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
      initialDate: expiredDay ?? initialDate,
      firstDate: DateTime.now(),
      lastDate: DateTime(DateTime.now().year + 1),
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
        "https://tindev-api-team-chicken.herokuapp.com/api/v1/job-recruitments");
    var response = await http.post(
      url,
      headers: {
        'Content-Type': 'application/json; charset=UTF-8',
        'Authorization': 'Bearer ' + widget.token,
      },
      body: jsonEncode({
        "title": jobTitleController.text,
        "year_experience": yOEController.text,
        "expiried_date": expiredDay.toString(),
        "from_salary": valueRange.start.round(),
        "to_salary": valueRange.end.round(),
        "work_place": getNewWorkPlace,
        "job_type": getNewJobType,
        "skills": _listSelectedSkills,
        "description": jobDescController.text
      }),
    );
    if (response.statusCode == 200) {
      setState(() {
        Navigator.of(context).pop();
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
    jobTitleController.text = "Job Title test";
    yOEController.text = "2";
    expiredDay = DateTime.now();
    valueRange = RangeValues(500, 2000);
    selectedWorkPlace = "Hồ Chí Minh";
    getNewWorkPlace = selectedWorkPlace;
    selectedJobType = "AI / Machine Learning / Big Data";
    getNewJobType = selectedJobType;
    _listSelectedSkills = ["C language", "JavaScript", ".NET"];
    jobDescController.text = "Test for Job Description Company";
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
                        "Add",
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
                        "Recruitment",
                        style: TextStyle(
                          fontSize: 48.0,
                          fontWeight: FontWeight.w900,
                          color: Colors.blue[600],
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: size.height * 0.02),
                  //txtJobTitle
                  Container(
                    width: size.width * 0.8,
                    child: TextField(
                      controller: jobTitleController,
                      keyboardType: TextInputType.text,
                      style: TextStyle(fontSize: 16),
                      decoration: InputDecoration(
                        labelText: "Job Title",
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
                  //txtYoE-txtExDay
                  Container(
                    width: size.width * 0.8,
                    child: Row(
                      children: [
                        //txtYoE
                        Container(
                          width: size.width * 0.36,
                          child: TextField(
                            controller: yOEController,
                            keyboardType: TextInputType.number,
                            style: TextStyle(fontSize: 16),
                            decoration: InputDecoration(
                              labelText: "Years of Experience",
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
                        //txtExDay
                        ButtonHeaderWidget(
                          width: size.width * 0.4,
                          height: 60,
                          marginIndex: 20.0,
                          title: 'Expired days',
                          text: getDateTime(),
                          onClicked: () => pickDateTime(context),
                        ),
                      ],
                    ),
                  ),
                  //txtSalaryRange
                  Container(
                    width: size.width * 0.8,
                    height: size.height * 0.08,
                    child: InputDecorator(
                      decoration: InputDecoration(
                        labelText: "Salary Range",
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                        labelStyle: TextStyle(
                          color: Colors.blue[600],
                          fontSize: 16.0,
                        ),
                        floatingLabelBehavior: FloatingLabelBehavior.always,
                      ),
                      child: RangeSlider(
                        values: valueRange,
                        min: 0,
                        max: 5000,
                        divisions: 100,
                        labels: RangeLabels(
                          valueRange.start.round().toString(),
                          valueRange.end.round().toString(),
                        ),
                        onChanged: (values) {
                          setState(() {
                            valueRange = values;
                            clearError();
                          });
                        },
                      ),
                    ),
                  ),
                  SizedBox(height: size.height * 0.02),
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
                        onChanged: (value) {
                          setState(() {
                            selectedWorkPlace = value;
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
                  //txtJobType
                  Container(
                    width: size.width * 0.8,
                    height: size.height * 0.125,
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
                        onChanged: (value) {
                          setState(() {
                            selectedJobType = value;
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
                        onConfirm: (values) {
                          setState(() {
                            _listSelectedSkills = values;
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
                            side: BorderSide(
                              width: 1,
                              color: Colors.blue,
                            ),
                          ),
                          chipColor: Colors.blue[600],
                          textStyle: TextStyle(color: white),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: size.height * 0.02),
                  //txtJobDesc
                  Container(
                    width: size.width * 0.8,
                    child: TextField(
                      controller: jobDescController,
                      minLines: 4,
                      maxLines: null,
                      keyboardType: TextInputType.text,
                      style: TextStyle(fontSize: 16),
                      decoration: InputDecoration(
                        labelText: "Job Description",
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
                  // SizedBox(height: size.height * 0.012),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
