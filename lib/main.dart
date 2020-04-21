import 'package:avecgroupapp/states/currentUser.dart';
import 'package:avecgroupapp/ui/ourTheme.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'screens/login/login.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => CurrentUser(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: OurTheme().buildTheme(),
        home: LogIn(),
      ),
    );
  }
}
