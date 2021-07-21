import 'package:flutter_svg/svg.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:tindev/models/ComAcc.dart';
import 'package:tindev/models/DevList.dart';
import 'package:tindev/models/JobList.dart';
import 'package:tindev/page/HomePage/AccountPage/account_page_com.dart';
import 'package:tindev/page/HomePage/ChatPage/chat_page.dart';
import 'package:tindev/page/HomePage/ExplorePage/explore_page_com.dart';
import 'package:tindev/page/HomePage/LikesPage/likes_page.dart';
import 'package:tindev/services/CompanyServies.dart';
import 'package:tindev/services/DevsServices.dart';
import 'package:tindev/services/JobRecServices.dart';

class HomeCom extends StatefulWidget {
  final String token;
  final String role;

  const HomeCom({Key key, this.role, this.token}) : super(key: key);

  @override
  _RootCompState createState() => _RootCompState();
}

class _RootCompState extends State<HomeCom> {
  int pageIndex = 0;

  CompanyClass company;
  List<JobRec> listJobRec;
  List<Developer> listDev;

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
    CompanyServices.getCompanyInfo(widget.token).then((com) {
      if (com != null) {
        setState(() {
          company = com;
        });
      } else {
        print("error from companyServices");
      }
    });
    JobRecServices.getListJobRecOfCom(widget.token).then((list) {
      if (list != null) {
        setState(() {
          listJobRec = list;
        });
      } else {
        print("error from jobRecServices");
      }
    });
    DevsServices.getListDevs(widget.token).then((list) {
      if (list != null) {
        setState(() {
          listDev = list;
        });
      } else {
        print("error from devsServices");
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
    return WillPopScope(
      onWillPop: _onBackPressed,
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          automaticallyImplyLeading: false,
          backgroundColor: Colors.white,
          elevation: 0,
          title: Padding(
            padding: const EdgeInsets.only(left: 10, right: 10),
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
        ExplorePageCom(
          listDev: listDev,
          token: widget.token,
          role: widget.role,
        ),
        LikesPage(
          role: widget.role,
        ),
        ChatPage(
          role: widget.role,
        ),
        AccountPageCom(
          token: widget.token,
          com: company,
          listJobRec: listJobRec,
        ),
      ],
    );
  }
}
