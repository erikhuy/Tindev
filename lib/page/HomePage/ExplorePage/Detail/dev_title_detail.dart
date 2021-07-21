import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:tindev/data/dislikes_dev_detail_json.dart';
import 'package:tindev/data/icons.dart';
import 'package:tindev/data/likes_dev_detail_json.dart';

import 'package:tindev/theme/colors.dart';

class DevTitleDetail extends StatefulWidget {
  final int index;
  final String isLike;
  const DevTitleDetail({Key key, @required this.index, this.isLike})
      : super(key: key);

  @override
  DevTitleDetailState createState() => DevTitleDetailState();
}

class DevTitleDetailState extends State<DevTitleDetail> {
  List itemsTemp = [];

  void initState() {
    super.initState();
    setState(() {
      if (widget.isLike == "like") {
        itemsTemp = likes_dev_detail_json;
      } else if (widget.isLike == "dislike") {
        itemsTemp = dislikes_dev_detail_json;
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
        height: MediaQuery.of(context).size.height,
        child: Stack(
          alignment: Alignment.topLeft,
          children: <Widget>[
            SingleChildScrollView(
              child: Column(
                children: <Widget>[
                  SizedBox(height: MediaQuery.of(context).size.height * 0.02),
                  Container(
                    height: size.height * 0.06,
                    color: Colors.white,
                    child: Row(
                      children: [
                        SizedBox(width: size.width * 0.02),
                        Text(
                          itemsTemp[widget.index]['job_expectation']
                              ['job_type'],
                          style: TextStyle(
                            fontSize: 32.0,
                            fontWeight: FontWeight.w900,
                            color: Colors.blue[600],
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: size.height * 0.02),
                  Container(
                    color: Colors.white,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(height: size.height * 0.01),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SizedBox(width: size.width * 0.04),
                            Container(
                              width: 120,
                              height: 120,
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                image: DecorationImage(
                                  image: AssetImage(
                                    itemsTemp[widget.index]['img'],
                                  ),
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                            SizedBox(width: size.width * 0.04),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  itemsTemp[widget.index]['full_name'] +
                                      ", " +
                                      itemsTemp[widget.index]['birthday'],
                                  style: TextStyle(
                                    fontSize: 18.0,
                                    fontWeight: FontWeight.w500,
                                    color: Colors.black87,
                                  ),
                                ),
                                SizedBox(height: size.height * 0.01),
                                Text(
                                  itemsTemp[widget.index]['city'] +
                                      ", " +
                                      "VietNam",
                                  style: TextStyle(
                                    fontSize: 16.0,
                                    fontWeight: FontWeight.normal,
                                    color: Colors.black87,
                                  ),
                                ),
                                SizedBox(height: size.height * 0.01),
                                Row(
                                  children: [
                                    Container(
                                      width: 5,
                                      height: 5,
                                      decoration: BoxDecoration(
                                        color: green,
                                        shape: BoxShape.circle,
                                      ),
                                    ),
                                    SizedBox(width: size.width * 0.01),
                                    Text(
                                      "Active",
                                      style: TextStyle(
                                        fontSize: 14.0,
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
                        SizedBox(height: size.height * 0.01),
                      ],
                    ),
                  ),
                  SizedBox(height: size.height * 0.02),
                  Container(
                    color: white,
                    child: Column(
                      children: [
                        Row(
                          children: [
                            SizedBox(width: size.width * 0.04),
                            Text(
                              "About me",
                              style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: size.height * 0.02),
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            SizedBox(width: size.width * 0.07),
                            Icon(
                              Icons.star_outline_rounded,
                              color: Colors.blue[600],
                            ),
                            SizedBox(width: size.width * 0.02),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "Experience",
                                  style: TextStyle(
                                    color: Colors.blue[600],
                                    fontSize: 14,
                                    fontWeight: FontWeight.w300,
                                  ),
                                ),
                                SizedBox(height: size.height * 0.002),
                                Text(
                                  itemsTemp[widget.index]['job_expectation']
                                              ['year_experience']
                                          .toString() +
                                      " years ",
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
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            SizedBox(width: size.width * 0.07),
                            Text(
                              "ST",
                              style: TextStyle(
                                color: Colors.blue[600],
                                fontSize: 16,
                                fontWeight: FontWeight.w900,
                              ),
                            ),
                            SizedBox(width: size.width * 0.02),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                //txtSkillTag
                                Text(
                                  "Skill Tags",
                                  style: TextStyle(
                                    color: Colors.blue[600],
                                    fontSize: 14,
                                    fontWeight: FontWeight.w300,
                                  ),
                                ),
                                SizedBox(height: size.height * 0.002),
                                //skillTagDetail
                                Row(
                                  children: List.generate(
                                      itemsTemp[widget.index]['skills'].length,
                                      (indexSkill) {
                                    return Padding(
                                      padding: EdgeInsets.only(right: 6),
                                      child: Container(
                                        decoration: BoxDecoration(
                                          border: Border.all(
                                            color: Colors.blue[600],
                                            width: 1,
                                          ),
                                          borderRadius:
                                              BorderRadius.circular(16),
                                          color: white.withOpacity(0.4),
                                        ),
                                        child: Container(
                                          padding: EdgeInsets.symmetric(
                                            vertical: 3,
                                            horizontal: 6,
                                          ),
                                          child: Text(
                                            itemsTemp[widget.index]['skills']
                                                [indexSkill],
                                            style: TextStyle(
                                              fontSize: 8,
                                              letterSpacing: 1,
                                              fontWeight: FontWeight.w500,
                                              color: Colors.black,
                                            ),
                                          ),
                                        ),
                                      ),
                                    );
                                  }),
                                ),
                                SizedBox(height: size.height * 0.01),
                              ],
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: size.height * 0.02),
                  Container(
                    color: Colors.white,
                    child: Column(
                      children: [
                        Row(
                          children: [
                            SizedBox(width: size.width * 0.04),
                            Text(
                              "Description",
                              style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: size.height * 0.02),
                        Container(
                          width: size.width * 0.86,
                          child: Text(
                            itemsTemp[widget.index]['description'],
                            style: TextStyle(
                              fontSize: 14.0,
                              fontWeight: FontWeight.normal,
                              color: Colors.black87,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: size.height * 0.02),
                  Container(
                    color: Colors.white,
                    child: Column(
                      children: [
                        SizedBox(height: size.height * 0.01),
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
                                itemsTemp[widget.index]['full_name'] +
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
                                itemsTemp[widget.index]['full_name'] +
                                    " Linked ",
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
                  ),
                ],
              ),
            ),
            Positioned(
              child: Container(
                width: size.width,
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
                        }),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
