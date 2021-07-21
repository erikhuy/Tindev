import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:tindev/data/binding_dev.dart';
import 'package:tindev/data/dislikes_json.dart';
import 'package:tindev/data/icons.dart';
import 'package:tindev/data/likes_json.dart';
import 'package:tindev/page/home_company.dart';
import 'package:tindev/theme/colors.dart';
import 'package:tindev/components/hero_dialog_route.dart';
import 'package:tindev/components/custom_rect_tween.dart';

class LikesPage extends StatefulWidget {
  @override
  _LikesPageState createState() => _LikesPageState();
}

class _LikesPageState extends State<LikesPage> {
  int pageIndex = -1;
  List itemTemp = [];
  List itemTempDislike = [];

  List itemBinding = [];

  @override
  void initState() {
    super.initState();
    setState(() {
      itemTemp = likes_json;
      itemTempDislike = dislikes_json;
      itemBinding = binding_json;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: white,
      body: getBody(),
      // bottomSheet: getFooter(),
      // bottomSheet: getBottom(),
    );
  }

  Widget getBody() {
    var size = MediaQuery.of(context).size;
    return DefaultTabController(
      length: 3,
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
                        padding: EdgeInsets.all(8.0),
                        child: Text(
                          "Asign Job",
                          style: TextStyle(
                            color: black.withOpacity(0.5),
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
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
            ListView(
              padding: EdgeInsets.only(bottom: 90),
              children: [
                SizedBox(
                  height: 10,
                ),
                Divider(
                  thickness: 0.8,
                ),
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
                                          onPressed: () {
                                            
                                          }),
                                    ),
                                  );
                                }),
                              ),
                            ),
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
                                  ]),
                            ),
                          ],
                        ),
                      );
                    }),
                  ),
                ),
              ],
            ),
            ListView(
              padding: EdgeInsets.only(bottom: 90),
              children: [
                // Container(
                //   padding: EdgeInsets.only(top: 20),
                //   width: size.width * 0.8,
                //   height: size.width * 0.26,
                //   child: Text(
                //     'Asign Job',
                //     textAlign: TextAlign.center,
                //     style: new TextStyle(
                //         fontSize: 54.0,
                //         fontWeight: FontWeight.w900,
                //         foreground: Paint()
                //           ..shader = LinearGradient(
                //             colors: <Color>[Colors.blue[200], Colors.blue[600]],
                //           ).createShader(Rect.fromLTWH(0.0, 0.0, 200.0, 70.0))),
                //   ),
                // ),
                Padding(
                  padding: const EdgeInsets.only(left: 5, right: 5),
                  child: Wrap(
                    spacing: 5,
                    runSpacing: 5,
                    children: List.generate(itemBinding.length, (index) {
                      return GestureDetector(
                          onTap: () {
                            Navigator.of(context)
                                .push(HeroDialogRoute(builder: (context) {
                              return _AddTodoPopupCard();
                            }));
                          },
                          child: Hero(
                            tag: 'add-todo-hero',
                            createRectTween: (begin, end) {
                              return CustomRectTween(begin: begin, end: end);
                            },
                            child: Container(
                              width: (size.width - 15) / 2,
                              height: 250,
                              child: Stack(
                                children: [
                                  Container(
                                    width: (size.width - 15) / 2,
                                    height: 250,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(10),
                                      image: DecorationImage(
                                          image: AssetImage(
                                              itemBinding[index]['img']),
                                          fit: BoxFit.cover),
                                    ),
                                  ),
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
                                            ],
                                          ),
                                        )
                                      ],
                                    ),
                                  ),
                                  Positioned(
                                    bottom: 8,
                                    left: 8,
                                    child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Container(
                                            child: Text(
                                              itemBinding[index]['job_type'],
                                              style: TextStyle(color: white),
                                            ),
                                          ),
                                          Container(
                                            child: Text(
                                              itemBinding[index]['name'],
                                              style: TextStyle(color: white),
                                              textAlign: TextAlign.left,
                                            ),
                                          )
                                        ]),
                                  ),
                                ],
                              ),
                            ),
                          ));
                    }),
                  ),
                ),
              ],
            ),
            ListView(
              padding: EdgeInsets.only(bottom: 90),
              children: [
                SizedBox(
                  height: 10,
                ),
                Divider(
                  thickness: 0.8,
                ),
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
                                  itemTempDislike[index]['active']
                                      ? Padding(
                                          padding: const EdgeInsets.only(
                                              left: 8, bottom: 224),
                                          child: Row(
                                            children: [
                                              Container(
                                                width: 8,
                                                height: 8,
                                                decoration: BoxDecoration(
                                                    color: green,
                                                    shape: BoxShape.circle),
                                              ),
                                              SizedBox(
                                                width: 5,
                                              ),
                                              Text(
                                                "Active",
                                                style: TextStyle(
                                                  color: white,
                                                  fontSize: 14,
                                                ),
                                              ),
                                            ],
                                          ),
                                        )
                                      : Padding(
                                          padding: const EdgeInsets.only(
                                              left: 8, bottom: 224),
                                          child: Row(
                                            children: [
                                              Container(
                                                width: 8,
                                                height: 8,
                                                decoration: BoxDecoration(
                                                    color: grey,
                                                    shape: BoxShape.circle),
                                              ),
                                              SizedBox(
                                                width: 5,
                                              ),
                                              Text(
                                                "Offline",
                                                style: TextStyle(
                                                  color: white,
                                                  fontSize: 14,
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
                      );
                    }),
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}

class _AddTodoPopupCard extends StatefulWidget {
  _AddTodoPopupCardState createState() => _AddTodoPopupCardState();
}

class _AddTodoPopupCardState extends State<_AddTodoPopupCard> {
  String recruitment = '';
  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(64.0),
        child: Hero(
          tag: 'add-todo-hero',
          createRectTween: (begin, end) {
            return CustomRectTween(begin: begin, end: end);
          },
          child: Material(
            color: Colors.white,
            elevation: 2,
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
            child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Container(
                      width: width * 0.8,
                      height: width * 0.1,
                      child: Text(
                        "Choose Recruitment",
                        style: TextStyle(
                            color: Colors.blue,
                            fontSize: 24,
                            fontWeight: FontWeight.w700),
                      ),
                    ),
                    ListTile(
                      title: const Text('Design Website'),
                      leading: Radio(
                        value: "1",
                        groupValue: recruitment,
                        onChanged: (value) {
                          setState(() {
                            recruitment = value;
                          });
                        },
                      ),
                    ),
                    ListTile(
                      title: const Text('Database'),
                      leading: Radio(
                        value: "2",
                        groupValue: recruitment,
                        onChanged: (value) {
                          setState(() {
                            recruitment = value;
                          });
                        },
                      ),
                    ),
                    FlatButton(
                      onPressed: () {},
                      child: const Text(
                        'Sent',
                        style: TextStyle(
                            color: Colors.blue,
                            fontSize: 16,
                            fontWeight: FontWeight.w500),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
