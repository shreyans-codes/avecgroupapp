import 'package:avecgroupapp/ui/ourTheme.dart';
import 'package:flutter/material.dart';
import 'screens/login/login.dart';
void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: OurTheme().buildTheme(),
      home: LogIn(),
    );
  }
}