import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:tindev/data/explore_json_company detail.dart';
import 'package:tindev/components/rounded_button.dart';
import 'package:tindev/data/icons.dart';

import 'package:tindev/theme/colors.dart';

class DevTitleDetail extends StatefulWidget {
  final int id;

  const DevTitleDetail({Key key, @required this.id}) : super(key: key);

  @override
  DevTitleDetailState createState() => DevTitleDetailState();
}

class DevTitleDetailState extends State<DevTitleDetail> {
  List itemsTemp = [];

  void initState() {
    super.initState();
    setState(() {
      itemsTemp = explore_json_company;
      // print(itemsTemp[widget.id]['skills'].cast<String>());
    });
  }

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;

    List<dynamic> dynList = itemsTemp[widget.id]['skills'];
    List<String> tagslist = dynList.cast<String>();

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
                            itemsTemp[widget.id]['job_expectation']['job_type'],
                            style: TextStyle(
                                fontSize: 32.0,
                                fontWeight: FontWeight.w900,
                                color: Colors.blue[600]),
                          ),
                        )),
                    SizedBox(height: MediaQuery.of(context).size.height * 0.02),
                    Container(
                      padding: EdgeInsets.fromLTRB(15.0, 0.0, 0.0, 0.0),
                      child: Row(
                        children: [
                          Container(
                              width: 120,
                              height: 120,
                              decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  image: DecorationImage(
                                      image: AssetImage(
                                          itemsTemp[widget.id]['img']),
                                      fit: BoxFit.cover))),
                          Container(
                            //  padding: EdgeInsets.fromLTRB(0.0, 0.0, 16.0, 0.0),
                            height: 120,
                            child: Column(
                              children: [
                                Container(
                                  child: Text(
                                    itemsTemp[widget.id]['full_name'] +
                                        ", " +
                                        itemsTemp[widget.id]['birthday'],
                                    style: TextStyle(
                                        fontSize: 14.0,
                                        fontWeight: FontWeight.w500,
                                        color: Colors.black87),
                                  ),
                                ),
                                Container(
                                    padding:
                                        EdgeInsets.fromLTRB(0.0, 8.0, 0.0, 0.0),
                                    child: Align(
                                      alignment: Alignment.bottomLeft,
                                      child: Text(
                                        itemsTemp[widget.id]['city'] +
                                            ", " +
                                            "VietNam",
                                        style: TextStyle(
                                            fontSize: 14.0,
                                            fontWeight: FontWeight.normal,
                                            color: Colors.black87),
                                      ),
                                    )),
                                Container(
                                  padding:
                                      EdgeInsets.fromLTRB(0.0, 8.0, 96.0, 0.0),
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
                                          "Active",
                                          style: TextStyle(
                                              fontSize: 10.0,
                                              fontWeight: FontWeight.normal,
                                              color: Colors.black54),
                                        ),
                                      )),
                                    ],
                                  ),
                                ),
                                Container(
                                  margin: EdgeInsets.only(top: 9.0, right: 40),
                                  child: Row(
                                    //CITY
                                    children: [
                                      Container(
                                          decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(20),
                                            color: Colors.blue[600],
                                          ),
                                          child: Container(
                                            padding: EdgeInsets.symmetric(
                                                vertical: 5, horizontal: 10),
                                            child: Text(
                                                itemsTemp[widget.id][
                                                                'job_expectation']
                                                            ['year_experience']
                                                        .toString() +
                                                    " years exp ",
                                                style: TextStyle(
                                                    color: white,
                                                    fontSize: 14,
                                                    fontWeight:
                                                        FontWeight.bold)),
                                          )),
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
                                    EdgeInsets.fromLTRB(0.0, 12.0, 236.0, 0.0),
                                child: Text(
                                  "About the me",
                                  style: TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.w700),
                                )),
                            SizedBox(
                                height:
                                    MediaQuery.of(context).size.height * 0.02),
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
                                        child: Icon(Icons.star_outline_rounded,
                                            color: Colors.blue[600]),
                                      ),
                                      Column(
                                        children: [
                                          Container(
                                            padding: EdgeInsets.fromLTRB(
                                                0.0, 0.0, 32.0, 2.0),
                                            child: Text(
                                              "Experience",
                                              style: TextStyle(
                                                fontSize: 14,
                                                fontWeight: FontWeight.w300,
                                              ),
                                            ),
                                          ),
                                          Container(
                                            margin: EdgeInsets.only(
                                                right: width * 0.12),
                                            child: Text(
                                              itemsTemp[widget.id][
                                                              'job_expectation']
                                                          ['year_experience']
                                                      .toString() +
                                                  " years ",
                                              style: TextStyle(
                                                fontSize: 14,
                                                fontWeight: FontWeight.w500,
                                              ),
                                            ),
                                          )
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
                                                  width: width * 0.8,
                                                  child: Row(
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .start,
                                                      children:
                                                          tagslist.map((tags) {
                                                        return Padding(
                                                            padding: const EdgeInsets.only(
                                                                right: 6),
                                                            child: Container(
                                                                decoration: BoxDecoration(
                                                                    border: Border.all(
                                                                        color: Colors.blue[
                                                                            600],
                                                                        width:
                                                                            1),
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
                                                                    child: Text(tags, style: TextStyle(fontSize: 8, letterSpacing: 1, fontWeight: FontWeight.w500, color: Colors.black)))));
                                                      }).toList()))
                                            ],
                                          )
                                        ],
                                      ))
                                ],
                              ),
                            ),
                            SizedBox(
                                height:
                                    MediaQuery.of(context).size.height * 0.02),
                            Container(
                                padding:
                                    EdgeInsets.fromLTRB(20.0, 0.0, 20.0, 0.0),
                                child:
                                    Text(itemsTemp[widget.id]['description'])),
                          ],
                        )),
                    SizedBox(height: MediaQuery.of(context).size.height * 0.02),
                    Container(
                        color: white,
                        child: Column(
                          children: [
                            Container(
                                padding:
                                    EdgeInsets.fromLTRB(0.0, 12.0, 224.0, 0.0),
                                child: Text(
                                  "My Service",
                                  style: TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.w700),
                                )),
                            SizedBox(
                                height:
                                    MediaQuery.of(context).size.height * 0.03),
                            Container(
                                padding:
                                    EdgeInsets.fromLTRB(0.0, 0.0, 0.0, 0.0),
                                child: Column(
                                  children: [
                                    Container(
                                      child: Row(
                                        children: [
                                          Container(
                                            width: height * 0.13,
                                            height: height * 0.13,
                                            decoration: BoxDecoration(
                                                border: Border.all(
                                                    color: Colors.blue[200],
                                                    width: 1),
                                                borderRadius:
                                                    BorderRadius.circular(4),
                                                color: Colors.blue[200]),
                                            child: Column(children: [
                                              Container(
                                                  padding: EdgeInsets.fromLTRB(
                                                      0.0, 16.0, 54.0, 0.0),
                                                  child: Text(
                                                    "BA",
                                                    style: TextStyle(
                                                        color: white,
                                                        fontWeight:
                                                            FontWeight.w900,
                                                        fontSize: width * 0.08),
                                                  )),
                                              Container(
                                                  padding: EdgeInsets.fromLTRB(
                                                      0.0, 0.0, 44.0, 1.0),
                                                  child: Text(
                                                    "SIC",
                                                    style: TextStyle(
                                                        color: white,
                                                        fontWeight:
                                                            FontWeight.w900,
                                                        fontSize: width * 0.08),
                                                  ))
                                            ]),
                                          ),
                                          Container(
                                            padding: EdgeInsets.fromLTRB(
                                                0.0, 0.0, 0.0, 0.0),
                                            height: height * 0.13,
                                            child: Column(
                                              children: [
                                                Container(
                                                  padding:
                                                      EdgeInsets.only(left: 8),
                                                  child: Text(
                                                    "Create web using HTML,CSS,BootStrap 4 ",
                                                    style: TextStyle(
                                                        fontSize: 14.0,
                                                        fontWeight:
                                                            FontWeight.w500,
                                                        color: Colors.black87),
                                                  ),
                                                ),
                                                SizedBox(
                                                    height:
                                                        MediaQuery.of(context)
                                                                .size
                                                                .height *
                                                            0.014),
                                                Container(
                                                  child: Row(
                                                    children: [
                                                      Container(
                                                        child: Row(
                                                          children: [
                                                            Container(
                                                              child: Icon(
                                                                Icons
                                                                    .verified_rounded,
                                                                color: Colors
                                                                    .blue[600],
                                                                size: 16,
                                                              ),
                                                            ),
                                                            SizedBox(
                                                              width: 5,
                                                            ),
                                                            Container(
                                                                child: Align(
                                                              alignment: Alignment
                                                                  .bottomLeft,
                                                              child: Text(
                                                                "3 revisions",
                                                                style: TextStyle(
                                                                    fontSize:
                                                                        10.0,
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .normal,
                                                                    color: Colors
                                                                        .black54),
                                                              ),
                                                            )),
                                                          ],
                                                        ),
                                                      ),
                                                      SizedBox(
                                                          width: MediaQuery.of(
                                                                      context)
                                                                  .size
                                                                  .width *
                                                              0.28),
                                                      Container(
                                                        child: Row(
                                                          children: [
                                                            Container(
                                                              child: Icon(
                                                                Icons
                                                                    .verified_rounded,
                                                                color: Colors
                                                                    .blue[600],
                                                                size: 16,
                                                              ),
                                                            ),
                                                            SizedBox(
                                                              width: 5,
                                                            ),
                                                            Container(
                                                                child: Align(
                                                              alignment: Alignment
                                                                  .bottomLeft,
                                                              child: Text(
                                                                "From design file",
                                                                style: TextStyle(
                                                                    fontSize:
                                                                        10.0,
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .normal,
                                                                    color: Colors
                                                                        .black54),
                                                              ),
                                                            )),
                                                          ],
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                                SizedBox(
                                                    height:
                                                        MediaQuery.of(context)
                                                                .size
                                                                .height *
                                                            0.014),
                                                Container(
                                                  child: Row(
                                                    children: [
                                                      Container(
                                                        child: Row(
                                                          children: [
                                                            Container(
                                                              child: Icon(
                                                                Icons
                                                                    .verified_rounded,
                                                                color: Colors
                                                                    .blue[600],
                                                                size: 16,
                                                              ),
                                                            ),
                                                            SizedBox(
                                                              width: 5,
                                                            ),
                                                            Container(
                                                                child: Align(
                                                              alignment: Alignment
                                                                  .bottomLeft,
                                                              child: Text(
                                                                "Source Code",
                                                                style: TextStyle(
                                                                    fontSize:
                                                                        10.0,
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .normal,
                                                                    color: Colors
                                                                        .black54),
                                                              ),
                                                            )),
                                                          ],
                                                        ),
                                                      ),
                                                      SizedBox(
                                                          width: MediaQuery.of(
                                                                      context)
                                                                  .size
                                                                  .width *
                                                              0.36),
                                                      Container(
                                                        child: Row(
                                                          children: [
                                                            Container(
                                                              child: Icon(
                                                                Icons
                                                                    .verified_rounded,
                                                                color: Colors
                                                                    .blue[600],
                                                                size: 16,
                                                              ),
                                                            ),
                                                            SizedBox(
                                                              width: 5,
                                                            ),
                                                            Container(
                                                                child: Align(
                                                              alignment: Alignment
                                                                  .bottomLeft,
                                                              child: Text(
                                                                "1 week",
                                                                style: TextStyle(
                                                                    fontSize:
                                                                        10.0,
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .normal,
                                                                    color: Colors
                                                                        .black54),
                                                              ),
                                                            )),
                                                          ],
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                                Container(
                                                  child: Row(
                                                    //CITY
                                                    children: [
                                                      SizedBox(
                                                          width: MediaQuery.of(
                                                                      context)
                                                                  .size
                                                                  .width *
                                                              0.02),
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
                                                                  child: Text("BS4", style: TextStyle(fontSize: 8, letterSpacing: 1, fontWeight: FontWeight.w500, color: Colors.black))))),
                                                      Container(
                                                          margin:
                                                              EdgeInsets.only(
                                                                  left: 112,
                                                                  top: 6),
                                                          decoration:
                                                              BoxDecoration(
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        6),
                                                            color: Colors
                                                                .blue[600],
                                                          ),
                                                          child: Container(
                                                            padding: EdgeInsets
                                                                .symmetric(
                                                                    vertical: 5,
                                                                    horizontal:
                                                                        10),
                                                            child: Text("\$300",
                                                                style: TextStyle(
                                                                    color:
                                                                        white,
                                                                    fontSize:
                                                                        10,
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .bold)),
                                                          )),
                                                    ],
                                                  ),
                                                )
                                              ],
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                   
                                    SizedBox(
                                        height:
                                            MediaQuery.of(context).size.height *
                                                0.01),
                                    Container(
                                      child: Row(
                                        children: [
                                          Container(
                                            width: height * 0.13,
                                            height: height * 0.13,
                                            decoration: BoxDecoration(
                                                border: Border.all(
                                                    color: Colors.blue[400],
                                                    width: 1),
                                                borderRadius:
                                                    BorderRadius.circular(4),
                                                color: Colors.blue[400]),
                                            child: Column(children: [
                                              Container(
                                                  padding: EdgeInsets.fromLTRB(
                                                      0.0, 16.0, 50.0, 0.0),
                                                  child: Text(
                                                    "AD",
                                                    style: TextStyle(
                                                        color: white,
                                                        fontWeight:
                                                            FontWeight.w900,
                                                        fontSize: width * 0.08),
                                                  )),
                                              Container(
                                                  padding: EdgeInsets.fromLTRB(
                                                      0.0, 0.0, 0.0, 1.0),
                                                  child: Text(
                                                    "VANCE",
                                                    style: TextStyle(
                                                        color: white,
                                                        fontWeight:
                                                            FontWeight.w900,
                                                        fontSize:
                                                            width * 0.072),
                                                  ))
                                            ]),
                                          ),
                                          Container(
                                            height: height * 0.13,
                                            child: Column(
                                              children: [
                                                Container(
                                                  padding: EdgeInsets.only(
                                                      right: width * 0.15),
                                                  child: Text(
                                                    "Create web using basic ReactJS ",
                                                    style: TextStyle(
                                                        fontSize: 14.0,
                                                        fontWeight:
                                                            FontWeight.w500,
                                                        color: Colors.black87),
                                                  ),
                                                ),
                                                SizedBox(
                                                    height:
                                                        MediaQuery.of(context)
                                                                .size
                                                                .height *
                                                            0.014),
                                                Container(
                                                  child: Row(
                                                    children: [
                                                      Container(
                                                        child: Row(
                                                          children: [
                                                            Container(
                                                              child: Icon(
                                                                Icons
                                                                    .verified_rounded,
                                                                color: Colors
                                                                    .blue[600],
                                                                size: 16,
                                                              ),
                                                            ),
                                                            SizedBox(
                                                              width: 5,
                                                            ),
                                                            Container(
                                                                child: Align(
                                                              alignment: Alignment
                                                                  .bottomLeft,
                                                              child: Text(
                                                                "6 revisions",
                                                                style: TextStyle(
                                                                    fontSize:
                                                                        10.0,
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .normal,
                                                                    color: Colors
                                                                        .black54),
                                                              ),
                                                            )),
                                                          ],
                                                        ),
                                                      ),
                                                      SizedBox(
                                                          width: MediaQuery.of(
                                                                      context)
                                                                  .size
                                                                  .width *
                                                              0.28),
                                                      Container(
                                                        child: Row(
                                                          children: [
                                                            Container(
                                                              child: Icon(
                                                                Icons
                                                                    .verified_rounded,
                                                                color: Colors
                                                                    .blue[600],
                                                                size: 16,
                                                              ),
                                                            ),
                                                            SizedBox(
                                                              width: 5,
                                                            ),
                                                            Container(
                                                                child: Align(
                                                              alignment: Alignment
                                                                  .bottomLeft,
                                                              child: Text(
                                                                "From design file",
                                                                style: TextStyle(
                                                                    fontSize:
                                                                        10.0,
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .normal,
                                                                    color: Colors
                                                                        .black54),
                                                              ),
                                                            )),
                                                          ],
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                                SizedBox(
                                                    height:
                                                        MediaQuery.of(context)
                                                                .size
                                                                .height *
                                                            0.014),
                                                Container(
                                                  child: Row(
                                                    children: [
                                                      Container(
                                                        child: Row(
                                                          children: [
                                                            Container(
                                                              child: Icon(
                                                                Icons
                                                                    .verified_rounded,
                                                                color: Colors
                                                                    .blue[600],
                                                                size: 16,
                                                              ),
                                                            ),
                                                            SizedBox(
                                                              width: 5,
                                                            ),
                                                            Container(
                                                                child: Align(
                                                              alignment: Alignment
                                                                  .bottomLeft,
                                                              child: Text(
                                                                "Source Code",
                                                                style: TextStyle(
                                                                    fontSize:
                                                                        10.0,
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .normal,
                                                                    color: Colors
                                                                        .black54),
                                                              ),
                                                            )),
                                                          ],
                                                        ),
                                                      ),
                                                      SizedBox(
                                                          width: MediaQuery.of(
                                                                      context)
                                                                  .size
                                                                  .width *
                                                              0.36),
                                                      Container(
                                                        child: Row(
                                                          children: [
                                                            Container(
                                                              child: Icon(
                                                                Icons
                                                                    .verified_rounded,
                                                                color: Colors
                                                                    .blue[600],
                                                                size: 16,
                                                              ),
                                                            ),
                                                            SizedBox(
                                                              width: 5,
                                                            ),
                                                            Container(
                                                                child: Align(
                                                              alignment: Alignment
                                                                  .bottomLeft,
                                                              child: Text(
                                                                "5 days",
                                                                style: TextStyle(
                                                                    fontSize:
                                                                        10.0,
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .normal,
                                                                    color: Colors
                                                                        .black54),
                                                              ),
                                                            )),
                                                          ],
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                                Container(
                                                  child: Row(
                                                    //CITY
                                                    children: [
                                                      SizedBox(
                                                          width: MediaQuery.of(
                                                                      context)
                                                                  .size
                                                                  .width *
                                                              0.02),
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
                                                                  child: Text("ReactJS", style: TextStyle(fontSize: 8, letterSpacing: 1, fontWeight: FontWeight.w500, color: Colors.black))))),
                                                      Container(
                                                          margin:
                                                              EdgeInsets.only(
                                                                  left: 94,
                                                                  top: 6),
                                                          decoration:
                                                              BoxDecoration(
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        6),
                                                            color: Colors
                                                                .blue[600],
                                                          ),
                                                          child: Container(
                                                            padding: EdgeInsets
                                                                .symmetric(
                                                                    vertical: 5,
                                                                    horizontal:
                                                                        10),
                                                            child: Text("\$400",
                                                                style: TextStyle(
                                                                    color:
                                                                        white,
                                                                    fontSize:
                                                                        10,
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .bold)),
                                                          )),
                                                    ],
                                                  ),
                                                )
                                              ],
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    SizedBox(
                                        height:
                                            MediaQuery.of(context).size.height *
                                                0.01),
                                    Container(
                                      child: Row(
                                        children: [
                                          Container(
                                            width: height * 0.13,
                                            height: height * 0.13,
                                            decoration: BoxDecoration(
                                                border: Border.all(
                                                    color: Colors.blue[600],
                                                    width: 1),
                                                borderRadius:
                                                    BorderRadius.circular(4),
                                                color: Colors.blue[600]),
                                            child: Column(children: [
                                              Container(
                                                  padding: EdgeInsets.fromLTRB(
                                                      0.0, 24.0, 32.0, 0.0),
                                                  child: Text(
                                                    "PRE",
                                                    style: TextStyle(
                                                        color: white,
                                                        fontWeight:
                                                            FontWeight.w900,
                                                        fontSize: width * 0.08),
                                                  )),
                                              Container(
                                                  padding: EdgeInsets.fromLTRB(
                                                      0.0, 0.0, 16.0, 1.0),
                                                  child: Text(
                                                    "MIUM",
                                                    style: TextStyle(
                                                        color: white,
                                                        fontWeight:
                                                            FontWeight.w900,
                                                        fontSize:
                                                            width * 0.072),
                                                  ))
                                            ]),
                                          ),
                                          Container(
                                            height: height * 0.13,
                                            child: Column(
                                              children: [
                                                Container(
                                                  padding: EdgeInsets.only(
                                                      right: width * 0.06),
                                                  child: Text(
                                                    "Create web using ReactJS and NodeJS ",
                                                    style: TextStyle(
                                                        fontSize: 14.0,
                                                        fontWeight:
                                                            FontWeight.w500,
                                                        color: Colors.black87),
                                                  ),
                                                ),
                                                SizedBox(
                                                    height:
                                                        MediaQuery.of(context)
                                                                .size
                                                                .height *
                                                            0.014),
                                                Container(
                                                  child: Row(
                                                    children: [
                                                      Container(
                                                        child: Row(
                                                          children: [
                                                            Container(
                                                              child: Icon(
                                                                Icons
                                                                    .verified_rounded,
                                                                color: Colors
                                                                    .blue[600],
                                                                size: 16,
                                                              ),
                                                            ),
                                                            SizedBox(
                                                              width: 5,
                                                            ),
                                                            Container(
                                                                child: Align(
                                                              alignment: Alignment
                                                                  .bottomLeft,
                                                              child: Text(
                                                                "Unlimited revisions",
                                                                style: TextStyle(
                                                                    fontSize:
                                                                        10.0,
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .normal,
                                                                    color: Colors
                                                                        .black54),
                                                              ),
                                                            )),
                                                          ],
                                                        ),
                                                      ),
                                                      SizedBox(
                                                          width: MediaQuery.of(
                                                                      context)
                                                                  .size
                                                                  .width *
                                                              0.24),
                                                      Container(
                                                        child: Row(
                                                          children: [
                                                            Container(
                                                              child: Icon(
                                                                Icons
                                                                    .verified_rounded,
                                                                color: Colors
                                                                    .blue[600],
                                                                size: 16,
                                                              ),
                                                            ),
                                                            SizedBox(
                                                              width: 5,
                                                            ),
                                                            Container(
                                                                child: Align(
                                                              alignment: Alignment
                                                                  .bottomLeft,
                                                              child: Text(
                                                                "API include",
                                                                style: TextStyle(
                                                                    fontSize:
                                                                        10.0,
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .normal,
                                                                    color: Colors
                                                                        .black54),
                                                              ),
                                                            )),
                                                          ],
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                                SizedBox(
                                                    height:
                                                        MediaQuery.of(context)
                                                                .size
                                                                .height *
                                                            0.014),
                                                Container(
                                                  child: Row(
                                                    children: [
                                                      Container(
                                                        child: Row(
                                                          children: [
                                                            Container(
                                                              child: Icon(
                                                                Icons
                                                                    .verified_rounded,
                                                                color: Colors
                                                                    .blue[600],
                                                                size: 16,
                                                              ),
                                                            ),
                                                            SizedBox(
                                                              width: 5,
                                                            ),
                                                            Container(
                                                                child: Align(
                                                              alignment: Alignment
                                                                  .bottomLeft,
                                                              child: Text(
                                                                "CMS include",
                                                                style: TextStyle(
                                                                    fontSize:
                                                                        10.0,
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .normal,
                                                                    color: Colors
                                                                        .black54),
                                                              ),
                                                            )),
                                                          ],
                                                        ),
                                                      ),
                                                      SizedBox(
                                                          width: MediaQuery.of(
                                                                      context)
                                                                  .size
                                                                  .width *
                                                              0.36),
                                                      Container(
                                                        child: Row(
                                                          children: [
                                                            Container(
                                                              child: Icon(
                                                                Icons
                                                                    .verified_rounded,
                                                                color: Colors
                                                                    .blue[600],
                                                                size: 16,
                                                              ),
                                                            ),
                                                            SizedBox(
                                                              width: 5,
                                                            ),
                                                            Container(
                                                                child: Align(
                                                              alignment: Alignment
                                                                  .bottomLeft,
                                                              child: Text(
                                                                "1 week",
                                                                style: TextStyle(
                                                                    fontSize:
                                                                        10.0,
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .normal,
                                                                    color: Colors
                                                                        .black54),
                                                              ),
                                                            )),
                                                          ],
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                                Container(
                                                  child: Row(
                                                    //CITY
                                                    children: [
                                                      SizedBox(
                                                          width: MediaQuery.of(
                                                                      context)
                                                                  .size
                                                                  .width *
                                                              0.02),
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
                                                                  child: Text("ReactJS", style: TextStyle(fontSize: 8, letterSpacing: 1, fontWeight: FontWeight.w500, color: Colors.black))))),
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
                                                                  child: Text("NodeJS", style: TextStyle(fontSize: 8, letterSpacing: 1, fontWeight: FontWeight.w500, color: Colors.black))))),
                                                      Container(
                                                          margin:
                                                              EdgeInsets.only(
                                                                  left: 40,
                                                                  top: 6),
                                                          decoration:
                                                              BoxDecoration(
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        6),
                                                            color: Colors
                                                                .blue[600],
                                                          ),
                                                          child: Container(
                                                            padding: EdgeInsets
                                                                .symmetric(
                                                                    vertical: 5,
                                                                    horizontal:
                                                                        10),
                                                            child: Text("\$500",
                                                                style: TextStyle(
                                                                    color:
                                                                        white,
                                                                    fontSize:
                                                                        10,
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .bold)),
                                                          )),
                                                    ],
                                                  ),
                                                )
                                              ],
                                            ),
                                          ),
                                        ],
                                      ),
                                    )
                                  ],
                                ))
                          ],
                        )),
                    SizedBox(height: MediaQuery.of(context).size.height * 0.02),
                    Container(
                        color: white,
                        child: Column(
                          children: [
                            Container(
                                padding:
                                    EdgeInsets.fromLTRB(0.0, 12.0, 224.0, 0.0),
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
                                                  itemsTemp[widget.id]
                                                          ['full_name'] +
                                                      "'s FaceBook ",
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
                                                  itemsTemp[widget.id]
                                                          ['full_name'] +
                                                      "'s Linked ",
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
                    SizedBox(height: MediaQuery.of(context).size.height * 0.02),
                    
                    // Container(
                    //   child:
                    //    Container(
                    //     decoration: BoxDecoration(
                    //       shape: BoxShape.circle,
                    //       color: Colors.white70,
                    //       boxShadow: [
                    //         BoxShadow(
                    //           color: grey.withOpacity(0.3),
                    //           blurRadius: 2,
                    //           spreadRadius: 2,
                    //         ),
                    //       ],
                    //     ),
                    //     child: IconButton(
                    //       icon: SvgPicture.asset(
                    //         'assets/like_icon.svg',
                    //         width: 24,
                    //       ),
                    //       onPressed: () {
                            
                    //       },
                    //     ),
                    //   ),
                    // ),
                  ],
                ),
              ),

            ],
          ),
        ));
  }
}
