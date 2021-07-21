import 'package:flutter_svg/svg.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'account_page.dart';
import 'chat_page.dart';
import 'explore_page.dart';
import 'likes_page.dart';
import 'liked_page.dart';

class HomeDeveloper extends StatefulWidget {
  @override
  _RootDevState createState() => _RootDevState();
}

class _RootDevState extends State<HomeDeveloper> {
  int pageIndex = 0;

  @override
  Widget build(BuildContext context) {
    List bottomItems = [
      pageIndex == 0
          ? 'assets/Tindev_active.svg'
          : 'assets/Tindev.svg',
      pageIndex == 1
        ? 'assets/likes_active_icon.svg'
        : 'assets/likes_icon.svg',
      pageIndex == 2
        ? 'assets/chat_active_icon.svg'
        : 'assets/chat_icon.svg',
      pageIndex == 3
        ? 'assets/account_active_icon.svg'
        : 'assets/account_icon.svg',
    ];
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Colors.white,
        elevation: 0,
        title: Padding(
          padding: const EdgeInsets.only(left: 10, right: 10),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: List.generate(bottomItems.length, (index) {
              return IconButton(
                onPressed: () {
                  setState(() {
                    pageIndex = index;
                  });
                },
                icon: SvgPicture.asset(
                  bottomItems[index],
                ),
              );
            }),
          ),
        ),
      ),
      body: getBody(),
    );
  }

  Widget getBody() {
    return IndexedStack(
      index: pageIndex,
      children: [
        ExplorePage(),
        LikesPage(),
        ChatPage(),
        AccountPage(),
        LikedPage()],
    );
  }
}
