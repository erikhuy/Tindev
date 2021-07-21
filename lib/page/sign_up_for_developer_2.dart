import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:tindev/components/rounded_button.dart';
import 'package:tindev/page/sign_up_for_developer_3.dart';
import 'package:tindev/components/button_widget.dart';
import 'package:intl/intl.dart';

import 'dart:io';

import 'package:image_picker/image_picker.dart';

class SignUpForDeveloper2 extends StatefulWidget {
  @override
  _SignUpForDeveloper2State createState() => _SignUpForDeveloper2State();
}

class _SignUpForDeveloper2State extends State<SignUpForDeveloper2> {
  String valueChoose;
  List listItem = ["Male", "Female"];
  DateTime dateTime;
  String valuePlace;

  List listPlace = ["Ho Chi Minh", "Ha Noi", "Da Nang"];
  String getText() {
    if (dateTime == null) {
      return '-';
    } else {
      return DateFormat('dd/MM/yyyy').format(dateTime);
    }
  }

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

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;

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
                          padding: EdgeInsets.only(right: width * 0.04),
                          height: 120,
                          child: Column(
                            children: [
                              Container(
                                padding: EdgeInsets.only(right: width * 0.12),
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
                              Container(
                                padding: EdgeInsets.only(left: width * 0.04),
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
                        ),
                        Container(
                          width: size.width * 0.24,
                          height: size.width * 0.24,
                          child: InputDecorator(
                            decoration: InputDecoration(
                              labelText: "Profile picture",
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
                          width: width*0.28,
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
                 
                  SizedBox(height: size.height * 0.02),
                  Container(
                    width: size.width * 0.8,
                    child: RoundedButton(
                      text: "Next",
                      press: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) {
                              return SignUpForDeveloper3();
                            },
                          ),
                        );
                      },
                    ),
                  )
                
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
      lastDate: DateTime.now(),
    );

    if (newDate == null) return null;

    return newDate;
  }
}
