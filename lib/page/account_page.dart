import 'package:flutter/material.dart';
import 'package:flutter_custom_clippers/flutter_custom_clippers.dart';
import 'package:tindev/data/account_json.dart';
import 'package:tindev/page/add_education.dart';
import 'package:tindev/theme/colors.dart';

import 'account_page_setting.dart';
import 'account_page_add_media.dart';
import 'account_page_edit_info.dart';

class AccountPage extends StatefulWidget {
  @override
  _AccountPageState createState() => _AccountPageState();
}

class _AccountPageState extends State<AccountPage> {
  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
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
                              "Front-End Developer",
                              style: TextStyle(
                                fontSize: 24,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                          Container(
                              padding: EdgeInsets.fromLTRB(
                                  width * 0.025, width * 0.06, 0.0, 0.0),
                              child: Row(
                                children: [
                                  Container(
                                    margin: EdgeInsets.only(right: 10),
                                    child: Icon(Icons.location_on_outlined),
                                  ),
                                  Column(
                                    children: [
                                      Container(
                                        padding: EdgeInsets.fromLTRB(
                                            0.0, 0.0, 136.0, 4.0),
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
                                        "Ho Chi Minh City, Viet Nam",
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
                                children: [
                                  Container(
                                    margin: EdgeInsets.only(right: 10),
                                    child: Icon(Icons.person_outline_rounded),
                                  ),
                                  Column(
                                    children: [
                                      Container(
                                        padding: EdgeInsets.fromLTRB(
                                            0.0, 0.0, 0.0, 4.0),
                                        child: Text(
                                          "Gender",
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
                                          "Male",
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
                            child: Text(
                                '''I am currently pursuing a bachelor degree in System Engineering at FPT University. At FPT University, I have learned and enhanced my security knowledge, which has been supporting me so much whenever I build my personal project. Beside my expertise in information assurance, I also major in software development and data analyst. Regarding my computer aptitude, I can quickly acquire new technologies to meet the company's demand. I believe that I can make use of technology to offer to the society and change the future. '''),
                          )
                        ],
                      )),
                  SizedBox(height: MediaQuery.of(context).size.height * 0.02),
                  Container(
                      color: white,
                      child: Column(
                        children: [
                          Container(
                            padding: EdgeInsets.fromLTRB(14.0, 8.0, 0.0, 0.0),
                            child: Row(
                              children: [
                                Container(
                                    padding: EdgeInsets.fromLTRB(
                                        0.0, 0.0, 244.0, 0.0),
                                    child: Text(
                                      "Education",
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
                                          return AddEducation();
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
                          ),
                          SizedBox(
                              height:
                                  MediaQuery.of(context).size.height * 0.02),
                          Column(
                            children: [
                              Container(
                                color: white,
                                padding:
                                    EdgeInsets.fromLTRB(10.0, 0.0, 0.0, 0.0),
                                child: Row(
                                  children: [
                                    Container(
                                        width: 64,
                                        height: 64,
                                        decoration: BoxDecoration(
                                            image: DecorationImage(
                                                image: AssetImage(
                                                    'assets/img_1.jpeg'),
                                                fit: BoxFit.cover))),
                                    Container(
                                      padding: EdgeInsets.fromLTRB(
                                          16.0, 10.0, 0.0, 0.0),
                                      height: 64,
                                      child: Column(
                                        children: [
                                          Container(
                                            child: Text(
                                              "FPT University",
                                              style: TextStyle(
                                                  fontSize: 16.0,
                                                  fontWeight: FontWeight.w500,
                                                  color: Colors.black87),
                                            ),
                                          ),
                                          Container(
                                            padding: EdgeInsets.fromLTRB(
                                                0.0, 8.0, 40.0, 0.0),
                                            child: Row(
                                              children: [
                                                Container(
                                                  width: 5,
                                                  height: 5,
                                                  decoration: BoxDecoration(
                                                      color: Colors.blue[600],
                                                      shape: BoxShape.circle),
                                                ),
                                                SizedBox(
                                                  width: 5,
                                                ),
                                                Container(
                                                    child: Align(
                                                  alignment:
                                                      Alignment.bottomLeft,
                                                  child: Text(
                                                    "2018 - 2022",
                                                    style: TextStyle(
                                                        fontSize: 10.0,
                                                        fontWeight:
                                                            FontWeight.normal,
                                                        color: Colors.black54),
                                                  ),
                                                )),
                                              ],
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ],
                      )),
                  SizedBox(height: MediaQuery.of(context).size.height * 0.02),
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
                        image: AssetImage(account_json[0]['img']),
                        fit: BoxFit.cover)),
              ),
              SizedBox(
                height: 15,
              ),
              Text(
                account_json[0]['name'] + ", " + account_json[0]['age'],
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
                          icon: Icon(Icons.settings),
                          iconSize: 35,
                          color: grey.withOpacity(0.5),
                          onPressed: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => AccountPageSetting(),
                                ));
                          },
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Text("SETTINGS",
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
                                  builder: (context) => AccountPageEditInfo(),
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
}
