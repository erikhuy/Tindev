import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:tindev/components/rounded_button.dart';
import 'package:multi_select_flutter/multi_select_flutter.dart';
import 'package:tindev/page/home_developer.dart';

import 'package:tindev/theme/colors.dart';

class SignUpForDeveloper3 extends StatefulWidget {
  @override
  _SignUpForDeveloper3State createState() => _SignUpForDeveloper3State();
}

class Skill {
  final int id;
  final String name;

  Skill({
    this.id,
    this.name,
  });
}

class _SignUpForDeveloper3State extends State<SignUpForDeveloper3> {
  
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

  
  final _multiSelectKey = GlobalKey<FormFieldState>();
  final controllerCity = TextEditingController();
  DateTime dateTimeStart;
  DateTime dateTimeEnd;
  String selectedCity;
  String valueChoose, valueTypeChoose,valueTypeTime;
  String timeType;
  String valuePlace;
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
  @override
  void initState() {
    _selectedSkills3 = _skills;
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
                  SizedBox(height: size.height * 0.02),
                  
                  Container(
                    child: Row(
                      children: [
                        Container(
                          height: 120,
                          child: Column(
                            children: [
                              Container(
                                padding: EdgeInsets.only(right: 152),
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
                              Container(
                                padding: EdgeInsets.only(left: 24),
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
                          child: InputDecorator(
                              decoration: InputDecoration(
                                labelText: "Experience Time",
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                labelStyle: TextStyle(
                                  color: Colors.blue[600],
                                  fontSize: 16.0,
                                ),
                              ),
                              child: Row(
                                children: [
                                  Container(
                                    width: size.width * 0.172,
                                    child: TextField(
                                      keyboardType: TextInputType.number,
                                      decoration: InputDecoration(
                                        isDense: true,
                                        contentPadding:
                                            EdgeInsets.symmetric(vertical: 0),
                                        border: InputBorder.none,
                                      ),
                                      style: TextStyle(fontSize: 16),
                                    ),
                                  ),
                                  Container(
                                    width: size.width * 0.16,
                                    child: DropdownButton(
                                      elevation: 0,
                                      isDense: true,
                                      hint: Text("Type"),
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
                                      value: valueTypeTime,
                                      onChanged: (newValue) {
                                        setState(() {
                                          valueTypeTime = newValue;
                                        });
                                      },
                                      items: listTimeItem.map((valueItem) {
                                        return DropdownMenuItem(
                                          value: valueItem,
                                          child: Text(valueItem),
                                        );
                                      }).toList(),
                                    ),
                                  )
                                ],
                              )),
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
                 
                  SizedBox(height: size.height * 0.02),
                  Container(
                    width: size.width * 0.8,
                    child: RoundedButton(
                      text: "Finish",
                      press: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) {
                              return HomeDeveloper();
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
      // floatingActionButton: FloatingActionButton(
      //   onPressed: getImage,
      //   tooltip: 'Increment',
      //   child: Icon(Icons.add_a_photo),
      // ),
    );
  }
}
