import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:multi_select_flutter/bottom_sheet/multi_select_bottom_sheet_field.dart';
import 'package:multi_select_flutter/multi_select_flutter.dart';
import 'package:tindev/components/button_widget.dart';
import 'package:tindev/components/rounded_button.dart';
import 'package:tindev/theme/colors.dart';

import 'login.dart';

class SignUpForEmployer3 extends StatefulWidget {
  @override
  _SignUpForEmployer3State createState() => _SignUpForEmployer3State();
}

class Skill {
  final int id;
  final String name;

  Skill({
    this.id,
    this.name,
  });
}

class _SignUpForEmployer3State extends State<SignUpForEmployer3> {
  static List<Skill> _skills = [
    Skill(id: 1, name: "Agile"),
    Skill(id: 2, name: "Android"),
    Skill(id: 3, name: "Angular"),
    Skill(id: 4, name: "ASP.NET"),
    Skill(id: 5, name: "AWS"),
    Skill(id: 6, name: "Blockchain"),
    Skill(id: 7, name: "Bridge Engineer"),
    Skill(id: 8, name: "Business Analyst"),
    Skill(id: 9, name: "C#"),
    Skill(id: 10, name: "C++"),
    Skill(id: 11, name: "CSS"),
    Skill(id: 12, name: "Database"),
    Skill(id: 13, name: "DevOps"),
    Skill(id: 14, name: "Django"),
    Skill(id: 15, name: "HTML5"),
    Skill(id: 16, name: "iOS"),
    Skill(id: 17, name: "Java"),
    Skill(id: 18, name: "JavaScript"),
    Skill(id: 19, name: "JQuery"),
    Skill(id: 20, name: "Linux"),
    Skill(id: 21, name: "MySQL"),
    Skill(id: 22, name: ".NET"),
    Skill(id: 23, name: "VueJS"),
    Skill(id: 24, name: "Wordpress"),
    Skill(id: 25, name: "ReactJS"),
    Skill(id: 26, name: "React Native"),
  ];
  final _items = _skills
      .map((skill) => MultiSelectItem<Skill>(skill, skill.name))
      .toList();

  List<Skill> _selectedSkills = [];
  String salaryFrom;
  String salaryTo;

  String errorSalaryFrom, errorSalaryTo;
  final _multiSelectKey = GlobalKey<FormFieldState>();
  final controllerCity = TextEditingController();

  String valuePlace;
  String valueChoose, valueTypeChoose, valueTypeTime;
  List listPlace = ["Ho Chi Minh", "Ha Noi", "Da Nang"];

  List listTypeTime = [
    "Days",
    "Weeks",
  ];
  List listTypeItem = [
    "Junior",
    "Senior",
    "Master",
  ];
  List listJobTypeItem = [
    "AI",
    "Data",
    "Game Developer",
    "IT Helpdesk",
    "Mobile Developer",
    "Project Manager",
    "Web Developer",
    "Technical Architect",
    "Tester",
  ];
  DateTime dateTime;
  String getText() {
    if (dateTime == null) {
      return '-';
    } else {
      return DateFormat('dd/MM/yyyy').format(dateTime);
    }
  }

  RangeValues values = RangeValues(0, 10000);

