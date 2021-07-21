import 'package:flutter/material.dart';
import 'package:flutter_custom_clippers/flutter_custom_clippers.dart';
import 'package:tindev/data/account_ company_json.dart';
import 'package:tindev/page/account_company_page_edit_info.dart';
import 'package:tindev/page/job_title_detail.dart';
import 'package:tindev/page/login.dart';
import 'package:tindev/theme/colors.dart';

import 'account_page_setting.dart';
import 'account_page_add_media.dart';
import 'add_job_recruitment.dart';

class AccountPageCompany extends StatefulWidget {
  @override
  _AccountPageCompanyState createState() => _AccountPageCompanyState();
}

class _AccountPageCompanyState extends State<AccountPageCompany> {
  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;

    return Scaffold(
      body: Container(
        color: white,
        child: Stack(
          alignment: Alignment.topLeft,
          children: <Widget>[
            SingleChildScrollView(
              child: Column(
                children: <Widget>[
                  getBody(),
                  Container(
                      height: MediaQuery.of(context).size.height * 0.2,
                      child: Column(
                        children: [
                          Container(
                            // padding: EdgeInsets.fromLTRB(0.0, 0.0, 0.0, 0.0),
                            child: Text(
                              account_conpany_json[0]['topic'],
                              style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                          Container(
                              padding: EdgeInsets.fromLTRB(
                                  width * 0.025, width * 0.06, 0.0, 0.0),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Container(
                                    margin: EdgeInsets.only(right: 10),
                                    child: Icon(Icons.location_on_outlined),
                                  ),
                                  Column(
                                    children: [
                                      Container(
                                        padding: EdgeInsets.fromLTRB(
                                            0.0, 0.0, 72.0, 4.0),
                                        child: Text(
                                          "From",
                                          style: TextStyle(
                                            color: Colors.blue[600],
                                            fontSize: 14,
                                            fontWeight: FontWeight.w300,
                                          ),
                                        ),
                                      ),
                                      Text(
                                        account_conpany_json[0]['location'],
                                        style: TextStyle(
                                          fontSize: 14,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    ],
                                  )
                                ],
                              )),
                          Container(
                              padding:
                                  EdgeInsets.fromLTRB(10.0, 16.0, 0.0, 0.0),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Container(
                                    margin: EdgeInsets.only(right: 10),
                                    child: Icon(Icons.person_outline_rounded),
                                  ),
                                  Column(
                                    children: [
                                      Container(
                                        padding: EdgeInsets.fromLTRB(
                                            0.0, 0.0, 32.0, 4.0),
                                        child: Text(
                                          "Total Employees",
                                          style: TextStyle(
                                            color: Colors.blue[600],
                                            fontSize: 14,
                                            fontWeight: FontWeight.w300,
                                          ),
                                        ),
                                      ),
                                      Container(
                                        padding: EdgeInsets.fromLTRB(
                                            0.0, 0.0, 8.0, 0.0),
                                        child: Text(
                                          account_conpany_json[0]['numEmp'],
                                          style: TextStyle(
                                            fontSize: 14,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                      ),
                                    ],
                                  )
                                ],
                              )),
                        ],
                      )),
                  SizedBox(height: MediaQuery.of(context).size.height * 0.02),
                  Container(
                      color: white,
                      child: Column(
                        children: [
                          Row(
                            children: [
                              Container(
                                padding:
                                    EdgeInsets.fromLTRB(14.0, 8.0, 0.0, 0.0),
                                child: Row(
                                  children: [
                                    Container(
                                        padding: EdgeInsets.fromLTRB(
                                            0.0, 0.0, 280.0, 0.0),
                                        child: Text(
                                          "About",
                                          style: TextStyle(
                                              fontSize: 20,
                                              fontWeight: FontWeight.w700),
                                        )),
                                    Icon(
                                      Icons.edit_rounded,
                                      color: Colors.blue[600],
                                    ),
                                  ],
                                ),
                              )
                            ],
                          ),
                          SizedBox(
                              height:
                                  MediaQuery.of(context).size.height * 0.03),
                          Container(
                            padding: EdgeInsets.fromLTRB(14.0, 0.0, 20.0, 0.0),
                            child: Text(account_conpany_json[0]['des_com']),
                          )
                        ],
                      )),
                  SizedBox(height: MediaQuery.of(context).size.height * 0.04),
                  Container(
                      color: white,
                      child: Column(
                        children: [
                          Row(
                            children: [
                              Container(
                                padding:
                                    EdgeInsets.fromLTRB(14.0, 8.0, 0.0, 0.0),
                                child: Row(
                                  children: [
                                    Container(
                                        padding: EdgeInsets.fromLTRB(
                                            0.0, 0.0, 184.0, 0.0),
                                        child: Text(
                                          "Job Recruitment",
                                          style: TextStyle(
                                              fontSize: 20,
                                              fontWeight: FontWeight.w700),
                                        )),
                                    GestureDetector(
                                      onTap: () {
                                        Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                            builder: (context) {
                                              return AddRecruitment(
                                                pageType: "Add",
                                              );
                                            },
                                          ),
                                        );
                                      },
                                      child: Icon(
                                        Icons.add,
                                        color: Colors.blue[600],
                                      ),
                                    )
                                  ],
                                ),
                              )
                            ],
                          ),
                          Container(
                            child: Column(
                                children: List.generate(
                                    account_conpany_json[0][
                                            'job_recruitments'] // map ra các job recruit có trong data nè
                                        .length, (jr_index) {
                              return GestureDetector(
                                  // map ra một cục chình ìn như thế này nhá
                                  onTap: () {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) {
                                          return JobTitleDetail(
                                            checkRole: false,
                                          ); //bóc id bên api để truyền quá nhá,bài Huy còn đnag làm data cứng hông giống bên chú Triết
                                        }, // chừng nào đọc được cái dòng này hú em, hú xong nhớ xóa
                                      ),
                                    );
                                  },
                                  child: Container(
                                      margin:
                                          EdgeInsets.only(top: width * 0.06),
                                      padding: EdgeInsets.symmetric(
                                          vertical: 4, horizontal: 10),
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(10),
                                        border: Border.all(
                                          color: Colors.blue[600],
                                          width: 2,
                                        ),
                                      ),
                                      height: width * 0.40,
                                      width: width * 0.92,
                                      child: Container(
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
                                          children: [
                                            Container(
                                              //title nè ba
                                              margin: EdgeInsets.only(
                                                  bottom: width * 0.01),
                                              child: Text(
                                                account_conpany_json[0]
                                                        ['job_recruitments']
                                                    [jr_index]['name'],
                                                style: TextStyle(
                                                  color: Colors.blue[600],
                                                  fontSize: 24,
                                                  fontWeight: FontWeight.bold,
                                                ),
                                              ),
                                            ),
                                            Row(
                                              //expired time nè
                                              children: (account_conpany_json[0]
                                                                  [
                                                                  'job_recruitments']
                                                              [jr_index]['time']
                                                          .toString() ==
                                                      "Expired !")
                                                  ? [
                                                      Container(
                                                        child: Icon(
                                                          Icons.timer_off,
                                                          color: Colors.red,
                                                          size: 20,
                                                        ),
                                                      ),
                                                      SizedBox(
                                                          width: width * 0.02),
                                                      Text(
                                                        account_conpany_json[0][
                                                                'job_recruitments']
                                                            [jr_index]['time'],
                                                        style: TextStyle(
                                                            color: Colors.red,
                                                            fontSize: 14,
                                                            fontWeight:
                                                                FontWeight
                                                                    .bold),
                                                      ),
                                                    ]
                                                  : [
                                                      Container(
                                                        child: Icon(
                                                          Icons
                                                              .timelapse_rounded,
                                                          color:
                                                              Colors.blue[600],
                                                          size: 20,
                                                        ),
                                                      ),
                                                      SizedBox(
                                                          width: width * 0.02),
                                                      Text(
                                                        account_conpany_json[0][
                                                                'job_recruitments']
                                                            [jr_index]['time'],
                                                        style: TextStyle(
                                                          fontSize: 14,
                                                          fontWeight:
                                                              FontWeight.bold,
                                                        ),
                                                      ),
                                                    ],
                                            ),
                                            SizedBox(height: width * 0.01),
                                            Row(
                                              //hob type và city
                                              children: [
                                                Text(
                                                  account_conpany_json[0]
                                                          ['job_recruitments']
                                                      [jr_index]['jobTitle'],
                                                  style: TextStyle(
                                                    color: Colors.black,
                                                    fontSize: 14,
                                                    fontWeight: FontWeight.w500,
                                                  ),
                                                ),
                                                SizedBox(width: width * 0.03),
                                                Container(
                                                  color: black,
                                                  height: height * 0.02,
                                                  width: 1,
                                                ),
                                                SizedBox(width: width * 0.03),
                                                Text(
                                                  account_conpany_json[0]
                                                          ['job_recruitments']
                                                      [jr_index]['workPlace'],
                                                  style: TextStyle(
                                                    color: Colors.black,
                                                    fontSize: 14,
                                                    fontWeight: FontWeight.w500,
                                                  ),
                                                ),
                                              ],
                                            ),
                                            Container(
                                              //salary nè
                                              margin: EdgeInsets.only(
                                                  top: width * 0.01),
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
                                                  account_conpany_json[0]
                                                          ['job_recruitments']
                                                      [jr_index]['salary'],
                                                  style: TextStyle(
                                                    color: white,
                                                    fontSize: 14,
                                                    fontWeight: FontWeight.bold,
                                                  ),
                                                ),
                                              ),
                                            ),
                                            SizedBox(height: width * 0.02),
                                            Row(
                                              //skill
                                              children: List.generate(
                                                  account_conpany_json[0][
                                                              'job_recruitments']
                                                          [jr_index]['skills']
                                                      .length, (skill_id) {
                                                //map ra các skill có trong
                                                if (skill_id == 0) {
                                                  // recruitment đó và chạy theo index là skill_id nhá
                                                  return Padding(
                                                    padding:
                                                        const EdgeInsets.only(
                                                            right: 8),
                                                    child: Container(
                                                      decoration: BoxDecoration(
                                                        color: white,
                                                        border: Border.all(
                                                          color:
                                                              Colors.blue[600],
                                                          width: 2,
                                                        ),
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(30),
                                                      ),
                                                      child: Padding(
                                                        padding:
                                                            const EdgeInsets
                                                                .symmetric(
                                                          horizontal: 4,
                                                          vertical: 4,
                                                        ),
                                                        child: Text(
                                                          account_conpany_json[
                                                                          0][
                                                                      'job_recruitments']
                                                                  [jr_index][
                                                              'skills'][skill_id],
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
                                                      const EdgeInsets.only(
                                                          right: 8),
                                                  child: Container(
                                                    decoration: BoxDecoration(
                                                      color: white,
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              30),
                                                      border: Border.all(
                                                        color: Colors.blue[600],
                                                        width: 2,
                                                      ),
                                                    ),
                                                    child: Padding(
                                                      padding: const EdgeInsets
                                                          .symmetric(
                                                        horizontal: 4,
                                                        vertical: 4,
                                                      ),
                                                      child: Text(
                                                        account_conpany_json[0][
                                                                    'job_recruitments']
                                                                [jr_index][
                                                            'skills'][skill_id],
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
                                          ],
                                        ),
                                      )));
                            })),
                          )
                        ],
                      )),
                  SizedBox(height: MediaQuery.of(context).size.height * 0.04),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget getBody() {
    var width = MediaQuery.of(context).size.width;
    var size = MediaQuery.of(context).size;

    return ClipPath(
      clipper: OvalBottomBorderClipper(),
      child: Container(
        width: size.width,
        height: size.height * 0.60,
        decoration: BoxDecoration(
          color: white,
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.5),
              spreadRadius: 5,
              blurRadius: 7,
              offset: Offset(0, 3), // changes position of shadow
            ),
          ],
        ),
        child: Padding(
          padding: const EdgeInsets.only(left: 30, right: 30, bottom: 40),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Container(
                width: 216,
                height: 216,
                decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    image: DecorationImage(
                        image: AssetImage(account_conpany_json[0]['img']),
                        fit: BoxFit.cover)),
              ),
              SizedBox(
                height: 15,
              ),
              Text(
                account_conpany_json[0]['company'],
                style: TextStyle(fontSize: 26, fontWeight: FontWeight.bold),
              ),
              SizedBox(
                height: 15,
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
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
                            ]),
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
                      SizedBox(
                        height: 10,
                      ),
                      Text("EXIT", // SỬA TEXT
                          style: TextStyle(
                              fontSize: 12,
                              fontWeight: FontWeight.w600,
                              color: grey.withOpacity(0.8)))
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 20),
                    child: Column(
                      children: [
                        Container(
                          width: 85,
                          height: 85,
                          child: Stack(
                            children: [
                              Container(
                                width: 80,
                                height: 80,
                                decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    gradient: LinearGradient(
                                      colors: [
                                        Colors.blue[600],
                                        Colors.blue[200]
                                      ],
                                    ),
                                    boxShadow: [
                                      BoxShadow(
                                        color: grey.withOpacity(0.1),
                                        spreadRadius: 10,
                                        blurRadius: 15,
                                        // changes position of shadow
                                      ),
                                    ]),
                                child: IconButton(
                                  icon: Icon(Icons.camera_alt),
                                  iconSize: 45,
                                  color: white,
                                  onPressed: () {
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                          builder: (context) =>
                                              AccountPageAddMedia(),
                                        ));
                                  },
                                ),
                              ),
                              Positioned(
                                bottom: width * 0.022,
                                right: 0,
                                child: Container(
                                  width: 25,
                                  height: 25,
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
                                      ]),
                                  child: Center(
                                    child: Icon(Icons.add,
                                        color: Colors.blue[600]),
                                  ),
                                ),
                              )
                            ],
                          ),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Text(
                          "ADD MEDIA",
                          style: TextStyle(
                              fontSize: 12,
                              fontWeight: FontWeight.w600,
                              color: grey.withOpacity(0.8)),
                        )
                      ],
                    ),
                  ),
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
                            ]),
                        child: IconButton(
                          icon: Icon(Icons.edit),
                          iconSize: 35,
                          color: grey.withOpacity(0.5),
                          onPressed: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) =>
                                      AccountCompanyPageEditInfo(),
                                ));
                          },
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Text(
                        "EDIT INFO",
                        style: TextStyle(
                            fontSize: 12,
                            fontWeight: FontWeight.w600,
                            color: grey.withOpacity(0.8)),
                      )
                    ],
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget buildPopUp(BuildContext context) {
    return AlertDialog(
      title: Text("Exit ?"),
      content: Text("Are you sure you want to exit ?"),
      actions: [
        FlatButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            child: Text("No")),
        FlatButton(
            onPressed: () {
              Navigator.pushAndRemoveUntil(
                context,
                MaterialPageRoute(
                  builder: (BuildContext context) => Login(),
                ),
                (route) => false,
              );
            },
            child: Text("Yes")),
      ],
    );
  }
}
