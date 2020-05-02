import 'package:avecgroupapp/screens/root/root.dart';
import 'package:avecgroupapp/states/currentUser.dart';
import 'package:avecgroupapp/ui/appThemes.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => CurrentUser(),
      child: ChangeNotifierProvider(
        create: (_) => ThemeNotifier(),
        child: Consumer<ThemeNotifier>(
          builder: (BuildContext context, ThemeNotifier value, Widget child) {
            return MaterialApp(
              debugShowCheckedModeBanner: false,
              theme: value.isDarkTheme ? darkTheme : lightTheme,
              home: OurRoot(),
              routes: {
                OurRoot.rootRouteName : (context) => OurRoot(),
              }, // * This checks if we were previously logged in
            );
          },
        ),
      ),
    );
  }
}
