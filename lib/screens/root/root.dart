import 'package:avecgroupapp/screens/JoinOrCreateGroup/jocg.dart';
import 'package:avecgroupapp/screens/home/home.dart';
import 'package:avecgroupapp/screens/loadingSplashScreen/loadingScreen.dart';
import 'package:avecgroupapp/screens/login/login.dart';
import 'package:avecgroupapp/states/currentUser.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

//* The four states our users can be in
enum AuthStatus {
  unknown,
  notLoggedIn,
  inGroup,
  notInGroup,
}

//* The unknown AuthStatus is basically while we various things,
//* we can show a loading screen

class OurRoot extends StatefulWidget {
  static String rootRouteName = 'rootPage';
  @override
  _OurRootState createState() => _OurRootState();
}

class _OurRootState extends State<OurRoot> {
  AuthStatus _authStatus = AuthStatus.unknown;

  //*This gets called whenever there is a change in any of things we depend upon
  @override
  void didChangeDependencies() async {
    super.didChangeDependencies();

    //*We get the state, check if the user is logged in "yet" or not.
    //*Once the user is logged in, this will always show the home page, else Log In page
    CurrentUser _currentUser = Provider.of<CurrentUser>(context, listen: false);
    String _result = await _currentUser.onStartUp();
    if (_result == "success") {
      print(_currentUser.getCurrentUser.groups);
      if (_currentUser.getCurrentUser.groups != null) {
        setState(() {
          _authStatus = AuthStatus.inGroup;
        });
      } else {
        setState(() {
          _authStatus = AuthStatus.notInGroup;
        });
      }
    } else {
      setState(() {
        _authStatus = AuthStatus.notLoggedIn;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    Widget returnWidet;

    //* Based on authStatus, the user's initial screen is decided
    switch (_authStatus) {
      case AuthStatus.unknown:
        returnWidet = LoadingScreen();
        break;
      case AuthStatus.notLoggedIn:
        returnWidet = LogIn();
        break;
      case AuthStatus.notInGroup:
        returnWidet = JOCG(
          shouldShowBackButton: false,
        );
        break;
      case AuthStatus.inGroup:
        returnWidet = HomeScreen();
        break;
      default:
    }
    return returnWidet;
  }
}
