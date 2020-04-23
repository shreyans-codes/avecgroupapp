import 'package:avecgroupapp/screens/JoinOrCreateGroup/jocg.dart';
import 'package:avecgroupapp/screens/login/login.dart';
import 'package:avecgroupapp/states/currentUser.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

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

  @override
  void didChangeDependencies() async {
    super.didChangeDependencies();

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

    switch (_authStatus) {
      case AuthStatus.notLoggedIn:
      returnWidet = LogIn();
        break;
      case AuthStatus.loggedIn:
      returnWidet = JOCG();
      break;
      default:
    }
    return Container(
    );
  }
}