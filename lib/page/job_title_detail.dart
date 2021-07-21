import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:tindev/page/account_page_company.dart';
import 'package:tindev/page/add_job_recruitment.dart';
import 'package:tindev/theme/colors.dart';

class JobTitleDetail extends StatefulWidget {
  final bool checkRole;

  const JobTitleDetail({Key key, this.checkRole}) : super(key: key);
  @override
  JobTitleDetailState createState() => JobTitleDetailState();
}

class JobTitleDetailState extends State<JobTitleDetail> {
  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          automaticallyImplyLeading: false,
          elevation: 0,
          leading: Navigator.canPop(context)
              ? IconButton(
                  padding: EdgeInsets.fromLTRB(8, 16.0, 0.0, 0.0),
                  icon: Icon(
                    Icons.arrow_back_ios_new_rounded,
                    color: Colors.blue[600],
                    size: 32,
                  ),
                  onPressed: () => Navigator.of(context).pop(),
                )
              : null,
          actions: <Widget>[
            if (widget.checkRole != null && widget.checkRole == false)
              PopupOptionMenu(),
            // IconButton(
            //   padding: EdgeInsets.fromLTRB(0, 16.0, 24.0, 0.0),
            //   icon: Icon(
            //     Icons.more_vert_rounded,
            //     color: Colors.blue[600],
            //     size: 30,
            //   ),
            //   onPressed: () => {
            //     PopupOptionMenu(),
            //   },
            // )
          ],
        ),
        body: Container(
          width: double.infinity,
          height: MediaQuery.of(context).size.height,
          child: Stack(
            alignment: Alignment.topLeft,
            children: <Widget>[
              SingleChildScrollView(
                child: Column(
                  children: <Widget>[
                    SizedBox(height: MediaQuery.of(context).size.height * 0.04),
                    Container(
                        padding: EdgeInsets.fromLTRB(15.0, 0.0, 0.0, 0.0),
                        child: Align(
                          alignment: Alignment.bottomLeft,
                          child: Text(
                            "Design website in HTML",
                            style: TextStyle(
                                fontSize: 28.0,
                                fontWeight: FontWeight.w900,
                                color: Colors.black87),
                          ),
                        )),
                    SizedBox(height: MediaQuery.of(context).size.height * 0.02),
                    Container(
                      color: white,
                      padding: EdgeInsets.fromLTRB(15.0, 0.0, 0.0, 0.0),
                      child: Row(
                        children: [
                          Container(
                              width: 120,
                              height: 120,
                              decoration: BoxDecoration(
                                  image: DecorationImage(
                                      image: AssetImage('assets/img_1.jpeg'),
                                      fit: BoxFit.cover))),
                          Container(
                            //  padding: EdgeInsets.fromLTRB(0.0, 10.0, 0.0, 0.0),
                            height: 120,
                            child: Column(
                              children: [
                                Container(
                                  child: Text(
                                    "FPT Software Vietnam ",
                                    style: TextStyle(
                                        fontSize: 18.0,
                                        fontWeight: FontWeight.w500,
                                        color: Colors.black87),
                                  ),
                                ),
                                Container(
                                  margin: EdgeInsets.only(
                                      right: width * 0.32, top: width * 0.01),
                                  decoration: BoxDecoration(
                                    border: Border.all(
                                      color: Colors.blue[600],
                                      width: 1,
                                    ),
                                    borderRadius: BorderRadius.circular(6),
                                    color: white,
                                  ),
                                  child: Padding(
                                    padding: const EdgeInsets.only(
                                      top: 2,
                                      bottom: 0,
                                      left: 6,
                                      right: 6,
                                    ),
                                    child: Text(
                                      "* * * * *",
                                      style: TextStyle(
                                          color: Colors.amber,
                                          fontWeight: FontWeight.w900,
                                          fontSize: 14),
                                    ),
                                  ),
                                ),
                                Container(
                                  padding: EdgeInsets.fromLTRB(
                                      0.0, 8.0, width * 0.22, 0.0),
                                  child: Row(
                                    children: [
                                      Container(
                                        width: 5,
                                        height: 5,
                                        decoration: BoxDecoration(
                                            color: green,
                                            shape: BoxShape.circle),
                                      ),
                                      SizedBox(
                                        width: 5,
                                      ),
                                      Container(
                                          child: Align(
                                        alignment: Alignment.bottomLeft,
                                        child: Text(
                                          "7 days remain",
                                          style: TextStyle(
                                              fontSize: 14.0,
                                              fontWeight: FontWeight.normal,
                                              color: Colors.black54),
                                        ),
                                      )),
                                    ],
                                  ),
                                ),
                                Container(
                                  margin: EdgeInsets.only(top: 9.0, right: 78),
                                  child: Row(
                                    //CITY
                                    children: [
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
                                            horizontal: 8,
                                          ),
                                          child: Text(
                                            "\$300 - \$500",
                                            style: TextStyle(
                                              color: white,
                                              fontSize: 16,
                                              fontWeight: FontWeight.bold,
                                            ),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                )
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: MediaQuery.of(context).size.height * 0.02),
                    Container(
                        color: white,
                        child: Column(
                          children: [
                            Container(
                                padding:
                                    EdgeInsets.fromLTRB(0.0, 12.0, 240.0, 0.0),
                                child: Text(
                                  "Requirements",
                                  style: TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.w700),
                                )),
                            SizedBox(
                                height:
                                    MediaQuery.of(context).size.height * 0.03),
                            Container(
                              padding:
                                  EdgeInsets.fromLTRB(12.0, 0.0, 20.0, 0.0),
                              child: Column(
                                children: [
                                  Container(
                                      child: Row(
                                    children: [
                                      Container(
                                        margin: EdgeInsets.only(right: 10),
                                        child: Icon(
                                            Icons.assignment_turned_in_outlined,
                                            color: Colors.blue[600]),
                                      ),
                                      Column(
                                        children: [
                                          Container(
                                            padding: EdgeInsets.fromLTRB(
                                                0.0, 0.0, 72.0, 2.0),
                                            child: Text(
                                              "Title",
                                              style: TextStyle(
                                                fontSize: 14,
                                                fontWeight: FontWeight.w300,
                                              ),
                                            ),
                                          ),
                                          Text(
                                            "Web Developer",
                                            style: TextStyle(
                                              fontSize: 14,
                                              fontWeight: FontWeight.w500,
                                            ),
                                          ),
                                        ],
                                      )
                                    ],
                                  )),
                                  Container(
                                      padding: EdgeInsets.fromLTRB(
                                          0.0, 12.0, 0.0, 0.0),
                                      child: Row(
                                        children: [
                                          Container(
                                            margin: EdgeInsets.only(right: 10),
                                            child: Icon(
                                              Icons.timelapse_rounded,
                                              color: Colors.blue[600],
                                            ),
                                          ),
                                          Column(
                                            children: [
                                              Container(
                                                padding: EdgeInsets.fromLTRB(
                                                    0.0, 0.0, 0.0, 2.0),
                                                child: Text(
                                                  "Deadline",
                                                  style: TextStyle(
                                                    fontSize: 14,
                                                    fontWeight: FontWeight.w300,
                                                  ),
                                                ),
                                              ),
                                              Container(
                                                padding: EdgeInsets.fromLTRB(
                                                    0.0, 0.0, 8.0, 0.0),
                                                child: Text(
                                                  "7 days",
                                                  style: TextStyle(
                                                    fontSize: 14,
                                                    fontWeight: FontWeight.w500,
                                                  ),
                                                ),
                                              ),
                                            ],
                                          )
                                        ],
                                      )),
                                  Container(
                                      padding: EdgeInsets.fromLTRB(
                                          0.0, 12.0, 0.0, 0.0),
                                      child: Row(
                                        children: [
                                          Container(
                                            margin: EdgeInsets.only(right: 10),
                                            child: Icon(
                                                Icons.location_on_outlined,
                                                color: Colors.blue[600]),
                                          ),
                                          Column(
                                            children: [
                                              Container(
                                                padding: EdgeInsets.fromLTRB(
                                                    0.0, 0.0, 52.0, 2.0),
                                                child: Text(
                                                  "Location",
                                                  style: TextStyle(
                                                    fontSize: 14,
                                                    fontWeight: FontWeight.w300,
                                                  ),
                                                ),
                                              ),
                                              Text(
                                                " HCMC, Viet Nam",
                                                style: TextStyle(
                                                  fontSize: 14,
                                                  fontWeight: FontWeight.w500,
                                                ),
                                              ),
                                            ],
                                          )
                                        ],
                                      )),
                                  Container(
                                      padding: EdgeInsets.fromLTRB(
                                          0.0, 12.0, 0.0, 0.0),
                                      child: Row(
                                        children: [
                                          Container(
                                            margin: EdgeInsets.only(right: 10),
                                            child: Icon(
                                                Icons.star_outline_rounded,
                                                color: Colors.blue[600]),
                                          ),
                                          Column(
                                            children: [
                                              Container(
                                                padding: EdgeInsets.fromLTRB(
                                                    0.0, 0.0, 34.0, 2.0),
                                                child: Text(
                                                  "Experience",
                                                  style: TextStyle(
                                                    fontSize: 14,
                                                    fontWeight: FontWeight.w300,
                                                  ),
                                                ),
                                              ),
                                              Text(
                                                " Junior / 1 Years",
                                                style: TextStyle(
                                                  fontSize: 14,
                                                  fontWeight: FontWeight.w500,
                                                ),
                                              ),
                                            ],
                                          )
                                        ],
                                      )),
                                  Container(
                                      padding: EdgeInsets.fromLTRB(
                                          0.0, 12.0, 0.0, 0.0),
                                      child: Row(
                                        children: [
                                          Container(
                                              margin: EdgeInsets.only(
                                                  left: 4, right: 10),
                                              child: Text(
                                                "ST",
                                                style: TextStyle(
                                                  color: Colors.blue[600],
                                                  fontSize: 16,
                                                  fontWeight: FontWeight.w900,
                                                ),
                                              )),
                                          Column(
                                            children: [
                                              Container(
                                                padding: EdgeInsets.fromLTRB(
                                                    0.0, 0.0, 264.0, 4.0),
                                                child: Text(
                                                  "Skill Tags",
                                                  style: TextStyle(
                                                    fontSize: 14,
                                                    fontWeight: FontWeight.w300,
                                                  ),
                                                ),
                                              ),
                                              Container(
                                                  padding: EdgeInsets.fromLTRB(
                                                      0.0,
                                                      0.0,
                                                      width * 0.21,
                                                      0.0),
                                                  child: Row(
                                                    children: [
                                                      Padding(
                                                          padding:
                                                              const EdgeInsets.only(
                                                                  right: 6),
                                                          child: Container(
                                                              decoration: BoxDecoration(
                                                                  border: Border.all(
                                                                      color: Colors.blue[
                                                                          600],
                                                                      width: 1),
                                                                  borderRadius:
                                                                      BorderRadius.circular(
                                                                          16),
                                                                  color: white
                                                                      .withOpacity(
                                                                          0.4)),
                                                              child: Padding(
                                                                  padding: const EdgeInsets.only(
                                                                      top: 3,
                                                                      bottom: 3,
                                                                      left: 6,
                                                                      right: 6),
                                                                  child: Text("UI/UX", style: TextStyle(fontSize: 8, letterSpacing: 1, fontWeight: FontWeight.w500, color: Colors.black))))),
                                                      Padding(
                                                          padding:
                                                              const EdgeInsets.only(
                                                                  right: 6),
                                                          child: Container(
                                                              decoration: BoxDecoration(
                                                                  border: Border.all(
                                                                      color: Colors.blue[
                                                                          600],
                                                                      width: 1),
                                                                  borderRadius:
                                                                      BorderRadius.circular(
                                                                          16),
                                                                  color: white
                                                                      .withOpacity(
                                                                          0.4)),
                                                              child: Padding(
                                                                  padding: const EdgeInsets.only(
                                                                      top: 3,
                                                                      bottom: 3,
                                                                      left: 6,
                                                                      right: 6),
                                                                  child: Text("HTML", style: TextStyle(fontSize: 8, letterSpacing: 1, fontWeight: FontWeight.w500, color: Colors.black))))),
                                                      Padding(
                                                          padding:
                                                              const EdgeInsets.only(
                                                                  right: 6),
                                                          child: Container(
                                                              decoration: BoxDecoration(
                                                                  border: Border.all(
                                                                      color: Colors.blue[
                                                                          600],
                                                                      width: 1),
                                                                  borderRadius:
                                                                      BorderRadius.circular(
                                                                          16),
                                                                  color: white
                                                                      .withOpacity(
                                                                          0.4)),
                                                              child: Padding(
                                                                  padding: const EdgeInsets.only(
                                                                      top: 3,
                                                                      bottom: 3,
                                                                      left: 6,
                                                                      right: 6),
                                                                  child: Text("CSS", style: TextStyle(fontSize: 8, letterSpacing: 1, fontWeight: FontWeight.w500, color: Colors.black))))),
                                                      Padding(
                                                          padding:
                                                              const EdgeInsets.only(
                                                                  right: 6),
                                                          child: Container(
                                                              decoration: BoxDecoration(
                                                                  border: Border.all(
                                                                      color: Colors.blue[
                                                                          600],
                                                                      width: 1),
                                                                  borderRadius:
                                                                      BorderRadius.circular(
                                                                          16),
                                                                  color: white
                                                                      .withOpacity(
                                                                          0.4)),
                                                              child: Padding(
                                                                  padding: const EdgeInsets.only(
                                                                      top: 3,
                                                                      bottom: 3,
                                                                      left: 6,
                                                                      right: 6),
                                                                  child: Text("JavaScript", style: TextStyle(fontSize: 8, letterSpacing: 1, fontWeight: FontWeight.w500, color: Colors.black))))),
                                                      Padding(
                                                          padding:
                                                              const EdgeInsets.only(
                                                                  right: 6),
                                                          child: Container(
                                                              decoration: BoxDecoration(
                                                                  border: Border.all(
                                                                      color: Colors.blue[
                                                                          600],
                                                                      width: 1),
                                                                  borderRadius:
                                                                      BorderRadius.circular(
                                                                          16),
                                                                  color: white
                                                                      .withOpacity(
                                                                          0.4)),
                                                              child: Padding(
                                                                  padding: const EdgeInsets.only(
                                                                      top: 3,
                                                                      bottom: 3,
                                                                      left: 6,
                                                                      right: 6),
                                                                  child: Text("PHP", style: TextStyle(fontSize: 8, letterSpacing: 1, fontWeight: FontWeight.w500, color: Colors.black))))),
                                                    ],
                                                  )),
                                            ],
                                          )
                                        ],
                                      ))
                                ],
                              ),
                            )
                          ],
                        )),
                    SizedBox(height: MediaQuery.of(context).size.height * 0.02),
                    Container(
                        color: white,
                        child: Column(
                          children: [
                            Container(
                                padding:
                                    EdgeInsets.fromLTRB(0.0, 12.0, 264.0, 0.0),
                                child: Text(
                                  "Description",
                                  style: TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.w700),
                                )),
                            SizedBox(
                                height:
                                    MediaQuery.of(context).size.height * 0.02),
                            SizedBox(
                                height:
                                    MediaQuery.of(context).size.height * 0.01),
                            Container(
                              padding:
                                  EdgeInsets.fromLTRB(20.0, 0.0, 20.0, 0.0),
                              child: Text(
                                  '''- Design a basic websites in HTML, CSS and Javascript to manage employees in Covid-19.
- Website have some functions as create, update, delete.
- Understanding the requirements of personal managing system.
- Researching, designing, implementing and managing wesites based on requirements.

'''),
                            )
                          ],
                        )),
                    SizedBox(height: MediaQuery.of(context).size.height * 0.02),
                    Container(
                        color: white,
                        child: Column(
                          children: [
                            Container(
                                padding:
                                    EdgeInsets.fromLTRB(0.0, 12.0, 186.0, 0.0),
                                child: Text(
                                  "About the company",
                                  style: TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.w700),
                                )),
                            SizedBox(
                                height:
                                    MediaQuery.of(context).size.height * 0.02),
                            Column(
                              children: [
                                Container(
                                  color: white,
                                  padding:
                                      EdgeInsets.fromLTRB(15.0, 0.0, 0.0, 0.0),
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
                                                "FPT Software Vietnam ",
                                                style: TextStyle(
                                                    fontSize: 16.0,
                                                    fontWeight: FontWeight.w500,
                                                    color: Colors.black87),
                                              ),
                                            ),
                                            Container(
                                              padding: EdgeInsets.fromLTRB(
                                                  0.0, 8.0, 64.0, 0.0),
                                              child: Row(
                                                children: [
                                                  Container(
                                                    width: 5,
                                                    height: 5,
                                                    decoration: BoxDecoration(
                                                        color: green,
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
                                                      "10.001 + employees",
                                                      style: TextStyle(
                                                          fontSize: 10.0,
                                                          fontWeight:
                                                              FontWeight.normal,
                                                          color:
                                                              Colors.black54),
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
                                Container(
                                  padding:
                                      EdgeInsets.fromLTRB(0.0, 8.0, 0.0, 0.0),
                                  child: Text(
                                    "Information Technology & Services • 10,001+ employees ",
                                    textAlign: TextAlign.left,
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(
                                height:
                                    MediaQuery.of(context).size.height * 0.03),
                            Container(
                              padding:
                                  EdgeInsets.fromLTRB(20.0, 0.0, 20.0, 0.0),
                              child: Text(
                                  '''Established since 1999, a leading IT Service provider in Southeast Asia with 52 offices in 18 countries and 700+ customers worldwide.

By working with us, you can balance work and life in a dynamic environment, youthful, multicultural and full of creativity. You will have the opportunity to improve your soft skills, and foreign language skills include English, Japanese, French, ... while working and communicating with colleagues, customers from many countries around the world    '''),
                            )
                          ],
                        )),
                    SizedBox(height: MediaQuery.of(context).size.height * 0.02),
                    Container(
                        color: white,
                        child: Column(
                          children: [
                            Container(
                                padding: EdgeInsets.fromLTRB(
                                    0.0, 12.0, width * 0.53, 0.0),
                                child: Text(
                                  "More infomation",
                                  style: TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.w700),
                                )),
                            SizedBox(
                                height:
                                    MediaQuery.of(context).size.height * 0.02),
                            Container(
                              child: Column(
                                children: [
                                  GestureDetector(
                                    onTap: () {},
                                    child: Row(
                                      children: [
                                        SizedBox(width: width * 0.06),
                                        Container(
                                            width: width * 0.14,
                                            height: width * 0.14,
                                            decoration: BoxDecoration(
                                                image: DecorationImage(
                                                    image: AssetImage(
                                                        'assets/img_facebook.jpeg'),
                                                    fit: BoxFit.cover))),
                                        Container(
                                          padding: EdgeInsets.fromLTRB(
                                              16.0, 24.0, 0.0, 0.0),
                                          height: 64,
                                          child: Column(
                                            children: [
                                              Container(
                                                child: Text(
                                                  "FPT Software Vietnam's FaceBook ",
                                                  style: TextStyle(
                                                      fontSize: 16.0,
                                                      fontWeight:
                                                          FontWeight.w500,
                                                      color: Colors.black87),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  SizedBox(
                                      height:
                                          MediaQuery.of(context).size.height *
                                              0.024),
                                  GestureDetector(
                                    onTap: () {},
                                    child: Row(
                                      children: [
                                        SizedBox(width: width * 0.06),
                                        Container(
                                            width: width * 0.14,
                                            height: width * 0.14,
                                            decoration: BoxDecoration(
                                                image: DecorationImage(
                                                    image: AssetImage(
                                                        'assets/img_linked.jpeg'),
                                                    fit: BoxFit.cover))),
                                        Container(
                                          padding: EdgeInsets.fromLTRB(
                                              16.0, 24.0, 0.0, 0.0),
                                          height: 64,
                                          child: Column(
                                            children: [
                                              Container(
                                                child: Text(
                                                  "FPT Software Vietnam's Linked ",
                                                  style: TextStyle(
                                                      fontSize: 16.0,
                                                      fontWeight:
                                                          FontWeight.w500,
                                                      color: Colors.black87),
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
                            )
                          ],
                        )),
                    // SizedBox(height: MediaQuery.of(context).size.height * 0.02),
                    // Container(
                    //     width: MediaQuery.of(context).size.width,
                    //     child: RoundedButton(
                    //       color: white,
                    //       press: () {},
                    //       text: "Report Company",
                    //       textColor: Colors.red,
                    //     )),
                  ],
                ),
              ),
            ],
          ),
        ));
  }
}

enum MenuOption { Edit, Delete }

class PopupOptionMenu extends StatelessWidget {
  const PopupOptionMenu({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;

    return PopupMenuButton<MenuOption>(
      icon: Icon(
        Icons.more_vert_rounded,
        color: Colors.blue[600],
        size: 30,
      ),
      itemBuilder: (BuildContext context) {
        return <PopupMenuEntry<MenuOption>>[
          
          PopupMenuItem(
            child: GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) {
                      return AddRecruitment(
                        pageType: "Edit",
                      );
                    },
                  ),
                );
              },
              child: Row(
                children: [
                  Icon(
                    Icons.edit,
                    color: Colors.blue[600],
                  ),
                  SizedBox(
                    width: width * 0.04,
                  ),
                  Text(
                    'Edit',
                    style: TextStyle(color: Colors.blue[600]),
                  ),
                ],
              ),
            ),
            value: MenuOption.Edit,
          ),
          PopupMenuItem(
            child: GestureDetector(
                onTap: () {
                  showDialog(
                    context: context,
                    builder: (BuildContext context) {
                      return buildPopUp(context);
                    },
                  );
                },
                child: Row(
                  children: [
                    Icon(
                      Icons.delete,
                      color: Colors.blue[600],
                    ),
                    SizedBox(
                      width: width * 0.04,
                    ),
                    Text(
                      'Delete',
                      style: TextStyle(color: Colors.blue[600]),
                    ),
                  ],
                )),
            value: MenuOption.Delete,
          ),
        ];
      },
    );
  }

  Widget buildPopUp(BuildContext context) {
    return AlertDialog(
      title: Text("Delete ?"),
      content: Text("Are you sure you want to delete ?"),
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
                  builder: (BuildContext context) => AccountPageCompany(),
                ),
                (route) => false,
              );
            },
            child: Text("Yes")),
      ],
    );
  }
}
