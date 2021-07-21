import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:tindev/data/dislikes_company_json.dart';
import 'package:tindev/data/dislikes_dev_json.dart';
import 'package:tindev/data/icons.dart';
import 'package:tindev/data/likes_company_json.dart';
import 'package:tindev/data/likes_dev_json.dart';
import 'package:tindev/page/HomePage/ExplorePage/Detail/dev_title_detail.dart';
import 'package:tindev/page/HomePage/ExplorePage/Detail/job_tittle_detail.dart';

import 'package:tindev/theme/colors.dart';

class LikesPage extends StatefulWidget {
  final String role;
  const LikesPage({Key key, @required this.role}) : super(key: key);
  @override
  _LikesPageState createState() => _LikesPageState();
}

class _LikesPageState extends State<LikesPage> {
  int pageIndex = -1;
  //2 lists likes and dislikes for role = dev
  List itemTemp = [];
  List itemTempDislike = [];
  //list of Assign job for dev
  // List itemBinding = [];

  @override
  void initState() {
    super.initState();
    setState(() {
      // print(widget.role);
      //check role company or dev
      if (widget.role == "Developer"){
        itemTemp = likes_company_json;
        itemTempDislike = dislikes_company_json;
      }else if (widget.role == "Company"){
        itemTemp = likes_dev_json;
        itemTempDislike = dislikes_dev_json;
        // itemBinding = binding_json;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
    backgroundColor: white,
    body: getBody()
    );
  }

  Widget getBody() {
    var size = MediaQuery.of(context).size;
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: PreferredSize(
          preferredSize: Size.fromHeight(kToolbarHeight),
          child: Container(
            child: SafeArea(
              child: Column(
                children: <Widget>[
                  Expanded(child: Container()),
                  TabBar(
                    tabs: <Widget>[
                      Container(
                        padding: EdgeInsets.all(8.0),
                        child: Text(
                          itemTemp.length.toString() + " Likes",
                          style: TextStyle(
                              color: black.withOpacity(0.5),
                              fontSize: 18,
                              fontWeight: FontWeight.bold),
                        ),
                      ), 
                      Container(                      
                        child: Text(
                          "Watch Again",
                          style: TextStyle(
                            color: black.withOpacity(0.5),
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
        body: TabBarView(
          children: <Widget>[
            //List Likes View
            ListView(
              padding: EdgeInsets.only(bottom: 90),
              children: [
                SizedBox(height: 10,),
                Divider(thickness: 0.8,),
                Padding(
                  padding: const EdgeInsets.only(left: 5, right: 5),
                  child: Wrap(
                    spacing: 5,
                    runSpacing: 5,
                    children: List.generate(itemTemp.length, (index) {
                      return Container(
                        width: (size.width - 15) / 2,
                        height: 250,
                        child: Stack(
                          children: [
                            //Imnage
                            Container(
                              width: (size.width - 15) / 2,
                              height: 250,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                image: DecorationImage(
                                    image: AssetImage(itemTemp[index]['img']),
                                    fit: BoxFit.cover),
                              ),
                            ),
                            //Lam mo tren
                            Positioned(
                              bottom: 0,
                              child: Container(
                                width: (size.width - 15) / 2,
                                height: 100,
                                decoration: BoxDecoration(
                                    gradient: LinearGradient(
                                        begin: Alignment.topCenter,
                                        end: Alignment.bottomCenter,
                                        colors: [
                                      Colors.transparent,
                                      Colors.black87,
                                    ],
                                  ),
                                ),
                              ),
                            ),
                            //Lam mo duoi
                            Positioned(
                              top: 0,
                              child: Container(
                                width: (size.width - 15) / 2,
                                height: 50,
                                decoration: BoxDecoration(
                                    gradient: LinearGradient(
                                        begin: Alignment.bottomCenter,
                                        end: Alignment.topCenter,
                                        colors: [
                                      Colors.transparent,
                                      Colors.black54,
                                    ],
                                    ),
                                    ),
                              ),
                            ),
                            //Job Title
                            Container(
                              width: (size.width - 15) / 2,
                              height: 250,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                gradient: LinearGradient(
                                  colors: [
                                    black.withOpacity(0.25),
                                    black.withOpacity(0)
                                  ],
                                  end: Alignment.topCenter,
                                  begin: Alignment.bottomCenter),
                              ),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.only(
                                        left: 8, bottom: 224),
                                    child: Row(
                                      children: [
                                        Icon(
                                          Icons.check_circle_outlined,
                                          color: Colors.yellow[600],
                                          size: 20,
                                        ),
                                        SizedBox(
                                          width: 5,
                                        ),
                                        Text(
                                          itemTemp[index]['job_applied'],
                                          style: TextStyle(
                                            color: white,
                                            fontSize: 14,
                                          ),
                                        ),
                                      ],
                                    ),
                                  )
                                ],
                              ),
                            ),
                            //Ison like and dislike
                            Positioned(
                              bottom: 0,
                              right: 8,
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                // crossAxisAlignment: CrossAxisAlignment.start,
                                children:
                                    List.generate(item_icons.length, (index) {
                                      return Container(
                                        margin: EdgeInsets.only(bottom: 8),
                                        width: 32,
                                        height: 32,
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
                                                width: item_icons[index]
                                                    ['icon_size'],
                                              ),
                                              onPressed: () {}),
                                        ),
                                      );
                                    },
                                ),
                              ),
                            ),
                            //Job_type and Name of dev or com
                            Positioned(
                              bottom: 8,
                              left: 8,
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Container(
                                    child: Text(
                                      itemTemp[index]['job_type'],
                                      style: TextStyle(color: white),
                                    ),
                                  ),
                                  Container(
                                    child: Text(
                                      itemTemp[index]['name'],
                                      style: TextStyle(color: white),
                                      textAlign: TextAlign.left,
                                    ),
                                  )
                                ],
                              ),
                            ),
                            // Navigator on Image with 2 role (dev or com)
                            GestureDetector(
                              onTap: () {
                                if (widget.role == "Developer"){
                                  Navigator.push(context,
                                    MaterialPageRoute(
                                      builder: (context) =>   
                                          JobTitleDetail(index: index, checkRole: true, isLike: "like"),            
                                    ),
                                  );     
                                }else if (widget.role == "Company"){
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) =>
                                        DevTitleDetail(index: index, isLike: "like"),
                                    ),
                                  ); 
                                }
                              },
                            ),
                          ],
                        ),
                      );
                    }),
                  ),
                ),
              ],
            ),
            //List DisLikes View
             ListView(
              padding: EdgeInsets.only(bottom: 90),
              children: [
                SizedBox( height: 10,),
                Divider(thickness: 0.8,),
                Padding(
                  padding: const EdgeInsets.only(left: 5, right: 5),
                  child: Wrap(
                    spacing: 5,
                    runSpacing: 5,
                    children: List.generate(itemTempDislike.length, (index) {
                      return Container(
                        width: (size.width - 15) / 2,
                        height: 250,
                        child: Stack(
                          children: [
                            //Image
                            Container(
                              width: (size.width - 15) / 2,
                              height: 250,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                image: DecorationImage(
                                    image: AssetImage(
                                        itemTempDislike[index]['img']),
                                    fit: BoxFit.cover),
                              ),
                            ),
                            //lam mo tren
                            Positioned(
                              bottom: 0,
                              child: Container(
                                width: (size.width - 15) / 2,
                                height: 100,
                                decoration: BoxDecoration(
                                    gradient: LinearGradient(
                                        begin: Alignment.topCenter,
                                        end: Alignment.bottomCenter,
                                        colors: [
                                      Colors.transparent,
                                      Colors.black87,
                                    ])),
                              ),
                            ),
                            //lam mo duoi
                            Positioned(
                              top: 0,
                              child: Container(
                                width: (size.width - 15) / 2,
                                height: 50,
                                decoration: BoxDecoration(
                                    gradient: LinearGradient(
                                        begin: Alignment.bottomCenter,
                                        end: Alignment.topCenter,
                                        colors: [
                                      Colors.transparent,
                                      Colors.black54,
                                    ])),
                              ),
                            ),
                            //Icon like and Dislikes
                            Positioned(
                              bottom: 0,
                              right: 8,
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children:
                                  List.generate(item_icons.length, (index) {
                                    return Container(
                                      margin: EdgeInsets.only(bottom: 8),
                                      width: 32,
                                      height: 32,
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
                                              width: item_icons[index]
                                                  ['icon_size'],
                                            ),
                                            onPressed: () {}),
                                      ),
                                    );
                                  }),
                              ),
                            ),
                            //JobTypes
                            Positioned(
                              bottom: 8,
                              left: 8,
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Container(
                                    child: Text(
                                      itemTempDislike[index]['job_type'],
                                      style: TextStyle(color: white),
                                    ),
                                  ),
                                  Container(
                                    child: Text(
                                      itemTempDislike[index]['name'],
                                      style: TextStyle(color: white),
                                      textAlign: TextAlign.left,
                                    ),
                                  )
                                ]),
                            ),
                            //Navigator on Image with 2 role (dev or com)
                            GestureDetector(
                              onTap: () {
                                if (widget.role == "Developer"){
                                   Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) =>   
                                        JobTitleDetail(index: index, checkRole: true, isLike: "dislike",),            
                                  ),
                                  );     
                                }else if (widget.role == "Company"){
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) =>
                                        DevTitleDetail(index: index, isLike: "dislike",),
                                    ),
                                  ); 
                                }
                              },
                            )
                          ],
                        ),
                      );
                    }),
                  ),
                ),
              ],
            ),
          
          ],
        ),
      ),
    );
  }
}

