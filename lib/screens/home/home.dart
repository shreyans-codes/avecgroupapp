import 'package:avecgroupapp/screens/home/groupScreen/groupPage.dart';
import 'package:avecgroupapp/screens/home/updatesScreen/updatesPage.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        children: <Widget>[
          GroupPage(),
          UpdatesPage(),
        ],
      ),
    );
  }
}