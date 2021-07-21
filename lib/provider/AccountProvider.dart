import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tindev/models/Account.dart';
import 'package:tindev/page/HomePage/home_com.dart';
import 'package:tindev/page/HomePage/home_dev.dart';

class AccountProvider extends StatelessWidget {
  final String token;
  final dynamic account;

  const AccountProvider({Key key, this.account, this.token}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Account accountData = new Account();
    accountData = Account.fromJson(account);
    if (accountData.role == 'Developer') {
      return Provider<Account>(
        create: (_) => accountData,
        child: HomeDev(
          token: token,
          role: accountData.role,
        ),
      );
    } else {
      return Provider<Account>(
        create: (_) => accountData,
        child: HomeCom(
          token: token,
          role: accountData.role,
        ),
      );
    }
  }
}
