import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_tindercard/flutter_tindercard.dart';
import 'package:tindev/data/explore_json_company.dart';
import 'package:tindev/theme/colors.dart';
import 'package:tindev/page/dev_title_detail.dart';

class ExplorePageCompany extends StatefulWidget {
  @override
  _ExplorePageCompanyState createState() => _ExplorePageCompanyState();
}

class _ExplorePageCompanyState extends State<ExplorePageCompany>
    with TickerProviderStateMixin {
  CardController controller;
  double opacityLike = 0; // để hiện đậm dần nút like
  double opacityDislike = 0; // để hiện đậm dần nút dislike
  bool checkFocus = true;
  List itemsTemp = [];
  int itemLength = 0;
  @override
  void initState() {
    super.initState();
    setState(() {
      itemsTemp = explore_json;
      itemLength = explore_json.length;
      opacityLike = 0;
      opacityDislike = 0;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: white,
      body: getBody(),
    );
  }

  Widget getBody() {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    var size = MediaQuery.of(context).size;
    return Container(
        padding: EdgeInsets.only(
          top: size.height * 0.01,
          bottom: size.height * 0.02,
        ),
        child: Stack(
          children: [
            TinderSwapCard(
              
              totalNum: itemLength,
              minWidth: size.width * 0.8,
              maxWidth: size.width,
              minHeight: size.height * 0.8,
              maxHeight: size.height,
              cardBuilder: (context, index) => Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black12,
                      blurRadius: 2,
                      spreadRadius: 2,
                    ),
                  ],
                ),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(10),
                  child: Stack(
                    children: [
                      Container(
                        color: Colors.white,
                        padding: EdgeInsets.only(
                          left: size.width * 0.035,
                          bottom: size.height * 0.015,
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: <Widget>[
                            Text(
                              itemsTemp[index]['name'],
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 32,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            SizedBox(height: width * 0.02),
                            Row(
                              children: [
                                Container(
                                  child: Icon(
                                    Icons.verified_rounded,
                                    color: Colors.blue[600],
                                    size: 20,
                                  ),
                                ),
                                SizedBox(width: width * 0.02),
                                Container(
                                  child: Text(
                                    "2 Years Experience",
                                    style: TextStyle(
                                        color: Colors.blue[600],
                                        fontSize: 20,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(height: 12),
                            Row(
                              children: [
                                Container(
                                  child: Text(
                                    itemsTemp[index]['job'],
                                    style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 20,
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                ),
                                Container(
                                  margin: EdgeInsets.only(left: width * 0.03),
                                  decoration: BoxDecoration(
                                    border: Border.all(
                                      color: Colors.blue[600],
                                      width: 2,
                                    ),
                                    borderRadius: BorderRadius.circular(10),
                                    color: white,
                                  ),
                                  child: Padding(
                                    padding: const EdgeInsets.only(
                                      top: 5,
                                      bottom: 0,
                                      left: 8,
                                      right: 8,
                                    ),
                                    child: Text(
                                      "* * * * *",
                                      style: TextStyle(
                                          color: Colors.amber,
                                          fontWeight: FontWeight.w900,
                                          fontSize: 16),
                                    ),
                                  ),
                                )
                              ],
                            ),
                            SizedBox(height: 6),
                            Row(
                              children: [
                                Container(
                                  margin: EdgeInsets.only(right: width * 0.03),
                                  child: Text(
                                    itemsTemp[index]['jobTitle'],
                                    style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 14,
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                ),
                                Container(
                                  color: black,
                                  height: height * 0.02,
                                  width: 1,
                                ),
                                Container(
                                  margin: EdgeInsets.only(left: width * 0.03),
                                  child: Text(
                                    itemsTemp[index]['city'],
                                    style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 14,
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(height: 6),
                            Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                border: Border.all(
                                  color: Colors.blue[600],
                                  width: 2,
                                ),
                              ),
                              child: Container(
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  border: Border.all(
                                    color: white,
                                    width: 2,
                                  ),
                                  color: Colors.blue[600],
                                ),
                                padding: EdgeInsets.symmetric(
                                  vertical: 6,
                                  horizontal: 16,
                                ),
                                child: Text(
                                  "\$300 - \$500",
                                  style: TextStyle(
                                    color: white,
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                            ),
                            SizedBox(height: 12),
                            Row(
                              children: List.generate(
                                  itemsTemp[index]['skills'].length,
                                  (indexLikes) {
                                if (indexLikes == 0) {
                                  return Padding(
                                    padding: const EdgeInsets.only(right: 8),
                                    child: Container(
                                      decoration: BoxDecoration(
                                        border: Border.all(
                                          color: Colors.blue[600],
                                          width: 2,
                                        ),
                                        borderRadius: BorderRadius.circular(30),
                                        color: white,
                                      ),
                                      child: Padding(
                                        padding: const EdgeInsets.only(
                                          top: 3,
                                          bottom: 3,
                                          left: 10,
                                          right: 10,
                                        ),
                                        child: Text(
                                          itemsTemp[index]['skills']
                                              [indexLikes],
                                          style: TextStyle(color: Colors.black),
                                        ),
                                      ),
                                    ),
                                  );
                                }
                                return Padding(
                                  padding: const EdgeInsets.only(right: 8),
                                  child: Container(
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(30),
                                      border: Border.all(
                                        color: Colors.blue[600],
                                        width: 1,
                                      ),
                                      color: white,
                                    ),
                                    child: Padding(
                                      padding: const EdgeInsets.only(
                                        top: 3,
                                        bottom: 3,
                                        left: 10,
                                        right: 10,
                                      ),
                                      child: Text(
                                        itemsTemp[index]['skills'][indexLikes],
                                        style: TextStyle(color: Colors.black),
                                      ),
                                    ),
                                  ),
                                );
                              }),
                            ),
                          ],
                        ),
                      ),
                      Positioned(
                        child: Container(
                          height: width,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            border: Border.all(
                              color: Colors.black12,
                            ),
                            image: DecorationImage(
                              alignment: Alignment.topCenter,
                              image: AssetImage(itemsTemp[index]['img']),
                              fit: BoxFit.fitHeight,
                            ),
                          ),
                        ),
                      ),
                      Positioned(
                        right: size.width * 0.04,
                        bottom: size.height * 0.02,
                        child: Container(
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: Colors.white70,
                            boxShadow: [
                              BoxShadow(
                                color: grey.withOpacity(0.3),
                                blurRadius: 2,
                                spreadRadius: 2,
                              ),
                            ],
                          ),
                          child: IconButton(
                            icon: SvgPicture.asset(
                              'assets/iconmonstr-info-2.svg',
                              width: 24,
                            ),
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) {
                                    return DevTitleDetail(id: index);
                                  },
                                ),
                              );
                            },
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ),
              cardController: controller= CardController(),
              swipeUpdateCallback:
                  (DragUpdateDetails details, Alignment align) {
                if (align.x <= 0) {
                  //Card is LEFT swiping
                  setState(() {
                    if (align.x > -10 && align.x < -3) {
                      opacityDislike = align.x * (-0.1);
                      // print("1");
                    } else if (align.x <= -10) {
                      opacityDislike = 1;
                      // print(align.x * (-0.1));
                    } else {
                      // print("0");
                      opacityDislike = 0;
                    }
                  });
                } else if (align.x > 0) {
                  //Card is RIGHT swiping
                  setState(() {
                    if (align.x > 3 && align.x < 10) {
                      opacityLike = align.x * (0.1);
                      // print("1");
                    } else if (align.x >= 10) {
                      opacityLike = 1;
                      // print(align.x * (-0.1));
                    } else {
                      // print("0");
                      opacityLike = 0;
                    }
                  });
                }
              },
              swipeCompleteCallback:
                  (CardSwipeOrientation orientation, int index) {
                /// Get orientation & index of swiped card!
                setState(() {
                  checkFocus = false;
                  opacityDislike = 0;
                  opacityLike = 0;
                });

                print(index);

                /// Get orientation & index of swiped card!
                if (index == (itemsTemp.length - 1)) {
                  setState(() {
                    itemLength = itemsTemp.length - 1;
                  });
                }
              },
            ),
            buildDisLikeSign(),
            buildLikeSign(),
          ],
        ));
  }

  Widget buildDisLikeSign() {
    var width = MediaQuery.of(context).size.width;
    return Positioned(
        right: 0,
        top: 0,
        child: Opacity(
          opacity: opacityDislike,
          child: Container(
              padding: EdgeInsets.only(left: width * 0.04, top: width * 0.028),
              height: width * 0.12,
              width: width * 0.25,
              decoration: BoxDecoration(
                color: Colors.red[800],
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(25),
                  topLeft: Radius.circular(5),
                ),
              ),
              child: Text(
                "DISLIKE",
                style: TextStyle(
                    color: white, fontWeight: FontWeight.w700, fontSize: 20),
              )),
        ));
  }

  Widget buildLikeSign() {
    var width = MediaQuery.of(context).size.width;
    return Positioned(
        child: Opacity(
      opacity: opacityLike,
      child: Container(
          padding: EdgeInsets.only(left: width * 0.04, top: width * 0.028),
          height: width * 0.12,
          width: width * 0.2,
          decoration: BoxDecoration(
            color: Colors.green[600],
            borderRadius: BorderRadius.only(
              bottomRight: Radius.circular(25),
              topRight: Radius.circular(5),
            ),
          ),
          child: Text(
            "LIKE",
            style: TextStyle(
                color: white, fontWeight: FontWeight.w700, fontSize: 20),
          )),
    ));
  }
}
