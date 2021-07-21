import 'package:flutter/material.dart';
import 'package:tindev/theme/colors.dart';
import 'package:tindev/components/add_image_profile.dart';

class AccountPageAddMedia extends StatefulWidget {
  @override
  _AccountPageAddMediaState createState() => _AccountPageAddMediaState();
}

class _AccountPageAddMediaState extends State<AccountPageAddMedia> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: grey.withOpacity(0.2),
      body: getBody(),
    );
  }

  Widget getBody() {

    var size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(color: Colors.black),
        title: Text(
          'Add media',
          style: TextStyle(
            color: Colors.black,
          ),
        ),
        backgroundColor: white,
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
                  SizedBox(height: size.height * 0.05),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      AddImageProfile(),
                      AddImageProfile(),
                      AddImageProfile()
                    ],
                  ),
                  SizedBox(height: size.height * 0.02),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      AddImageProfile(),
                      AddImageProfile(),
                      AddImageProfile()
                    ],
                  ),
                  SizedBox(height: size.height * 0.02),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      AddImageProfile(),
                      AddImageProfile(),
                      AddImageProfile()
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
