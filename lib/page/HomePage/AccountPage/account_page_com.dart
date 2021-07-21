import 'package:flutter/material.dart';
import 'package:tindev/models/ComAcc.dart';
import 'package:tindev/models/JobList.dart';
import 'package:tindev/page/HomePage/AccountPage/add_job_recruitment.dart';
import 'package:tindev/page/HomePage/ExplorePage/Detail/job_detail.dart';
import 'package:tindev/page/SignInPage/sign_in.dart';
import 'package:tindev/services/CityServices.dart';
import 'package:tindev/services/CompanyServies.dart';
import 'package:tindev/services/JobTypeServices.dart';
import 'package:tindev/services/SkillServices.dart';
import 'package:tindev/theme/colors.dart';
import 'package:tindev/data/account_com_json.dart';
import 'package:tindev/page/HomePage/AccountPage/add_media.dart';
import 'package:tindev/page/HomePage/AccountPage/edit_info_com.dart';

class AccountPageCom extends StatefulWidget {
  final int index;
  final String token;
  final CompanyClass com;
  final List<JobRec> listJobRec;
  final List<String> listCity, listJobType, listSkill;

  const AccountPageCom({
    Key key,
    this.com,
    this.listJobRec,
    this.index,
    this.token,
    this.listCity,
    this.listJobType,
    this.listSkill,
  }) : super(key: key);

  @override
  _AccountPageComState createState() => _AccountPageComState();
}

class _AccountPageComState extends State<AccountPageCom> {
  CompanyClass com;
  static List<String> _listCities;
  static List<String> _listJobTypes;
  static List<String> _listSkills;

  List<String> listSkill;

