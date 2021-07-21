import 'package:flutter/material.dart';
import 'package:tindev/models/DevAcc.dart';
import 'package:tindev/models/Education.dart';
import 'package:tindev/page/HomePage/AccountPage/add_education.dart';
import 'package:tindev/page/SignInPage/sign_in.dart';
import 'package:tindev/services/DeveloperServices.dart';
import 'package:tindev/services/UniversityServices.dart';
import 'package:tindev/theme/colors.dart';
import 'package:tindev/data/account_dev_json.dart';
import 'package:tindev/page/HomePage/AccountPage/add_media.dart';
import 'package:tindev/page/HomePage/AccountPage/edit_info_dev.dart';
import 'package:tindev/services/CityServices.dart';
import 'package:tindev/services/JobTypeServices.dart';
import 'package:tindev/services/SkillServices.dart';

class AccountPageDev extends StatefulWidget {
  final String token;
  final DeveloperClass dev;
  final List<EducationElement> listEdu;

  const AccountPageDev({Key key, @required this.dev, this.token, this.listEdu})
      : super(key: key);

  @override
  _AccountPageDevState createState() => _AccountPageDevState();
}

class _AccountPageDevState extends State<AccountPageDev> {
  DeveloperClass dev;
  static List<String> _listCities;
  static List<String> _listJobTypes;
  static List<String> _listSkills;
  static List<String> _listUnis;

  @override
  void initState() {
    super.initState();
    DeveloperServices.getDeveloperInfo(widget.token).then((developer) {
      setState(() {
        dev = developer;
      });
    });
    CityServices.getCities().then((cities) {
      setState(() {
        // ignore: deprecated_member_use
        List<String> listCityName = new List();
        for (var i = 0; i < cities.length; i++) {
          listCityName.add(cities[i].name);
        }
        _listCities = listCityName;
      });
    });
    JobTypeServices.getJobType().then((jobType) {
      setState(() {
        // ignore: deprecated_member_use
        List<String> listJobTypeName = new List();
        for (var i = 0; i < jobType.length; i++) {
          listJobTypeName.add(jobType[i].name);
        }
        _listJobTypes = listJobTypeName;
      });
    });
    SkillServices.getSkills().then((skills) {
      setState(() {
        // ignore: deprecated_member_use
        List<String> listSkillName = new List();
        for (var i = 0; i < skills.length; i++) {
          listSkillName.add(skills[i].name);
        }
        _listSkills = listSkillName;
      });
    });
    UniversityServies.getListUniversity(widget.token).then((university) {
      setState(() {
        // ignore: deprecated_member_use
        List<String> listUniName = new List();
        for (var i = 0; i < university.length; i++) {
          listUniName.add(university[i].name);
        }
        _listUnis = listUniName;
      });
    });
  }

