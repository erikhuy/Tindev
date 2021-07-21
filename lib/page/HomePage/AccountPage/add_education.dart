import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:searchable_dropdown/searchable_dropdown.dart';
import 'package:tindev/components/rounded_button.dart';

class AddEducation extends StatefulWidget {
  final String token;
  final List<String> listUni;

  const AddEducation({Key key, this.token, this.listUni}) : super(key: key);
  @override
  _AddEducationState createState() => _AddEducationState();
}

class _AddEducationState extends State<AddEducation> {
  String selectedUni;
  // TextEditingController schNameController = TextEditingController();
  TextEditingController majorController = TextEditingController();
  String valueStatus;
  TextEditingController startYearController = TextEditingController();
  TextEditingController endYearController = TextEditingController();

  String error = "";

  List listItem = ["Studying", "Graduated"];

  void _validate() {
    setState(() {
      _doSaveEducationInfo(context);
    });
  }

  void _doSaveEducationInfo(BuildContext context) async {
    var url = Uri.parse(
        "https://tindev-api-team-chicken.herokuapp.com/api/v1/educations");
    var response = await http.post(
      url,
      headers: {
        'Content-Type': 'application/json; charset=UTF-8',
        'Authorization': 'Bearer ' + widget.token,
      },
      body: jsonEncode({
        "school_name": selectedUni,
        "from_year": startYearController.text,
        "to_year": endYearController.text,
        "is_studying": valueStatus == "Studying" ? true : false,
        "majors": majorController.text
      }),
    );
    if (response.statusCode == 200) {
      setState(() {
        Navigator.of(context).pop();
      });
    } else {
      setState(() {
        error = response.body;
      });
    }
  }

  void clearError() {
    error = "";
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
                  Container(
                    padding: EdgeInsets.only(left: size.width * 0.04),
                    child: Align(
                      alignment: Alignment.bottomLeft,
                      child: Text(
                        "Education",
                        style: TextStyle(
                          fontSize: 48.0,
                          fontWeight: FontWeight.w900,
                          color: Colors.blue[600],
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: size.height * 0.05),
                  Container(
                    width: size.width * 0.8,
                    height: size.height * 0.125,
                    child: InputDecorator(
                      decoration: InputDecoration(
                        labelText: "University",
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
                        items: widget.listUni
                                ?.map((uni) => DropdownMenuItem<String>(
                                    value: uni, child: Text(uni)))
                                ?.toList() ??
                            [],
                        hint: Text(
                          "Select University",
                          style: TextStyle(
                            fontSize: 16,
                            color: Colors.black54,
                          ),
                        ),
                        onChanged: (valueUni) {
                          setState(() {
                            selectedUni = valueUni;
                            clearError();
                          });
                        },
                        isExpanded: true,
                        iconSize: 16.0,
                        displayClearIcon: false,
                      ),
                    ),
                  ),
                  // Container(
                  //   width: size.width * 0.8,
                  //   child: TextField(
                  //     controller: schNameController,
                  //     keyboardType: TextInputType.text,
                  //     style: TextStyle(fontSize: 16),
                  //     decoration: InputDecoration(
                  //       labelText: "School Name",
                  //       border: OutlineInputBorder(
                  //           borderRadius: BorderRadius.circular(10)),
                  //       labelStyle: TextStyle(
                  //         color: Colors.blue[600],
                  //         fontSize: 16.0,
                  //       ),
                  //       floatingLabelBehavior: FloatingLabelBehavior.always,
                  //     ),
                  //     onTap: () {
                  //       clearError();
                  //     },
                  //   ),
                  // ),
                  SizedBox(height: size.height * 0.05),
                  Container(
                    width: size.width * 0.8,
                    child: TextField(
                      controller: majorController,
                      keyboardType: TextInputType.text,
                      style: TextStyle(fontSize: 16),
                      decoration: InputDecoration(
                        labelText: "Major",
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          // borderSide: BorderSide(color: Colors.white),
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
                  Container(
                    width: size.width * 0.8,
                    height: size.width * 0.16,
                    child: InputDecorator(
                      decoration: InputDecoration(
                        labelText: "Status",
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
                          value: valueStatus,
                          onChanged: (newValue) {
                            setState(() {
                              valueStatus = newValue;
                            });
                          },
                          onTap: () {
                            clearError();
                          },
                          items: listItem.map((valueItem) {
                            return DropdownMenuItem(
                              value: valueItem,
                              child: Text(valueItem),
                            );
                          }).toList()),
                    ),
                  ),
                  SizedBox(height: size.height * 0.05),
                  Container(
                    width: size.width * 0.8,
                    child: Row(
                      children: [
                        Container(
                          width: size.width * 0.38,
                          child: TextField(
                            controller: startYearController,
                            keyboardType: TextInputType.number,
                            style: TextStyle(fontSize: 16),
                            decoration: InputDecoration(
                              labelText: "Start Year",
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
                            controller: endYearController,
                            keyboardType: TextInputType.number,
                            style: TextStyle(fontSize: 16),
                            decoration: InputDecoration(
                              labelText: "Graduate Year",
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
                  SizedBox(height: size.height * 0.05),
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
