import 'package:avecgroupapp/screens/JoinOrCreateGroup/jocg.dart';
import 'package:avecgroupapp/screens/createGroup/createGroup.dart';
import 'package:avecgroupapp/screens/home/home.dart';
import 'package:avecgroupapp/screens/inChatScreen/groupChatPage.dart';
import 'package:avecgroupapp/screens/joinGroup/joinGroup.dart';
import 'package:avecgroupapp/screens/loadingSplashScreen/loadingScreen.dart';
import 'package:avecgroupapp/screens/login/login.dart';
import 'package:avecgroupapp/screens/root/root.dart';
import 'package:avecgroupapp/screens/signup/signup.dart';
import 'package:avecgroupapp/services/routes.dart';
import 'package:avecgroupapp/states/currentUser.dart';
import 'package:avecgroupapp/ui/appThemes.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
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
          builder: (BuildContext context, ThemeNotifier value, Widget? child) {
            return MaterialApp(
              debugShowCheckedModeBanner: false,
              theme: value.isDarkTheme! ? darkTheme : lightTheme,
              home: OurRoot(),
              routes: {
                OurRoutes.rootId: (context) => OurRoot(),
                OurRoutes.logInId: (context) => LogIn(),
                OurRoutes.signUpId: (context) => SignUp(),
                OurRoutes.jocgId: (context) =>
                    JOCG(shouldShowBackButton: false),
                OurRoutes.createGroupId: (context) => CreateGroup(),
                OurRoutes.joinGroupId: (context) => JoinGroup(),
                OurRoutes.loadingScreenId: (context) => LoadingScreen(),
                OurRoutes.homePageId: (context) => HomeScreen(),
                OurRoutes.inChatScreen: (context) => GroupChatPage(),
              }, // * This checks if we were previously logged in
            );
          },
        ),
      ),
    );
  }
}
