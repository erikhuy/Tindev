import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:tindev/data/dislikes_company_detail_json.dart';

import 'package:tindev/data/icons.dart';
import 'package:tindev/data/likes_company_detail_json.dart';

import 'package:tindev/theme/colors.dart';

class JobTitleDetail extends StatefulWidget {
  final int index;
  final bool checkRole;
  final String isLike;

  const JobTitleDetail(
      {Key key, @required this.index, @required this.checkRole, this.isLike})
      : super(key: key);
  @override
  JobTitleDetailState createState() => JobTitleDetailState();
}

class JobTitleDetailState extends State<JobTitleDetail> {
  int index;
  String isLike;
  List itemsTemp = [];

  @override
  void initState() {
    super.initState();
    setState(() {
      //Checl role ?dev :company
      if (widget.isLike == "like") {
        itemsTemp = likes_company_detail_json;
      } else if (widget.isLike == "dislike") {
        itemsTemp = dislikes_company_detail_json;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    List<dynamic> dynList = itemsTemp[widget.index]['skills'];
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
          height: size.height,
          child: Stack(
            alignment: Alignment.topLeft,
            children: <Widget>[
              SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    SizedBox(height: size.height * 0.02),
                    // Title Name
                    Container(
                      width: size.width,
                      color: Colors.white,
                      child: Row(
                        children: [
                          SizedBox(width: size.width * 0.04),
                          Text(
                            itemsTemp[widget.index]['title'],
                            style: TextStyle(
                              fontSize: 28.0,
                              fontWeight: FontWeight.w900,
                              color: Colors.black87,
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: size.height * 0.02),
                    //COMPANY PROFILE
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        SizedBox(width: size.width * 0.04),
                        //Image
                        Container(
                          width: 120,
                          height: 120,
                          decoration: BoxDecoration(
                            image: DecorationImage(
                              image: AssetImage(itemsTemp[widget.index]['img']),
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                        //info
                        //Comapany Name
                        Container(
                          color: Colors.white,
                          height: 140,
                          child: Column(
                            children: [
                              //Company Name
                              Container(
                                child: Text(
                                  itemsTemp[widget.index]['company'],
                                  style: TextStyle(
                                    fontSize: 18.0,
                                    fontWeight: FontWeight.w500,
                                    color: Colors.black87,
                                  ),
                                ),
                              ),
                              //Company Rate
                              Container(
                                margin: EdgeInsets.only(
                                  right: size.width * 0.32,
                                  top: size.width * 0.01,
                                ),
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
                                      fontSize: 14,
                                    ),
                                  ),
                                ),
                              ),
                              //Company Time
                              Container(
                                padding:
                                    EdgeInsets.fromLTRB(0.0, 8.0, 96.0, 0.0),
                                child: Row(
                                  children: [
                                    //Company time shaope
                                    Container(
                                      width: 5,
                                      height: 5,
                                      decoration: BoxDecoration(
                                        color: green,
                                        shape: BoxShape.circle,
                                      ),
                                    ),
                                    SizedBox(
                                      width: 5,
                                    ),
                                    //Company timer
                                    Container(
                                      child: Align(
                                        alignment: Alignment.bottomLeft,
                                        child: Text(
                                          itemsTemp[widget.index]['time'],
                                          style: TextStyle(
                                            fontSize: 14.0,
                                            fontWeight: FontWeight.normal,
                                            color: Colors.black54,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              //Company Price
                              Container(
                                margin: EdgeInsets.only(top: 9.0, right: 78),
                                child: Row(
                                  children: [
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
                                          itemsTemp[widget.index]['price'],
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
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: size.height * 0.02),
                    //Company Requirements detail
                    Container(
                      color: white,
                      child: Column(
                        children: [
                          SizedBox(height: size.height * 0.02),
                          Row(
                            children: [
                              SizedBox(width: size.width * 0.04),
                              Text(
                                "Requirements",
                                style: TextStyle(
                                    fontSize: 20, fontWeight: FontWeight.w700),
                              ),
                            ],
                          ),
                          SizedBox(height: size.height * 0.02),
                          //Title
                          Row(
                            children: [
                              SizedBox(width: size.width * 0.05),
                              //Icon Title
                              Icon(
                                Icons.assignment_turned_in_outlined,
                                color: Colors.blue[600],
                              ),
                              Column(
                                children: [
                                  Text(
                                    "Title",
                                    style: TextStyle(
                                      fontSize: 14,
                                      fontWeight: FontWeight.w300,
                                    ),
                                  ),
                                  SizedBox(height: size.height * 0.01),
                                  Text(
                                    itemsTemp[widget.index]['jobTitle'],
                                    style: TextStyle(
                                      fontSize: 14,
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                          SizedBox(height: size.height * 0.02),
                          //During day - dealine days
                          Row(
                            children: [
                              SizedBox(width: size.width * 0.05),
                              //Icon Title
                              Icon(
                                Icons.timelapse_rounded,
                                color: Colors.blue[600],
                              ),
                              Column(
                                children: [
                                  Text(
                                    "During days",
                                    style: TextStyle(
                                      fontSize: 14,
                                      fontWeight: FontWeight.w300,
                                    ),
                                  ),
                                  SizedBox(height: size.height * 0.01),
                                  Text(
                                    itemsTemp[widget.index]['expiredDay'],
                                    style: TextStyle(
                                      fontSize: 14,
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                          SizedBox(height: size.height * 0.02),
                          //Location
                          Row(
                            children: [
                              SizedBox(width: size.width * 0.05),
                              //Icon Title
                              Icon(
                                Icons.assignment_turned_in_outlined,
                                color: Colors.blue[600],
                              ),
                              Column(
                                children: [
                                  Text(
                                    "Location",
                                    style: TextStyle(
                                      fontSize: 14,
                                      fontWeight: FontWeight.w300,
                                    ),
                                  ),
                                  SizedBox(height: size.height * 0.01),
                                  Text(
                                    itemsTemp[widget.index]['location'],
                                    style: TextStyle(
                                      fontSize: 14,
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                          SizedBox(height: size.height * 0.02),
                          //Experience
                          Row(
                            children: [
                              SizedBox(width: size.width * 0.05),
                              //Icon Title
                              Icon(
                                Icons.assignment_turned_in_outlined,
                                color: Colors.blue[600],
                              ),
                              Column(
                                children: [
                                  Text(
                                    "Experience",
                                    style: TextStyle(
                                      fontSize: 14,
                                      fontWeight: FontWeight.w300,
                                    ),
                                  ),
                                  SizedBox(height: size.height * 0.01),
                                  Text(
                                    itemsTemp[widget.index]['experience'],
                                    style: TextStyle(
                                      fontSize: 14,
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                          SizedBox(height: size.height * 0.02),
                          //Skill Tags
                          Row(
                            children: [
                              SizedBox(width: size.width * 0.02),
                              //Icon Title
                              Text(
                                "ST",
                                style: TextStyle(
                                  color: Colors.blue[600],
                                  fontSize: 16,
                                  fontWeight: FontWeight.w900,
                                ),
                              ),
                              Column(
                                children: [
                                  Text(
                                    "Skill Tags",
                                    style: TextStyle(
                                      fontSize: 14,
                                      fontWeight: FontWeight.w300,
                                    ),
                                  ),
                                  SizedBox(height: size.height * 0.01),
                                  Container(
                                    width: size.width * 0.8,
                                    child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        children:
                                            //tao tagslist o tren dong 25
                                            tagslist.map((tags) {
                                          return Padding(
                                              padding: const EdgeInsets.only(
                                                  right: 6),
                                              child: Container(
                                                  decoration: BoxDecoration(
                                                      border: Border.all(
                                                          color:
                                                              Colors.blue[600],
                                                          width: 1),
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              16),
                                                      color: white
                                                          .withOpacity(0.4)),
                                                  child: Padding(
                                                      padding: const EdgeInsets.only(
                                                          top: 3,
                                                          bottom: 3,
                                                          left: 6,
                                                          right: 6),
                                                      child: Text(tags,
                                                          style: TextStyle(
                                                              fontSize: 8,
                                                              letterSpacing: 1,
                                                              fontWeight:
                                                                  FontWeight.w500,
                                                              color: Colors.black)))));
                                        }).toList()),
                                  ),
                                ],
                              ),
                            ],
                          ),
                          SizedBox(height: size.height * 0.02),
                        ],
                      ),
                    ),
                    SizedBox(height: MediaQuery.of(context).size.height * 0.02),
                    //Description
                    Container(
                      width: size.width * 0.9,
                      child: Column(
                        children: [
                          SizedBox(height: size.height * 0.01),
                          //Description
                          Row(
                            children: [
                              SizedBox(width: size.width * 0.01),
                              Text(
                                "Description",
                                style: TextStyle(
                                    fontSize: 22, fontWeight: FontWeight.w700),
                              ),
                            ],
                          ),
                          SizedBox(height: size.height * 0.02),
                          Row(children: [
                            Container(
                              width: size.width * 0.9,
                              child: Text(
                                itemsTemp[widget.index]['description'],
                              ),
                            ),
                          ]),
                        ],
                      ),
                    ),
                    SizedBox(height: MediaQuery.of(context).size.height * 0.02),
                    //About Company
                    Container(
                      color: Colors.white,
                      child: Column(
                        children: [
                          SizedBox(height: size.height * 0.01),
                          //txtAbout
                          Row(
                            children: [
                              SizedBox(width: size.width * 0.04),
                              Text(
                                "About the Company",
                                style: TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.w700,
                                ),
                              ),
                            ],
                          ),
                          SizedBox(height: size.height * 0.02),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              SizedBox(width: size.width * 0.04),
                              //Image
                              Container(
                                width: 120,
                                height: 120,
                                decoration: BoxDecoration(
                                  image: DecorationImage(
                                      image: AssetImage(
                                          itemsTemp[widget.index]['img']),
                                      fit: BoxFit.cover),
                                ),
                              ),
                              //Comapany Name
                              Container(
                                height: 120,
                                child: Column(
                                  children: [
                                    //Company Name
                                    Container(
                                      child: Text(
                                        itemsTemp[widget.index]['company'],
                                        style: TextStyle(
                                            fontSize: 18.0,
                                            fontWeight: FontWeight.w500,
                                            color: Colors.black87),
                                      ),
                                    ),
                                    //Company Rate
                                    Container(
                                      padding: EdgeInsets.fromLTRB(
                                          0.0, 8.0, 80.0, 0.0),
                                      child: Align(
                                        alignment: Alignment.bottomLeft,
                                        child: Text(
                                          itemsTemp[widget.index]['numEmp'],
                                          style: TextStyle(
                                              fontSize: 10.0,
                                              fontWeight: FontWeight.normal,
                                              color: Colors.black54),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                          Column(
                            children: [
                              Text(
                                itemsTemp[widget.index]['topic'],
                                textAlign: TextAlign.left,
                              ),
                              SizedBox(height: size.height * 0.01),
                              Text(itemsTemp[widget.index]['des_com']),
                            ],
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: MediaQuery.of(context).size.height * 0.02),

                    ///MORE INFOR
                    Column(
                      children: [
                        //txtMoreInformation
                        Row(
                          children: [
                            SizedBox(width: size.width * 0.04),
                            Text(
                              "More Infomation",
                              style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: size.height * 0.02),
                        //facebookLINK
                        GestureDetector(
                          onTap: () {},
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              SizedBox(width: size.width * 0.07),
                              Container(
                                width: size.width * 0.14,
                                height: size.width * 0.14,
                                decoration: BoxDecoration(
                                  image: DecorationImage(
                                    image:
                                        AssetImage('assets/img_facebook.jpeg'),
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              ),
                              SizedBox(width: size.width * 0.04),
                              Text(
                                itemsTemp[widget.index]['company'] +
                                    " Facebook ",
                                style: TextStyle(
                                  fontSize: 16.0,
                                  fontWeight: FontWeight.w500,
                                  color: Colors.black87,
                                ),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(height: size.height * 0.024),
                        //linkedLINK
                        GestureDetector(
                          onTap: () {},
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              SizedBox(width: size.width * 0.07),
                              Container(
                                width: size.width * 0.14,
                                height: size.width * 0.14,
                                decoration: BoxDecoration(
                                  image: DecorationImage(
                                    image: AssetImage('assets/img_linked.jpeg'),
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              ),
                              SizedBox(width: size.width * 0.04),
                              Text(
                                itemsTemp[widget.index]['company'] + " Linked ",
                                style: TextStyle(
                                  fontSize: 16.0,
                                  fontWeight: FontWeight.w500,
                                  color: Colors.black87,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              //Goi nut Like vs Dislike theo Role
              renderIcon()
            ],
          ),
        ));
  }

//Nut like and Dislike
  Widget renderIcon() {
    if (widget.checkRole) {
      return Positioned(
        child: Container(
          width: MediaQuery.of(context).size.width,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 350),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  // crossAxisAlignment: CrossAxisAlignment.start,
                  children: List.generate(
                    item_icons.length,
                    (index) {
                      return Container(
                        margin: EdgeInsets.only(bottom: 20),
                        width: item_icons[index]['size'],
                        height: item_icons[index]['size'],
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: Colors.white,
                          boxShadow: [
                            BoxShadow(
                              color: grey.withOpacity(0.1),
                              spreadRadius: 5,
                              blurRadius: 10,
                            ),
                          ],
                        ),
                        child: Center(
                          child: IconButton(
                            icon: SvgPicture.asset(
                              item_icons[index]['icon'],
                              width: item_icons[index]['icon_size'],
                            ),
                            onPressed: () {
                              Navigator.of(context).pop();
                            },
                          ),
                        ),
                      );
                    },
                  ),
                ),
              ),
            ],
          ),
        ),
      );
    } else {
      return Positioned(
        child: Container(
          width: MediaQuery.of(context).size.width,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 350),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  // crossAxisAlignment: CrossAxisAlignment.start,
                  children: List.generate(item_icons.length, (index) {
                    return Container(
                      margin: EdgeInsets.only(bottom: 20),
                      width: item_icons[index]['size'],
                      height: item_icons[index]['size'],
                    );
                  }),
                ),
              ),
            ],
          ),
        ),
      );
    }
  }
}