  Widget buildPopUp(BuildContext context) {
    return AlertDialog(
      title: Text("Exit ?"),
      content: Text("Are you sure you want to exit ?"),
      actions: [
        // ignore: deprecated_member_use
        FlatButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          child: Text("No"),
        ),
        // ignore: deprecated_member_use
        FlatButton(
          onPressed: () {
            Navigator.pushAndRemoveUntil(
              context,
              MaterialPageRoute(
                builder: (BuildContext context) => SignIn(),
              ),
              (route) => false,
            );
          },
          child: Text("Yes"),
        ),
      ],
    );
  }

  @override
  // ignore: missing_return
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      body: Container(
        color: white,
        child: Stack(
          alignment: Alignment.topLeft,
          children: <Widget>[
            SingleChildScrollView(
              child: Column(
                children: <Widget>[
                  //IMAGE
                  Container(
                    width: 216,
                    height: 216,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      image: DecorationImage(
                        image: AssetImage(
                          // 'assets/defaultProfile.png',
                          account_dev_json[0]['img'] != null
                              ? account_dev_json[0]['img']
                              : 'assets/defaultProfile.png',
                        ),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  SizedBox(height: size.height * 0.02),
                  //NAME
                  Text(
                    widget.dev == null ? "Full Name" : widget.dev.fullName,
                    style: TextStyle(
                      fontSize: 26,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: size.height * 0.01),
                  //BUTTONs
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      SizedBox(width: size.width * 0.01),
                      //ibtnExit
                      Column(
                        children: [
                          Container(
                            width: 60,
                            height: 60,
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              boxShadow: [
                                BoxShadow(
                                  color: grey.withOpacity(0.1),
                                  spreadRadius: 10,
                                  blurRadius: 15,
                                  // changes position of shadow
                                ),
                              ],
                              color: white,
                            ),
                            child: IconButton(
                              icon: Icon(Icons.sensor_door_rounded), //SỬA ICON
                              iconSize: 35,
                              color: grey.withOpacity(0.5),
                              onPressed: () {
                                showDialog(
                                  context: context,
                                  builder: (BuildContext context) {
                                    return buildPopUp(context);
                                  },
                                );
                              },
                            ),
                          ),
                          SizedBox(height: size.height * 0.01),
                          Text(
                            "EXIT", // SỬA TEXT
                            style: TextStyle(
                              fontSize: 12,
                              fontWeight: FontWeight.w600,
                              color: grey.withOpacity(0.8),
                            ),
                          ),
                        ],
                      ),
                      //ibtnAddMedia
                      Column(
                        children: [
                          SizedBox(height: size.height * 0.03),
                          Container(
                            width: 85,
                            height: 85,
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              gradient: LinearGradient(
                                colors: [
                                  Colors.blue[600],
                                  Colors.blue[200],
                                ],
                              ),
                              boxShadow: [
                                BoxShadow(
                                  color: grey.withOpacity(0.1),
                                  spreadRadius: 10,
                                  blurRadius: 15,
                                  // changes position of shadow
                                ),
                              ],
                            ),
                            child: IconButton(
                              icon: Icon(Icons.camera_alt),
                              iconSize: 45,
                              color: Colors.white,
                              onPressed: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => AddMedia(),
                                  ),
                                );
                              },
                            ),
                          ),
                          SizedBox(height: size.height * 0.01),
                          Text(
                            "ADD MEDIA",
                            style: TextStyle(
                              fontSize: 12,
                              fontWeight: FontWeight.w600,
                              color: grey.withOpacity(0.8),
                            ),
                          )
                        ],
                      ),
                      //ibtnEditInfo
                      Column(
                        children: [
                          Container(
                            width: 60,
                            height: 60,
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: white,
                              boxShadow: [
                                BoxShadow(
                                  color: grey.withOpacity(0.1),
                                  spreadRadius: 10,
                                  blurRadius: 15,
                                  // changes position of shadow
                                ),
                              ],
                            ),
                            child: IconButton(
                              icon: Icon(Icons.edit),
                              iconSize: 35,
                              color: grey.withOpacity(0.5),
                              onPressed: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => EditInfoDev(
                                      dev: dev,
                                      token: widget.token,
                                      listCity: _listCities,
                                      listJobType: _listJobTypes,
                                      listSkill: _listSkills,
                                    ),
                                  ),
                                );
                              },
                            ),
                          ),
                          SizedBox(height: size.height * 0.01),
                          Text(
                            "EDIT INFO",
                            style: TextStyle(
                              fontSize: 12,
                              fontWeight: FontWeight.w600,
                              color: grey.withOpacity(0.8),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(width: size.width * 0.01),
                    ],
                  ),
                  SizedBox(height: size.height * 0.01),
                  //JOB TYPE
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        widget.dev == null
                            ? "Job Type"
                            : widget.dev.jobExpectation == null
                                ? "Job Type"
                                : widget.dev.jobExpectation.jobType,
                        style: TextStyle(
                          fontSize: 22,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: size.height * 0.01),
                  //LOCATION
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      SizedBox(width: size.width * 0.05),
                      //iconLocation
                      Icon(
                        Icons.location_on_outlined,
                        color: Colors.blue[600],
                      ),
                      SizedBox(width: size.width * 0.02),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          //txtFrom
                          Text(
                            "From",
                            style: TextStyle(
                              color: Colors.blue[600],
                              fontSize: 14,
                              fontWeight: FontWeight.w300,
                            ),
                          ),
                          SizedBox(height: size.height * 0.002),
                          //txtCity
                          Text(
                            widget.dev == null ? "undefined" : widget.dev.city,
                            style: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      )
                    ],
                  ),
                  SizedBox(height: size.height * 0.02),
                  //GENDER
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      SizedBox(width: size.width * 0.05),
                      //iconGender
                      Icon(
                        Icons.person_outline_rounded,
                        color: Colors.blue[600],
                      ),
                      SizedBox(width: size.width * 0.02),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          //txtGender
                          Text(
                            "Gender",
                            style: TextStyle(
                              color: Colors.blue[600],
                              fontSize: 14,
                              fontWeight: FontWeight.w300,
                            ),
                          ),
                          SizedBox(height: size.height * 0.002),
                          //txtGender
                          Text(
                            widget.dev == null
                                ? "undefined"
                                : widget.dev.gender,
                            style: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      )
                    ],
                  ),
                  SizedBox(height: size.height * 0.02),
                  //txtABOUT
                  Row(
                    children: [
                      SizedBox(width: size.width * 0.04),
                      Text(
                        "About",
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: size.height * 0.01),
                  //txtDescription
                  Container(
                    width: size.width * 0.86,
                    alignment: Alignment.center,
                    child: Text(
                      widget.dev == null ? "Undefined" : widget.dev.description,
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.normal,
                      ),
                    ),
                  ),
                  SizedBox(height: size.height * 0.02),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          SizedBox(width: size.width * 0.04),
                          Text(
                            "Education",
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          GestureDetector(
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) {
                                    return AddEducation(
                                      token: widget.token,
                                      listUni: _listUnis,
                                    );
                                  },
                                ),
                              );
                            },
                            child: Icon(
                              Icons.add,
                              color: Colors.blue[600],
                            ),
                          ),
                          SizedBox(width: size.width * 0.04),
                        ],
                      ),
                    ],
                  ),
                  SizedBox(height: size.height * 0.01),
                  Row(
                    children: [
                      SizedBox(width: size.width * 0.04),
                      Container(
                        width: 64,
                        height: 64,
                        decoration: BoxDecoration(
                          image: DecorationImage(
                            image: AssetImage('assets/img_1.jpeg'),
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                      SizedBox(width: size.width * 0.04),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "FPT University",
                            style: TextStyle(
                              fontSize: 18.0,
                              fontWeight: FontWeight.w500,
                              color: Colors.black87,
                            ),
                          ),
                          SizedBox(height: size.height * 0.002),
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Container(
                                width: 5,
                                height: 5,
                                decoration: BoxDecoration(
                                  color: Colors.blue,
                                  shape: BoxShape.circle,
                                ),
                              ),
                              SizedBox(width: size.width * 0.01),
                              Text(
                                "2018 - 2022",
                                style: TextStyle(
                                  fontSize: 10.0,
                                  fontWeight: FontWeight.normal,
                                  color: Colors.black54,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ],
                  ),
                  // Row(
                  //   // ignore: missing_return
                  //   children: List.generate(widget.listEdu != null ? widget.listEdu.length : 1, (index) {
                  //     // ignore: unnecessary_statements
                  //     [
                  //       SizedBox(width: size.width * 0.04),
                  //       Container(
                  //         width: 64,
                  //         height: 64,
                  //         decoration: BoxDecoration(
                  //           image: DecorationImage(
                  //             image: AssetImage('assets/img_1.jpeg'),
                  //             fit: BoxFit.cover,
                  //           ),
                  //         ),
                  //       ),
                  //       SizedBox(width: size.width * 0.04),
                  //       Column(
                  //         crossAxisAlignment: CrossAxisAlignment.start,
                  //         children: [
                  //           Text(
                  //             widget.listEdu != null ? widget.listEdu[index].schoolName : "Null",
                  //             style: TextStyle(
                  //               fontSize: 18.0,
                  //               fontWeight: FontWeight.w500,
                  //               color: Colors.black87,
                  //             ),
                  //           ),
                  //           SizedBox(height: size.height * 0.002),
                  //           Row(
                  //             crossAxisAlignment: CrossAxisAlignment.center,
                  //             children: [
                  //               Container(
                  //                 width: 5,
                  //                 height: 5,
                  //                 decoration: BoxDecoration(
                  //                   color: Colors.blue,
                  //                   shape: BoxShape.circle,
                  //                 ),
                  //               ),
                  //               SizedBox(width: size.width * 0.01),
                  //               Text(
                  //                 widget.listEdu != null ?
                  //                 widget.listEdu[index].fromYear.toString() +
                  //                     " - " +
                  //                     widget.listEdu[index].toYear.toString() : "null",
                  //                 style: TextStyle(
                  //                   fontSize: 10.0,
                  //                   fontWeight: FontWeight.normal,
                  //                   color: Colors.black54,
                  //                 ),
                  //               ),
                  //             ],
                  //           ),
                  //         ],
                  //       ),
                  //     ];
                  //   }),
                  // ),
                  SizedBox(height: size.height * 0.02),
                  Row(
                    children: [
                      SizedBox(width: size.width * 0.04),
                      Text(
                        "License",
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: size.height * 0.01),
                  Row(
                    children: [
                      SizedBox(width: size.width * 0.04),
                      Container(
                        width: 64,
                        height: 64,
                        decoration: BoxDecoration(
                          image: DecorationImage(
                            image: AssetImage('assets/img_1.jpeg'),
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                      SizedBox(width: size.width * 0.04),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "FPT University",
                            style: TextStyle(
                              fontSize: 18.0,
                              fontWeight: FontWeight.w500,
                              color: Colors.black87,
                            ),
                          ),
                          SizedBox(height: size.height * 0.002),
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Container(
                                width: 5,
                                height: 5,
                                decoration: BoxDecoration(
                                  color: Colors.blue,
                                  shape: BoxShape.circle,
                                ),
                              ),
                              SizedBox(width: size.width * 0.01),
                              Text(
                                "2018 - 2022",
                                style: TextStyle(
                                  fontSize: 10.0,
                                  fontWeight: FontWeight.normal,
                                  color: Colors.black54,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
    // ignore: unused_catch_stack
  }
}
