import 'package:flutter/material.dart';
import 'package:tindev/theme/colors.dart';
import 'package:tindev/components/button_widget.dart';
import 'package:tindev/components/rounded_button.dart';
import 'package:tindev/page/account_page.dart';
import 'package:intl/intl.dart';

import 'package:multi_select_flutter/multi_select_flutter.dart';
class AccountPageEditInfo extends StatefulWidget {
  @override
  _AccountPageEditInfoState createState() => _AccountPageEditInfoState();
}
class Skill {
  final int id;
  final String name;

  Skill({
    this.id,
    this.name,
  });
}
class _AccountPageEditInfoState extends State<AccountPageEditInfo> {
  List listItem = ["Male", "Female"];
  DateTime dateTime;
  String valuePlace;
 DateTime dateTimeStart;
  DateTime dateTimeEnd;
  String selectedCity;
  String valueChoose, valueTypeChoose;
  String timeType;
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
 
  List<Skill> _selectedSkills3 = [];
  //List<Skill> _selectedSkills4 = [];
  final _multiSelectKey = GlobalKey<FormFieldState>();
  final controllerCity = TextEditingController();

  List listPlace = ["Ho Chi Minh", "Ha Noi", "Da Nang"];
   List listTypeItem = [
    "Web Developer",
    "Mobile Developer",
    "Game Developer",
    "System",
    "Network",
    "DevOps",
    "Tester",
    "QA - QC",
  ];
  List listTimeItem = [
    "Months",
    "Years",
  ];
  String getText() {
    if (dateTime == null) {
      return '-';
    } else {
      return DateFormat('dd/MM/yyyy').format(dateTime);
    }
  }


 @override
  void initState() {
    _selectedSkills3 = _skills;
    super.initState();
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
        var width = MediaQuery.of(context).size.width;

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
                  SizedBox(height: size.height * 0.05),
                  Container(
                    padding: EdgeInsets.only(left: width*0.1),
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
                  Container(
                    padding: EdgeInsets.only(left: width*0.1),
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
                  SizedBox(height: size.height * 0.05),
                  Container(
                    width: size.width * 0.8,
                    child: TextField(
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
                    ),
                  ),
                  SizedBox(height: size.height * 0.02),
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
                  Container(
                    width: size.width * 0.8,
                    child: Row(
                      children: [
                        ButtonHeaderWidget(
                          height: 60,
                          width: width*0.48,
                          marginIndex: 20.0,
                          title: 'Birthday',
                          text: getText(),
                          onClicked: () => pickDateTime(context),
                        ),
                        SizedBox(width: size.width * 0.037),
                        Container(
                          width: 98,
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
                                  color: Colors.blue[600],
                                  fontSize: 16,
                                ),
                                value: valueChoose,
                                onChanged: (newValue) {
                                  setState(() {
                                    valueChoose = newValue;
                                  });
                                },
                                items: listItem.map((valueItem) {
                                  return DropdownMenuItem(
                                      value: valueItem, child: Text(valueItem));
                                }).toList()),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    width: size.width * 0.8,
                    child: TextField(
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
                    ),
                  ),
                  SizedBox(height: size.height * 0.02),
                  Container(
                    width: size.width * 0.8,
                    child: Container(
                      width: size.width * 0.8,
                      height: 60,
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
                        child: DropdownButton(
                          hint: Text("Select type"),
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
                  ),
                SizedBox(height: size.height * 0.03),
                  
                  Container(
                    child: Row(
                      children: [
                        Container(
                          height: 120,
                          child: Column(
                            children: [
                              Container(
                                padding: EdgeInsets.only(right: width*0.2),
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
                              Container(
                                padding: EdgeInsets.only(left: width*0.1),
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
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
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
                  SizedBox(height: size.height * 0.02),
                  Container(
                    width: size.width * 0.8,
                    height: 60,
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
                      child: DropdownButton(
                        hint: Text("Select type"),
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
                        items: listTypeItem.map((valueItem) {
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
                    child: Row(
                      children: [
                        Container(
                          width: size.width * 0.4,
                          child: TextField(
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
                          ),
                        ),
                        SizedBox(width: size.width * 0.03),
                        Container(
                          width: size.width * 0.37,
                          height: 60,
                          child: TextField(
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
                          ),
                        ),
                      ],
                    ),
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
                        hint: Text("Select type"),
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
                  SizedBox(height: size.height * 0.04),
                  Container(
                    width: size.width * 0.8,
                    child: MultiSelectBottomSheetField<Skill>(
                      buttonIcon:Icon(Icons.arrow_drop_down_rounded,color: Colors.blue[600],size: 16,),
                      key: _multiSelectKey,
                      initialChildSize: 0.7,
                      maxChildSize: 0.95,
                      title: Text('''    Search Skills'''),
                      buttonText: Text("Select Skills",style: TextStyle(fontSize: 16,color: Colors.black54),),
                      items: _items,
                      searchable: true,
                      validator: (values) {
                        if (values == null || values.isEmpty) {
                          return "*Select at least one";
                        }
                        List<String> names = values.map((e) => e.name).toList();
                        // if (names.contains("Frog")) {
                        //   return "Frogs are weird!";
                        // }
                        return null;
                      },
                      onConfirm: (values) {
                        setState(() {
                          _selectedSkills3 = values;
                        });
                        _multiSelectKey.currentState.validate();
                      },
                      chipDisplay: MultiSelectChipDisplay(
                        onTap: (item) {
                          setState(() {
                            _selectedSkills3.remove(item);
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
                 SizedBox(height: size.height * 0.05),
                  Container(
                    width: size.width * 0.8,
                    child: RoundedButton(
                      text: "Save",
                      press: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) {
                              return AccountPage();
                            },
                          ),
                        );
                      },
                    ),
                  ),
                 SizedBox(height: size.height * 0.04),
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
      firstDate: DateTime(DateTime.now().year - 100),
      lastDate: DateTime(DateTime.now().year + 5),
    );

    if (newDate == null) return null;

    return newDate;
  }
}
