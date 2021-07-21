import 'package:flutter/material.dart';
import 'package:tindev/theme/colors.dart';

class AccountPageSetting extends StatefulWidget {
  @override
  _AccountPageSettingState createState() => _AccountPageSettingState();
}

class _AccountPageSettingState extends State<AccountPageSetting> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: grey.withOpacity(0.2),
      body: getBody(),
    );
  }

  Widget getBody() {
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(
          color: Colors.black
        ),
        title: Text(
          'Setting',
          style: TextStyle(
            color: Colors.black,
          ),
        ),
        backgroundColor: white,
      ),
      body: Center(
        child: Text('Setting'),
      ),
    );
  }
}