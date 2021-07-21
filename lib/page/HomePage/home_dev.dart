import 'package:flutter_svg/svg.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:tindev/models/DevAcc.dart';
import 'package:tindev/models/Education.dart';
import 'package:tindev/models/JobList.dart';
import 'package:tindev/page/HomePage/AccountPage/account_page_dev.dart';
import 'package:tindev/page/HomePage/ChatPage/chat_page.dart';
import 'package:tindev/services/EducationServices.dart';
import 'package:tindev/page/HomePage/ExplorePage/explore_page_dev.dart';
import 'package:tindev/page/HomePage/LikesPage/likes_page.dart';
import 'package:tindev/services/DeveloperServices.dart';
import 'package:tindev/services/JobRecServices.dart';

class HomeDev extends StatefulWidget {
  final String token;
  final String role;

  const HomeDev({Key key, this.role, this.token}) : super(key: key);

  @override
  _HomeDevState createState() => _HomeDevState();
}

class _HomeDevState extends State<HomeDev> {
  int pageIndex = 0;
  String userID;
  DeveloperClass developer;
  List<JobRec> listJob;
  List<EducationElement> listEdu;

 

  Future<bool> _onBackPressed() {
    return showDialog(
          context: context,
          builder: (context) {
            return AlertDialog(
              title: Text('Confirm'),
              content: Text('Do you want to exit the App'),
              actions: <Widget>[
                // ignore: deprecated_member_use
                FlatButton(
                  child: Text('No'),
                  onPressed: () {
                    Navigator.of(context).pop(false); //Will not exit the App
                  },
                ),
                // ignore: deprecated_member_use
                FlatButton(
                  child: Text('Yes'),
                  onPressed: () {
                    Navigator.of(context).pop(true); //Will exit the App
                  },
                )
              ],
            );
          },
        ) ??
        false;
  }

  @override
  void initState() {
    super.initState();
    DeveloperServices.getDeveloperInfo(widget.token).then((dev) {
      if (dev != null) {
        setState(() {
          developer = dev;
          userID = developer.userId;
        });
      } else {
        print("error from developerServices");
      }
    });
    JobRecServices.getListJobRecForDev(widget.token).then((list) {
      if (list != null) {
        setState(() {
          listJob = list;
        });
      } else {
        print("error from jobsServices");
      }
    });
    EducationServices.getListEdu(userID).then((list) {
      if (list != null) {
        setState(() {
          listEdu = list;
        });
      } else {
        print("error from educationServices");
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    List headerItems = [
      pageIndex == 0 ? 'assets/Tindev_active.svg' : 'assets/Tindev.svg',
      pageIndex == 1 ? 'assets/likes_active_icon.svg' : 'assets/likes_icon.svg',
      pageIndex == 2 ? 'assets/chat_active_icon.svg' : 'assets/chat_icon.svg',
      pageIndex == 3
          ? 'assets/account_active_icon.svg'
          : 'assets/account_icon.svg',
    ];
    return new WillPopScope(
      onWillPop: _onBackPressed,
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          automaticallyImplyLeading: false,
          backgroundColor: Colors.white,
          elevation: 0,
          title: Padding(
            padding: const EdgeInsets.only(
              left: 10,
              right: 10,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: List.generate(
                headerItems.length,
                (index) => IconButton(
                  onPressed: () {
                    setState(() {
                      pageIndex = index;
                    });
                  },
                  icon: SvgPicture.asset(
                    headerItems[index],
                  ),
                ),
              ),
            ),
          ),
        ),
        body: getBody(),
      ),
    );
  }

  Widget getBody() {
    return IndexedStack(
      index: pageIndex,
      children: [
        ExplorePageDev(
          token: widget.token,
          listJob: listJob,
          role: widget.role,
        ),
        LikesPage(
          role: widget.role,
        ),
        ChatPage(
          role: widget.role,
        ),
        AccountPageDev(
          token: widget.token,
          dev: developer,
          listEdu: listEdu,
        ),
      ],
    );
  }
}
