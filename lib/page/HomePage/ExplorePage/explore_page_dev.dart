import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_tindercard/flutter_tindercard.dart';
import 'package:tindev/data/explore_json_dev.dart';
import 'package:tindev/models/JobList.dart';
import 'package:tindev/page/HomePage/ExplorePage/Detail/job_detail.dart';
import 'package:tindev/theme/colors.dart';

class ExplorePageDev extends StatefulWidget {
  final String token;
  final List<JobRec> listJob;
  final String role;
  
  const ExplorePageDev({Key key, this.listJob, this.token, this.role}) : super(key: key);
  @override
  _ExplorePageDevState createState() => _ExplorePageDevState();
}

class _ExplorePageDevState extends State<ExplorePageDev>
    with TickerProviderStateMixin {
  CardController controller;

  double opacityLike = 0; // để hiện đậm dần nút like
  double opacityDislike = 0; // để hiện đậm dần nút dislike
  bool checkFocus = true;

  @override
  void initState() {
    super.initState();
    setState(() {
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

  // ignore: missing_return
  Widget getBody() {
    var size = MediaQuery.of(context).size;
    if (widget.listJob != null) {
      return Container(
        padding: EdgeInsets.only(
          top: size.height * 0.01,
          bottom: size.height * 0.01,
        ),
        child: Stack(
          children: [
            TinderSwapCard(
              // orientation: AmassOrientation.BOTTOM,
              totalNum: widget.listJob.length,
              maxWidth: size.width,
              maxHeight: size.height,
              minWidth: size.width * 0.8,
              minHeight: size.height * 0.8,
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
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            //IMAGE
                            Container(
                              height: size.height * 0.54,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(10),
                                  topRight: Radius.circular(10),
                                ),
                                image: DecorationImage(
                                  alignment: Alignment.topCenter,
                                  image: AssetImage(
                                    explore_json[index]['img'],
                                  ),
                                  fit: BoxFit.fitHeight,
                                ),
                              ),
                            ),
                            //INFORMATION
                            Container(
                              color: Colors.white,
                              padding: EdgeInsets.only(
                                left: size.width * 0.035,
                                bottom: size.height * 0.015,
                              ),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  //NAME
                                  Text(
                                    widget.listJob[index].title,
                                    style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 32,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  SizedBox(height: size.height * 0.01),
                                  //ExTime
                                  Row(
                                      children: widget
                                                  .listJob[index].expiriedDate
                                                  .difference(DateTime.now())
                                                  .inDays >=
                                              0
                                          ? [
                                              Icon(
                                                Icons.timelapse_rounded,
                                                color: Colors.blue[600],
                                                size: 20,
                                              ),
                                              SizedBox(
                                                  width: size.width * 0.02),
                                              Text(
                                                "Expired in: " +
                                                    widget.listJob[index]
                                                        .expiriedDate
                                                        .difference(
                                                            DateTime.now())
                                                        .inDays
                                                        .toString() +
                                                    " days",
                                                style: TextStyle(
                                                  color: Colors.blue[600],
                                                  fontSize: 20,
                                                  fontWeight: FontWeight.bold,
                                                ),
                                              ),
                                              //RATING
                                              Container(
                                                margin: EdgeInsets.only(
                                                    left: size.width * 0.03),
                                                decoration: BoxDecoration(
                                                  border: Border.all(
                                                    color: Colors.blue[600],
                                                    width: 2,
                                                  ),
                                                  borderRadius:
                                                      BorderRadius.circular(10),
                                                  color: white,
                                                ),
                                                child: Padding(
                                                  padding:
                                                      const EdgeInsets.only(
                                                    top: 5,
                                                    bottom: 0,
                                                    left: 8,
                                                    right: 8,
                                                  ),
                                                  child: Text(
                                                    "* * * * *",
                                                    style: TextStyle(
                                                      color: Colors.amber,
                                                      fontWeight:
                                                          FontWeight.w900,
                                                      fontSize: 16,
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            ]
                                          : []),
                                  SizedBox(height: size.height * 0.01),
                                  //JOBTYPE
                                  Text(
                                    widget.listJob[index].jobType,
                                    style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 20,
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                  SizedBox(height: size.height * 0.01),
                                  //SALARY+WORKPLACE
                                  Row(
                                    children: [
                                      //SALARY
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
                                            vertical: 4,
                                            horizontal: 16,
                                          ),
                                          child: Row(
                                            children: [
                                              Text(
                                                "\$" +
                                                    widget.listJob[index]
                                                        .fromSalary
                                                        .toString() +
                                                    " - \$" +
                                                    widget
                                                        .listJob[index].toSalary
                                                        .toString(),
                                                style: TextStyle(
                                                  color: white,
                                                  fontSize: 18,
                                                  fontWeight: FontWeight.bold,
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                      SizedBox(width: size.width * 0.03),
                                      Container(
                                        color: black,
                                        height: size.height * 0.03,
                                        width: 2,
                                      ),
                                      SizedBox(width: size.width * 0.03),
                                      Text(
                                        widget.listJob[index].workPlace,
                                        style: TextStyle(
                                          color: Colors.black,
                                          fontSize: 18,
                                          fontWeight: FontWeight.w500,
                                        ),
                                      ),
                                    ],
                                  ),
                                  SizedBox(height: size.height * 0.01),
                                  Row(
                                    children: List.generate(
                                        widget.listJob[index].skills.length > 3
                                            ? 3
                                            : widget.listJob[index].skills
                                                .length, (indexSkills) {
                                      if (indexSkills == 0) {
                                        return Padding(
                                          padding: EdgeInsets.only(right: 6),
                                          child: Container(
                                            decoration: BoxDecoration(
                                              border: Border.all(
                                                color: Colors.blue[600],
                                                width: 2,
                                              ),
                                              borderRadius:
                                                  BorderRadius.circular(30),
                                              color: white,
                                            ),
                                            child: Padding(
                                              padding: EdgeInsets.symmetric(
                                                vertical: 3,
                                                horizontal: 10,
                                              ),
                                              child: Text(
                                                widget.listJob[index]
                                                    .skills[indexSkills],
                                                style: TextStyle(
                                                  color: Colors.black,
                                                ),
                                              ),
                                            ),
                                          ),
                                        );
                                      }
                                      return Padding(
                                        padding: EdgeInsets.only(right: 6),
                                        child: Container(
                                          decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(30),
                                            border: Border.all(
                                              color: Colors.blue[600],
                                              width: 1,
                                            ),
                                            color: white,
                                          ),
                                          child: Padding(
                                            padding: EdgeInsets.symmetric(
                                              vertical: 3,
                                              horizontal: 10,
                                            ),
                                            child: Text(
                                              widget.listJob[index]
                                                  .skills[indexSkills],
                                              style: TextStyle(
                                                color: Colors.black,
                                              ),
                                            ),
                                          ),
                                        ),
                                      );
                                    }),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                      //btnDETAIL
                      Positioned(
                        right: size.width * 0.025,
                        bottom: size.height * 0.015,
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
                                    return JobDetail(
                                      token: widget.token,
                                      // com: widget.
                                      jobRec: widget.listJob[index],
                                      index: index,                                    
                                      role: widget.role,
                                    );
                                  },
                                ),
                              );
                            },
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              // cardController: controller = CardController(),
              swipeUpdateCallback:
                  (DragUpdateDetails details, Alignment align) {
                /// Get swiping card's alignment
                if (align.x <= 0) {
                  //Card is LEFT swiping
                  setState(() {
                    if (align.x > -10 && align.x < -3) {
                      opacityDislike = align.x * (-0.1);
                    } else if (align.x <= -10) {
                      opacityDislike = 1;
                    } else {
                      opacityDislike = 0;
                    }
                  });
                } else if (align.x > 0) {
                  //Card is RIGHT swiping
                  setState(() {
                    if (align.x > 3 && align.x < 10) {
                      opacityLike = align.x * (0.1);
                    } else if (align.x >= 10) {
                      opacityLike = 1;
                    } else {
                      opacityLike = 0;
                    }
                  });
                }
              },
              swipeCompleteCallback:
                  (CardSwipeOrientation orientation, int index) {
                if (orientation == CardSwipeOrientation.LEFT) {
                  // print("Card is LEFT swiping");
                } else if (orientation == CardSwipeOrientation.RIGHT) {
                  // print("Card is RIGHT swiping");
                }

                setState(() {
                  checkFocus = false;
                  opacityDislike = 0;
                  opacityLike = 0;
                });

                /// Get orientation & index of swiped card!
                if ((index + 1) == widget.listJob.length) {
                  setState(() {
                    widget.listJob.length = widget.listJob.length - 1;
                  });
                }
              },
            ),
            buildDisLikeSign(),
            buildLikeSign(),
          ],
        ),
      );
    }
  }

  Widget buildDisLikeSign() {
    var size = MediaQuery.of(context).size;
    return Positioned(
      right: 0,
      top: 0,
      child: Opacity(
        opacity: opacityDislike,
        child: Container(
          padding: EdgeInsets.only(
            left: size.width * 0.04,
            top: size.width * 0.028,
          ),
          height: size.width * 0.12,
          width: size.width * 0.25,
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
              color: white,
              fontWeight: FontWeight.w700,
              fontSize: 20,
            ),
          ),
        ),
      ),
    );
  }

  Widget buildLikeSign() {
    var size = MediaQuery.of(context).size;
    return Positioned(
      child: Opacity(
        opacity: opacityLike,
        child: Container(
          padding: EdgeInsets.only(
            left: size.width * 0.04,
            top: size.width * 0.028,
          ),
          height: size.width * 0.12,
          width: size.width * 0.2,
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
              color: white,
              fontWeight: FontWeight.w700,
              fontSize: 20,
            ),
          ),
        ),
      ),
    );
  }
}