  @override
  void initState() {
    super.initState();
    CompanyServices.getCompanyInfo(widget.token).then((company) {
      setState(() {
        com = company;
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
    if (widget.com != null) {
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
                        border: Border.all(color: Colors.blue[600]),
                        shape: BoxShape.circle,
                        image: DecorationImage(
                          image: AssetImage(
                            account_com_json[0]['img'] != null
                                ? account_com_json[0]['img']
                                : 'assets/defaultProfile.png',
                          ),
                          fit: BoxFit.contain,
                        ),
                      ),
                    ),
                    SizedBox(height: size.height * 0.02),
                    //NAME
                    Text(
                      widget.com == null ? "Company's Name" : widget.com.name,
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
                                icon:
                                    Icon(Icons.sensor_door_rounded), //SỬA ICON
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
                                color: white,
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
                                      builder: (context) => EditInfoCom(
                                        com: com,
                                        token: widget.token,
                                        listCity: _listCities,
                                        listJobType: _listJobTypes,
                                        listSkill: _listSkills,
                                        listJobReq: widget.listJobRec,
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
                    //FROM
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
                              widget.com == null
                                  ? "undefined"
                                  : widget.com.city,
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
                    //TOTAL_EMP
                    Row(
                      children: [
                        SizedBox(width: size.width * 0.05),
                        //iconTotal
                        Icon(
                          Icons.person_outline_rounded,
                          color: Colors.blue[600],
                        ),
                        SizedBox(width: size.width * 0.02),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            //txtTotal
                            Text(
                              "Total",
                              style: TextStyle(
                                color: Colors.blue[600],
                                fontSize: 14,
                                fontWeight: FontWeight.w300,
                              ),
                            ),
                            SizedBox(height: size.height * 0.002),
                            Text(
                              "10.001 employees",
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
                    //ABOUT
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
                      width: size.width * 0.9,
                      alignment: Alignment.center,
                      child: Text(
                        widget.com == null
                            ? "undefined"
                            : widget.com.description,
                        style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.normal,
                        ),
                      ),
                    ),
                    SizedBox(height: size.height * 0.02),
                    //txtJobRec
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        //txtJobRecruitment
                        Row(
                          children: [
                            SizedBox(width: size.width * 0.04),
                            Text(
                              "Job Recruitment",
                              style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                          ],
                        ),
                        //btnAddRecruitment
                        Row(
                          children: [
                            GestureDetector(
                              onTap: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) {
                                      return AddRecruitment(
                                        token: widget.token,
                                        listCity: _listCities,
                                        listJobType: _listJobTypes,
                                        listSkill: _listSkills,
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
                    //LIST_JOB_RECRUITMENT
                    Column(
                      children: widget.listJobRec != null
                          //return when have jobrecs
                          ? List.generate(widget.listJobRec.length,
                              (indexJobRec) {
                              return Container(
                                padding:
                                    EdgeInsets.only(bottom: size.height * 0.01),
                                child: GestureDetector(
                                  onTap: () {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) {
                                          return JobDetail(
                                            token: widget.token,
                                            com: widget.com,
                                            jobRec:
                                                widget.listJobRec[indexJobRec],
                                            listCity: _listCities,
                                            listJobType: _listJobTypes,
                                            listSkill: _listSkills,
                                            checkRole: false,
                                          );
                                        },
                                      ),
                                    );
                                  },
                                  child: Container(
                                    padding: EdgeInsets.symmetric(
                                      vertical: 4,
                                      horizontal: 10,
                                    ),
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(10),
                                      border: Border.all(
                                        color: Colors.blue[600],
                                        width: 2,
                                      ),
                                    ),
                                    width: size.width * 0.92,
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      children: [
                                        //JOB_Title
                                        Text(
                                          widget.listJobRec[indexJobRec].title,
                                          style: TextStyle(
                                            color: Colors.blue[600],
                                            fontSize: 24,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                        SizedBox(height: size.width * 0.01),
                                        //JOB_ExTime
                                        Row(
                                          children: widget
                                                      .listJobRec[indexJobRec]
                                                      .expiriedDate
                                                      .difference(
                                                          DateTime.now())
                                                      .inDays <
                                                  0
                                              ? [
                                                  //iconExpired
                                                  Icon(
                                                    Icons.timer_off,
                                                    color: Colors.red,
                                                    size: 20,
                                                  ),
                                                  SizedBox(
                                                      width: size.width * 0.02),
                                                  //txtExpired
                                                  Text(
                                                    "Expired !",
                                                    style: TextStyle(
                                                      color: Colors.red,
                                                      fontSize: 14,
                                                      fontWeight:
                                                          FontWeight.bold,
                                                    ),
                                                  ),
                                                ]
                                              : [
                                                  //iconTimeLapse
                                                  Icon(
                                                    Icons.timelapse_rounded,
                                                    color: Colors.blue[600],
                                                    size: 20,
                                                  ),
                                                  SizedBox(
                                                      width: size.width * 0.02),
                                                  //expired in...
                                                  Text(
                                                    "Expired in: " +
                                                        widget
                                                            .listJobRec[
                                                                indexJobRec]
                                                            .expiriedDate
                                                            .difference(
                                                                DateTime.now())
                                                            .inDays
                                                            .toString() +
                                                        " days",
                                                    style: TextStyle(
                                                      fontSize: 14,
                                                      fontWeight:
                                                          FontWeight.bold,
                                                    ),
                                                  ),
                                                ],
                                        ),
                                        SizedBox(height: size.width * 0.01),
                                        //JOB_TYPE-WORKPLACE
                                        Row(
                                          children: [
                                            //txtJobType
                                            Text(
                                              widget.listJobRec[indexJobRec]
                                                  .jobType,
                                              style: TextStyle(
                                                color: Colors.black,
                                                fontSize: 14,
                                                fontWeight: FontWeight.w500,
                                              ),
                                            ),
                                            SizedBox(width: size.width * 0.015),
                                            Container(
                                              color: black,
                                              height: size.height * 0.02,
                                              width: 2,
                                            ),
                                            SizedBox(width: size.width * 0.015),
                                            //txtWorkPlace
                                            Text(
                                              widget.listJobRec[indexJobRec]
                                                  .workPlace,
                                              style: TextStyle(
                                                color: Colors.black,
                                                fontSize: 14,
                                                fontWeight: FontWeight.w500,
                                              ),
                                            ),
                                          ],
                                        ),
                                        SizedBox(height: size.width * 0.01),
                                        //JOB_SALARY
                                        Container(
                                          decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(10),
                                            border: Border.all(
                                              color: Colors.blue[600],
                                              width: 2,
                                            ),
                                          ),
                                          child: Container(
                                            decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(10),
                                              border: Border.all(
                                                color: white,
                                                width: 2,
                                              ),
                                              color: Colors.blue[600],
                                            ),
                                            padding: EdgeInsets.symmetric(
                                              vertical: 6,
                                              horizontal: 6,
                                            ),
                                            child: Text(
                                              "\$" +
                                                  widget.listJobRec[indexJobRec]
                                                      .fromSalary
                                                      .toString() +
                                                  " - \$" +
                                                  widget.listJobRec[indexJobRec]
                                                      .toSalary
                                                      .toString(),
                                              style: TextStyle(
                                                color: white,
                                                fontSize: 14,
                                                fontWeight: FontWeight.bold,
                                              ),
                                            ),
                                          ),
                                        ),
                                        SizedBox(height: size.width * 0.02),
                                        //JOB_SKILL
                                        Row(
                                          children: List.generate(
                                              widget.listJobRec[indexJobRec]
                                                          .skills.length >
                                                      3
                                                  ? 3
                                                  : widget
                                                      .listJobRec[indexJobRec]
                                                      .skills
                                                      .length, (indexSkill) {
                                            if (indexSkill == 0) {
                                              return Padding(
                                                padding:
                                                    EdgeInsets.only(right: 6),
                                                child: Container(
                                                  decoration: BoxDecoration(
                                                    border: Border.all(
                                                      color: Colors.blue[600],
                                                      width: 2,
                                                    ),
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            30),
                                                    color: white,
                                                  ),
                                                  child: Padding(
                                                    padding:
                                                        EdgeInsets.symmetric(
                                                      horizontal: 6,
                                                      vertical: 6,
                                                    ),
                                                    child: Text(
                                                      widget
                                                          .listJobRec[
                                                              indexJobRec]
                                                          .skills[indexSkill],
                                                      style: TextStyle(
                                                        fontSize: 10,
                                                        color: Colors.black,
                                                        fontWeight:
                                                            FontWeight.w500,
                                                        letterSpacing: 1,
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                              );
                                            }
                                            return Padding(
                                              padding:
                                                  EdgeInsets.only(right: 6),
                                              child: Container(
                                                decoration: BoxDecoration(
                                                  color: white,
                                                  borderRadius:
                                                      BorderRadius.circular(30),
                                                  border: Border.all(
                                                    color: Colors.blue[600],
                                                    width: 2,
                                                  ),
                                                ),
                                                child: Padding(
                                                  padding: EdgeInsets.symmetric(
                                                    horizontal: 6,
                                                    vertical: 6,
                                                  ),
                                                  child: Text(
                                                    widget
                                                        .listJobRec[indexJobRec]
                                                        .skills[indexSkill],
                                                    style: TextStyle(
                                                      fontSize: 10,
                                                      color: Colors.black,
                                                      fontWeight:
                                                          FontWeight.w500,
                                                      letterSpacing: 1,
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            );
                                          }),
                                        ),
                                        SizedBox(height: size.width * 0.01),
                                      ],
                                    ),
                                  ),
                                ),
                              );
                            })
                          // return when no any JobRec
                          : Container(
                              padding:
                                  EdgeInsets.only(bottom: size.height * 0.01),
                              child: GestureDetector(
                                onTap: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) {
                                        return AddRecruitment(
                                          listCity: _listCities,
                                          listJobType: _listJobTypes,
                                          listSkill: _listSkills,
                                        );
                                      },
                                    ),
                                  );
                                },
                                child: Container(
                                  padding: EdgeInsets.symmetric(
                                    vertical: 4,
                                    horizontal: 10,
                                  ),
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10),
                                    border: Border.all(
                                      color: Colors.blue[600],
                                      width: 2,
                                    ),
                                  ),
                                  width: size.width * 0.92,
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      Text(
                                        "You dont have any recruitment, click here to add new!",
                                        style: TextStyle(
                                          color: Colors.blue[600],
                                          fontSize: 24,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                      SizedBox(height: size.width * 0.01),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                    ),
                    SizedBox(height: size.height * 0.01),
                  ],
                ),
              ),
            ],
          ),
        ),
      );
    } else {
      return Container();
    }
  }
}
