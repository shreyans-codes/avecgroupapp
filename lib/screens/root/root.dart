import 'package:avecgroupapp/screens/JoinOrCreateGroup/jocg.dart';
import 'package:avecgroupapp/screens/login/login.dart';
import 'package:avecgroupapp/states/currentUser.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

//* The two states our users can be in
enum AuthStatus{
  notLoggedIn,
  loggedIn
}

class OurRoot extends StatefulWidget {
  @override
  _OurRootState createState() => _OurRootState();
}

class _OurRootState extends State<OurRoot> {
  AuthStatus _authStatus = AuthStatus.notLoggedIn;

  //*This gets called whenever there is a change in any of things we depend upon
  @override
  void didChangeDependencies() async {
    super.didChangeDependencies();

    //*We get the state, check if the user is logged in "yet" or not.
    //*Once the user is logged in, this will always show the home page, else Log In page
    CurrentUser _currentUser = Provider.of<CurrentUser>(context, listen: false);
    String _result = await _currentUser.onStartUp();
    if(_result=="success")
    {
      setState(() {
        _authStatus = AuthStatus.loggedIn;
      });
    }
  }
  @override
  Widget build(BuildContext context) {
    Widget returnWidet;
    
    //* Based on authStatus, the user's initial screen is decided
    switch (_authStatus) {
      case AuthStatus.notLoggedIn:
      returnWidet = LogIn();
        break;
      case AuthStatus.loggedIn:
      returnWidet = JOCG();
      break;
      default:
    }
    return returnWidet;
  }
}