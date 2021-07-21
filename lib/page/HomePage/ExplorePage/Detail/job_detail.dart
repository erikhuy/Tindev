import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:tindev/data/icons.dart';
import 'package:tindev/models/ComAcc.dart';
import 'package:tindev/models/JobList.dart';
import 'package:tindev/page/HomePage/home_dev.dart';
import 'package:tindev/services/CompanyServies.dart';
import 'package:tindev/theme/colors.dart';

import 'job_detail_edit.dart';

class JobDetail extends StatefulWidget {
  final String token;
  final JobRec job;
  final CompanyClass com;
  final JobRec jobRec;
  final List<String> listCity, listJobType, listSkill;
  final bool checkRole;
  final String isLike;
  final String role;
  final int index;
  const JobDetail({
    Key key,
    this.token,
    this.checkRole,
    this.isLike,
    this.jobRec,
    this.com,
    this.listCity,
    this.listJobType,
    this.listSkill,
    this.job, this.role, this.index,
  }) : super(key: key);

  @override
  JobDetailState createState() => JobDetailState();
}

class JobDetailState extends State<JobDetail> {
  CompanyClass company;

  @override
  void initState() {
    super.initState();
    setState(() {
      if (widget.isLike == "like") {
        //itemTemp = likes_company_detail_json;
      } else if (widget.isLike == "dislike") {
        //itemTemp = dislikes_company_detail_json;
      } else {
        //itemTemp = job_detail_json;
      }
    });
    if (widget.com == null) {
      CompanyServices.getCompanyInfoByID(widget.jobRec.userId).then((com) {
        if (com != null) {
          setState(() {
            company = com;
          });
        }
      });
    } else {
      company = widget.com;
    }
  }

