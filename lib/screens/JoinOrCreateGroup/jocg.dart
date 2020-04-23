import 'package:avecgroupapp/screens/joinGroup/joinGroup.dart';
import 'package:avecgroupapp/screens/login/login.dart';
import 'package:avecgroupapp/states/currentUser.dart';
import 'package:avecgroupapp/ui/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';

class JOCG extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomPadding: false,
      appBar: AppBar(
        elevation: 0.0,
        backgroundColor: Colors.transparent,
        leading: IconButton(
          icon: Icon(FontAwesomeIcons.arrowLeft),
          color: Colors.black,
          splashColor: themeBlueGreen,
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        actions: <Widget>[
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: FlatButton(
              onPressed: () {},
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30.0)),
              child: Text(
                "Dark",
                style: TextStyle(color: Colors.white, fontSize: 15.0),
              ),
              color: Colors.black,
            ),
          )
        ],
      ),
      body: Column(
        mainAxisSize: MainAxisSize.max,
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.fromLTRB(45.0, 12.0, 0.0, 12.0),
            child: Align(
              alignment: Alignment.centerLeft,
              child: RichText(
                text: TextSpan(
                  children: <TextSpan>[
                    TextSpan(
                        text: "Welcome,",
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 25.0,
                          fontWeight: FontWeight.bold,
                        )),
                    TextSpan(
                        text: "\n Join or Create a Group",
                        style: TextStyle(
                            color: borderColor,
                            fontSize: 15.0,
                            fontWeight: FontWeight.w800))
                  ],
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: SvgPicture.asset(
              "assets/svg/group_hangout.svg",
              alignment: Alignment.topCenter,
              height: MediaQuery.of(context).size.height * 0.33,
              width: MediaQuery.of(context).size.width -
                  (MediaQuery.of(context).size.width * 0.25),
            ),
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              mainAxisSize: MainAxisSize.max,
              children: <Widget>[
                OutlineButton.icon(
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (BuildContext context) => JoinGroup()));
                  },
                  icon: CircleAvatar(
                    foregroundColor: Colors.black,
                    backgroundColor: Colors.transparent,
                    child: Icon(
                      FontAwesomeIcons.userFriends,
                      size: 25.0,
                    ),
                  ),
                  label: Text(
                    "Join A Group",
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 20.0,
                    ),
                  ),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                  borderSide: BorderSide(
                    width: 3.0,
                    color: Colors.black,
                  ),
                  splashColor: themeBlueGreen,
                ),
                SizedBox(
                  height: 25.0,
                ),
                FlatButton.icon(
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (BuildContext context) => JoinGroup()));
                  },
                  color: themeBlueGreen,
                  splashColor: globalPurple,
                  label: Padding(
                    padding: const EdgeInsets.only(top: 10.0, bottom: 10.0),
                    child: Text(
                      "Create A Group",
                      style: TextStyle(color: Colors.white, fontSize: 20.0),
                    ),
                  ),
                  icon: Icon(
                    FontAwesomeIcons.plusCircle,
                    color: Colors.white,
                    size: 25.0,
                  ),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
                FlatButton(
                  onPressed: () async {
                    CurrentUser _currentUser =
                        Provider.of<CurrentUser>(context, listen: false);
                    String returnVal = await _currentUser.signOut();
                    if (returnVal == "success") {
                      Navigator.pushAndRemoveUntil(
                          context,
                          MaterialPageRoute(
                              builder: (BuildContext context) => LogIn()),
                          (route) => false);
                    }
                  },
                  child: Text("Sign Out"),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
