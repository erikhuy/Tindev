import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:tindev/components/rounded_button.dart';
import 'package:tindev/page/sign_up_for_employer_3.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';

class SignUpForEmployer2 extends StatefulWidget {
  @override
  _SignUpForEmployer2State createState() => _SignUpForEmployer2State();
}

class _SignUpForEmployer2State extends State<SignUpForEmployer2> {
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
  List listPlace = ["Ho Chi Minh", "Ha Noi", "Da Nang"];
  String valuePlace;

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
                  SizedBox(height: size.height * 0.01),
                  Container(
                    child: Row(
                      children: [
                        Container(
                          padding: EdgeInsets.only(right: width * 0.04),
                          height: 120,
                          child: Column(
                            children: [
                              Container(
                                padding: EdgeInsets.only(right: width * 0.08),
                                child: Align(
                                  alignment: Alignment.bottomLeft,
                                  child: Text(
                                    "Employer",
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
                              labelText: "Add Image",
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
                  SizedBox(height: size.height * 0.02),

                  
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
                    child: Row(
                      children: [
                        Container(
                          width: size.width * 0.38,
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
                              floatingLabelBehavior:
                                  FloatingLabelBehavior.always,
                            ),
                          ),
                        ),
                        SizedBox(width: size.width * 0.04),
                        Container(
                          width: size.width * 0.38,
                          child: TextField(
                            keyboardType: TextInputType.number,
                            style: TextStyle(fontSize: 16),
                            decoration: InputDecoration(
                              labelText: "Tax Code",
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
                    child: TextField(
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
                              color: Colors.blue[600], fontSize: 16.0),
                          floatingLabelBehavior: FloatingLabelBehavior.always),
                    ),
                  ),
                 
                  SizedBox(height: size.height * 0.01),
                  Container(
                    width: size.width * 0.8,
                    child: RoundedButton(
                      text: "Next",
                      press: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) {
                              return SignUpForEmployer3();
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
    );
  }
}