  @override
  // ignore: missing_return
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        automaticallyImplyLeading: false,
        elevation: 0,
        leading: Navigator.canPop(context)
            ? IconButton(
                padding: EdgeInsets.only(left: 8, top: 24),
                icon: Icon(
                  Icons.arrow_back_ios_new_rounded,
                  color: Colors.blue[600],
                  size: 32,
                ),
                onPressed: () => Navigator.of(context).pop(),
              )
            : null,
        actions: [
          if (widget.checkRole != null && widget.checkRole == false)
            IconButton(
              padding: EdgeInsets.fromLTRB(0, 16.0, 24.0, 0.0),
              icon: Icon(
                Icons.more_vert_rounded,
                color: Colors.blue[600],
                size: 32,
              ),
              onPressed: () => {
                //linkToJobRecruitmentEDIT and check Role = Company
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => EditInfoJobRecruit(
                      token: widget.token,
                      jobRec: widget.jobRec,
                      listCity: widget.listCity,
                      listJobType: widget.listJobType,
                      listSkill: widget.listSkill,
                    ),
                  ),
                )
              },
            )
        ],
      ),
      body: Container(
        width: double.infinity,
        height: size.height,
        child: Stack(
          alignment: Alignment.topLeft,
          children: <Widget>[
            SingleChildScrollView(
              child: Column(
                children: <Widget>[
                  SizedBox(height: size.height * 0.02),
                  //JOB_TITLE
                  Container(
                    height: size.height * 0.06,
                    color: Colors.white,
                    child: Row(
                      children: [
                        SizedBox(width: size.width * 0.02),
                        Text(
                          widget.jobRec.title,
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
                  //PROFILE
                  Container(
                    color: Colors.white,
                    child: Column(
                      children: [
                        SizedBox(height: size.height * 0.01),
                        //profileDetail
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SizedBox(width: size.width * 0.04),
                            //image
                            Container(
                              width: 120,
                              height: 120,
                              decoration: BoxDecoration(
                                image: DecorationImage(
                                  image: AssetImage('assets/img_1.jpeg'),
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                            SizedBox(width: size.width * 0.04),
                            //information
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                //txtName
                                Text(
                                  company != null ? company.name : "Company's Name",
                                  style: TextStyle(
                                    fontSize: 18.0,
                                    fontWeight: FontWeight.w500,
                                    color: Colors.black87,
                                  ),
                                ),
                                SizedBox(height: size.height * 0.01),
                                //txtRating
                                Container(
                                  decoration: BoxDecoration(
                                    border: Border.all(
                                      color: Colors.blue[600],
                                      width: 1,
                                    ),
                                    borderRadius: BorderRadius.circular(6),
                                    color: white,
                                  ),
                                  child: Padding(
                                    padding: EdgeInsets.only(
                                      top: 3,
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
                                SizedBox(height: size.height * 0.01),
                                //txtCity
                                Text(
                                  company != null ? company.city + ", Việt Nam" : "Việt Nam",
                                  style: TextStyle(
                                    fontSize: 16.0,
                                    fontWeight: FontWeight.normal,
                                    color: Colors.black87,
                                  ),
                                ),
                                SizedBox(height: size.height * 0.01),
                                //txtStatus
                                Row(
                                  children: [
                                    //greenLight
                                    Container(
                                      width: 5,
                                      height: 5,
                                      decoration: BoxDecoration(
                                        color: green,
                                        shape: BoxShape.circle,
                                      ),
                                    ),
                                    SizedBox(width: size.width * 0.01),
                                    //txtStatus
                                    Text(
                                      company != null ? company.status : "Active",
                                      style: TextStyle(
                                        fontSize: 14,
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
                  SizedBox(height: size.height * 0.02),
                  //REQUIREMENT
                  Container(
                    color: Colors.white,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(height: size.height * 0.005),
                        //txtRequirements
                        Row(
                          children: [
                            SizedBox(width: size.width * 0.04),
                            Text(
                              "Requirements",
                              style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: size.height * 0.02),
                        //jobType
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            SizedBox(width: size.width * 0.07),
                            //icon
                            Icon(
                              Icons.assignment_turned_in_outlined,
                              color: Colors.blue[600],
                            ),
                            SizedBox(width: size.width * 0.02),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "Job Type",
                                  style: TextStyle(
                                    color: Colors.blue[600],
                                    fontSize: 14,
                                    fontWeight: FontWeight.w300,
                                  ),
                                ),
                                SizedBox(height: size.height * 0.002),
                                Text(
                                  widget.jobRec.jobType,
                                  style: TextStyle(
                                    fontSize: 14,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                              ],
                            )
                          ],
                        ),
                        SizedBox(height: size.height * 0.02),
                        //duration
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            SizedBox(width: size.width * 0.07),
                            Icon(
                              Icons.timelapse_rounded,
                              color: Colors.blue[600],
                            ),
                            SizedBox(width: size.width * 0.02),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "Duration",
                                  style: TextStyle(
                                    color: Colors.blue[600],
                                    fontSize: 14,
                                    fontWeight: FontWeight.w300,
                                  ),
                                ),
                                SizedBox(height: size.height * 0.002),
                                //txtExDuration
                                widget.jobRec.expiriedDate
                                            .difference(DateTime.now())
                                            .inDays <
                                        0
                                    ? Text(
                                        "Expired !",
                                        style: TextStyle(
                                          color: Colors.red,
                                          fontSize: 14,
                                          fontWeight: FontWeight.w500,
                                        ),
                                      )
                                    : Text(
                                        widget.jobRec.expiriedDate
                                                .difference(DateTime.now())
                                                .inDays
                                                .toString() +
                                            " days",
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
                        //location
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            SizedBox(width: size.width * 0.07),
                            //icon
                            Icon(
                              Icons.location_on_outlined,
                              color: Colors.blue[600],
                            ),
                            SizedBox(width: size.width * 0.02),
                            //txtLocation
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "Location",
                                  style: TextStyle(
                                    color: Colors.blue[600],
                                    fontSize: 14,
                                    fontWeight: FontWeight.w300,
                                  ),
                                ),
                                SizedBox(height: size.height * 0.002),
                                Text(
                                  widget.jobRec.workPlace + ", Việt Nam",
                                  style: TextStyle(
                                    fontSize: 14,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                              ],
                            )
                          ],
                        ),
                        SizedBox(height: size.height * 0.02),
                        //experience
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
                                  widget.jobRec.yearExperience.toString() +
                                      " year(s)",
                                  style: TextStyle(
                                    fontSize: 14,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                              ],
                            )
                          ],
                        ),
                        SizedBox(height: size.height * 0.02),
                        //skills
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
                                Text(
                                  "Skill Tags",
                                  style: TextStyle(
                                    color: Colors.blue[600],
                                    fontSize: 14,
                                    fontWeight: FontWeight.w300,
                                  ),
                                ),
                                SizedBox(height: size.height * 0.002),
                                Row(
                                  children: List.generate(
                                      widget.jobRec.skills.length < 6
                                          ? widget.jobRec.skills.length
                                          : 5, (indexSkill) {
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
                                        child: Padding(
                                          padding: EdgeInsets.symmetric(
                                            vertical: 3,
                                            horizontal: 6,
                                          ),
                                          child: Text(
                                            widget.jobRec.skills[indexSkill],
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
                              ],
                            ),
                          ],
                        ),
                        SizedBox(height: size.height * 0.005),
                      ],
                    ),
                  ),
                  SizedBox(height: size.height * 0.02),
                  //DESCRIPTION
                  Container(
                    color: Colors.white,
                    child: Column(
                      children: [
                        SizedBox(height: size.height * 0.005),
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
                            widget.jobRec.description,
                            style: TextStyle(
                              fontSize: 14.0,
                              fontWeight: FontWeight.normal,
                              color: Colors.black87,
                            ),
                          ),
                        ),
                        SizedBox(height: size.height * 0.005),
                      ],
                    ),
                  ),
                  SizedBox(height: size.height * 0.02),
                  //ABOUT THE COMPANY
                  Container(
                    color: Colors.white,
                    child: Column(
                      children: [
                        SizedBox(height: size.height * 0.005),
                        Row(
                          children: [
                            SizedBox(width: size.width * 0.04),
                            Text(
                              "About The Company",
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
                            SizedBox(width: size.width * 0.02),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  company != null ? company.name : "Company's name",
                                  style: TextStyle(
                                    fontSize: 16.0,
                                    fontWeight: FontWeight.w500,
                                    color: Colors.black87,
                                  ),
                                ),
                                SizedBox(height: size.height * 0.002),
                                Row(
                                  crossAxisAlignment:
                                      CrossAxisAlignment.center,
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
                                      "10.001 + employees",
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
                        SizedBox(height: size.height * 0.01),
                        Container(
                          width: size.width * 0.86,
                          child: Text(
                            company != null ? company.description : "Description for Company",
                            style: TextStyle(
                              fontSize: 14.0,
                              fontWeight: FontWeight.normal,
                              color: Colors.black87,
                            ),
                          ),
                        ),
                        SizedBox(height: size.height * 0.005),
                      ],
                    ),
                  ),
                  SizedBox(height: size.height * 0.02),
                  //MORE INFORMATION
                  Container(
                    color: white,
                    child: Column(
                      children: [
                        Row(
                          children: [
                            SizedBox(width: size.width * 0.04),
                            Text(
                              "More infomation",
                              style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: size.height * 0.02),
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
                                    image: AssetImage(
                                        'assets/img_facebook.jpeg'),
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              ),
                              SizedBox(width: size.width * 0.04),
                              Text(
                                company != null ? company.facebookUrl != ""
                                    ? company.facebookUrl
                                    : company.name + "'s Facebook" : "Company's Facebook",
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
                        GestureDetector(
                          onTap: () {},
                          child: Row(
                            children: [
                              SizedBox(width: size.width * 0.07),
                              Container(
                                width: size.width * 0.14,
                                height: size.width * 0.14,
                                decoration: BoxDecoration(
                                  image: DecorationImage(
                                    image:
                                        AssetImage('assets/img_linked.jpeg'),
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              ),
                              SizedBox(width: size.width * 0.04),
                              Text(
                                company != null ? company.linkedinUrl != ""
                                    ? company.linkedinUrl
                                    : company.name + "'s LinkedIn" : "Company's LinkedIn",
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
                    width: MediaQuery.of(context).size.width,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.end,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(bottom: 0, right: 15, left: 300),
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
                                        //la61y list mo71i
                                        Navigator.push(
                                          context, 
                                          MaterialPageRoute(
                                          builder: (context) {
                                            return HomeDev(
                                              token: widget.token,
                                              role: widget.role,
                                            );
                                          },
                                        ),
                                        );
                                      },
                                  ),
                                ),
                              );
                            }),
                          ),
                        ),
                      ],
                    ),
                )
              ),
          
          ],
        ),
      ),
    );
  }
}