  @override
  void initState() {
    _selectedSkills = _skills;

    super.initState();
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
                  Container(
                    child: Row(
                      children: [
                        Container(
                          height: 120,
                          child: Column(
                            children: [
                              Container(
                                padding: EdgeInsets.only(right: 150),
                                child: Align(
                                  alignment: Alignment.bottomLeft,
                                  child: Text(
                                    "Job",
                                    style: TextStyle(
                                        fontSize: 40.0,
                                        fontWeight: FontWeight.w900,
                                        color: Colors.blue[600]),
                                  ),
                                ),
                              ),
                              Container(
                                padding: EdgeInsets.only(left: 15),
                                child: Align(
                                  alignment: Alignment.bottomLeft,
                                  child: Text(
                                    "Requirement",
                                    style: TextStyle(
                                        fontSize: 40.0,
                                        fontWeight: FontWeight.w900,
                                        color: Colors.blue[600]),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: size.height * 0.05),
                  Container(
                    width: size.width * 0.8,
                    child: TextField(
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
                    ),
                  ),
                  // SizedBox(height: size.height * 0.02),
                  Container(
                    width: size.width * 0.8,
                    child: Row(
                      children: [
                        //Years of Experience
                        Container(
                          width: size.width * 0.42,
                          child: TextField(
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
                          ),
                        ),
                        SizedBox(width: size.width * 0.04),

                        //Birthday
                        Container(
                          child: ButtonHeaderWidget(
                            marginIndex: 20.0,
                            width: size.width * 0.34,
                            height: 60,
                            title: 'Expired days',
                            text: getText(),
                            onClicked: () => pickDateTime(context),
                          ),
                        ),
                      ],
                    ),
                  ),
                  // SizedBox(height: size.height * 0.02),

                  Container(
                    width: size.width * 0.8,
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
                          values: values,
                          min: 0,
                          max: 10000,
                          divisions: 100,
                          labels: RangeLabels(
                            values.start.round().toString(),
                            values.end.round().toString(),
                          ),
                          onChanged: (values) {
                            setState(() {
                              this.values = values;
                              print('${this.values.start}' +
                                  "+" +
                                  "${this.values.end}"); // gía liệu Salary From + Salary To
                            });
                          },
                        )),
                  ),

                  SizedBox(height: size.height * 0.02),
                  Container(
                    width: size.width * 0.8,
                    height: 60,
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
                      child: DropdownButton(
                        hint: Text("Select place"),
                        dropdownColor: Colors.white,
                        icon: Icon(
                          Icons.arrow_drop_down_rounded,
                          color: Colors.blue[600],
                        ),
                        iconSize: 16,
                        isExpanded: true,
                        underline: SizedBox(),
                        style: TextStyle(
                          color: Colors.blue[600],
                          fontSize: 16,
                        ),
                        value: valuePlace,
                        onChanged: (newValue) {
                          setState(() {
                            valuePlace = newValue;
                          });
                        },
                        items: listPlace.map((valueItem) {
                          return DropdownMenuItem(
                            value: valueItem,
                            child: Text(valueItem),
                          );
                        }).toList(),
                      ),
                    ),
                  ),
                  SizedBox(height: size.height * 0.02),

                  Container(
                    width: size.width * 0.8,
                    height: 60,
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
                      child: DropdownButton(
                        hint: Text("Select job type"),
                        dropdownColor: Colors.white,
                        icon: Icon(
                          Icons.arrow_drop_down_rounded,
                          color: Colors.blue[600],
                        ),
                        iconSize: 16,
                        isExpanded: true,
                        underline: SizedBox(),
                        style: TextStyle(
                          color: Colors.blue[600],
                          fontSize: 16,
                        ),
                        value: valueTypeChoose,
                        onChanged: (newValue) {
                          setState(() {
                            valueTypeChoose = newValue;
                          });
                        },
                        items: listJobTypeItem.map((valueItem) {
                          return DropdownMenuItem(
                            value: valueItem,
                            child: Text(valueItem),
                          );
                        }).toList(),
                      ),
                    ),
                  ),
                  SizedBox(height: size.height * 0.02),

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
                      child: MultiSelectBottomSheetField<Skill>(
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
                          style: TextStyle(fontSize: 16, color: Colors.black54),
                        ),
                        items: _items,
                        searchable: true,
                        // validator: (values) {
                        //   if (values == null || values.isEmpty) {
                        //     return "*Select at least one";
                        //   }
                        //   // List<String> names = values.map((e) => e.name).toList();
                        //   // // if (names.contains("Frog")) {
                        //   // //   return "Frogs are weird!";
                        //   // // }
                        //   return null;
                        // },
                        onConfirm: (values) {
                          setState(() {
                            _selectedSkills = values;
                          });
                          _multiSelectKey.currentState.validate();
                        },
                        chipDisplay: MultiSelectChipDisplay(
                          onTap: (item) {
                            setState(() {
                              _selectedSkills.remove(item);
                            });
                            _multiSelectKey.currentState.validate();
                          },
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(32.0),
                              side: BorderSide(width: 1, color: Colors.blue)),
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
                      minLines: 5,
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
                    ),
                  ),
                  SizedBox(height: size.height * 0.05),
                  Container(
                    child: RoundedButton(
                      text: "Finish",
                      press: () {
                        Navigator.pushAndRemoveUntil(
                          context,
                          MaterialPageRoute(
                            builder: (BuildContext context) => Login(),
                          ),
                          (route) => false,
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
      firstDate: DateTime.now(),
      lastDate: DateTime(DateTime.now().year + 1),
    );

    if (newDate == null) return null;

    return newDate;
  }
}
