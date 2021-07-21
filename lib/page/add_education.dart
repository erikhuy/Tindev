import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:tindev/components/button_widget.dart';
import 'package:tindev/components/rounded_button.dart';

class AddEducation extends StatefulWidget {
  @override
  _AddEducationState createState() => _AddEducationState();
}

class _AddEducationState extends State<AddEducation> {
  DateTime dateTimeStudy,dateTimeGraduated;
  List listItem = ["Studying", "Graduated"];
  bool isNoVisiblePassword = true;
  String valueChoose;
  String getTextStudy() {
    if (dateTimeStudy == null) {
      return '-';
    } else {
      return DateFormat('dd/MM/yyyy').format(dateTimeStudy);
    }
     
  }
String getTextGraduated(){
  if (dateTimeGraduated == null) {
      return '-';
    } else {
      return DateFormat('dd/MM/yyyy').format(dateTimeGraduated);
    }
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
                    padding: EdgeInsets.only(left: 15),
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
                    padding: EdgeInsets.only(left: 15),
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
                    child: TextField(
                      keyboardType: TextInputType.text,
                      style: TextStyle(fontSize: 16),
                      decoration: InputDecoration(
                        labelText: "School Name",
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
                  SizedBox(height: size.height * 0.05),
                  Container(
                    width: size.width * 0.8,
                    child: TextField(
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
                            borderRadius: BorderRadius.circular(10)),
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
                  SizedBox(height: size.height * 0.02),
                  Container(
                    width: size.width * 0.8,
                    child: Row(
                      children: [
                        Container(
                          child: ButtonHeaderWidget(
                            marginIndex: 20.0,
                            width: size.width * 0.38,
                            height: 60,
                            title: 'Study From',
                            text: getTextStudy(),
                            onClicked: () => pickDateTimeStudy(context),
                          ),
                        ),
                        SizedBox(width: size.width * 0.04),
                        Container(
                          child: ButtonHeaderWidget(
                            marginIndex: 20.0,
                            width: size.width * 0.38,
                            height: 60,
                            title: 'Graduated',
                            text: getTextGraduated(),
                            onClicked: () => pickDateTimeGraduated(context),
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
                        Navigator.of(context).pop();
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

  Future pickDateTimeStudy(BuildContext context) async {
    final date = await pickDateStudy(context);
    if (date == null) return;

    setState(() {
      dateTimeStudy = DateTime(
        date.year,
        date.month,
        date.day,
      );
    });
  }

  Future<DateTime> pickDateStudy(BuildContext context) async {
    final initialDate = DateTime.now();
    final newDate = await showDatePicker(
      context: context,
      initialDate: dateTimeStudy ?? initialDate,
      firstDate: DateTime(DateTime.now().year - 16),
      lastDate: DateTime(DateTime.now().year + 16),
    );

    if (newDate == null) return null;

    return newDate;
  }
  Future pickDateTimeGraduated(BuildContext context) async {
    final date = await pickDateGraduated(context);
    if (date == null) return;

    setState(() {
      dateTimeGraduated = DateTime(
        date.year,
        date.month,
        date.day,
      );
    });
  }

  Future<DateTime> pickDateGraduated(BuildContext context) async {
    final initialDate = DateTime.now();
    final newDate = await showDatePicker(
      context: context,
      initialDate: dateTimeGraduated ?? initialDate,
      firstDate: DateTime(DateTime.now().year - 16),
      lastDate: DateTime(DateTime.now().year + 16),
    );

    if (newDate == null) return null;

    return newDate;
  }
}
