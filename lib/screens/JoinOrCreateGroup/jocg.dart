import 'package:avecgroupapp/services/routes.dart';
import 'package:avecgroupapp/states/currentUser.dart';
import 'package:avecgroupapp/ui/appThemes.dart';
import 'package:avecgroupapp/ui/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

class JOCG extends StatefulWidget {
  bool shouldShowBackButton;

  JOCG({@required this.shouldShowBackButton});

  @override
  _JOCGState createState() => _JOCGState();
}

class _JOCGState extends State<JOCG> {
  bool checkDarkTheme = true;
  String actionDisplayText = "Dark";

  Color bgColor = Colors.black;
  Color textColor = Colors.white;
  Color subHeadColor = subGrey;

  void toggle() {
    setState(() {
      if (checkDarkTheme == true) {
        actionDisplayText = "Light";
        bgColor = Colors.white;
        textColor = Colors.black;
        subHeadColor = subHeadColorDarkTheme;
      } else {
        actionDisplayText = "Dark";
        bgColor = Colors.black;
        textColor = Colors.white;
        subHeadColor = subGrey;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomPadding: false,
      appBar: AppBar(
        elevation: 0.0,
        backgroundColor: Colors.transparent,
        leading: widget.shouldShowBackButton == true
            ? IconButton(
                icon: Icon(FontAwesomeIcons.arrowLeft),
                color: Colors.black,
                splashColor: themeBlueGreen,
                onPressed: () {
                  Navigator.pop(context);
                },
              )
            : null,
        actions: <Widget>[
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Consumer<ThemeNotifier>(
              builder: (context, value, child) {
                return FlatButton(
                  onPressed: () {
                    // value.toggleTheme();
                    // checkDarkTheme = !checkDarkTheme;
                    // toggle();
                  },
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30.0)),
                  child: Text(
                    actionDisplayText,
                    style: TextStyle(color: textColor, fontSize: 15.0),
                  ),
                  color: bgColor,
                );
              },
            ),
          )
        ],
      ),
      body: Column(
        mainAxisSize: MainAxisSize.max,
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.fromLTRB(25.0, 12.0, 0.0, 12.0),
            child: Align(
              alignment: Alignment.centerLeft,
              child: RichText(
                text: TextSpan(
                  children: <TextSpan>[
                    TextSpan(
                        text: "Welcome,",
                        style: TextStyle(
                          color: bgColor,
                          fontSize: 25.0,
                          fontWeight: FontWeight.bold,
                        )),
                    TextSpan(
                        text: "\n Join or Create a Group",
                        style: TextStyle(
                            color: subHeadColor,
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
                    Navigator.pushNamed(context, OurRoutes.joinGroupId);
                  },
                  icon: CircleAvatar(
                    backgroundColor: Colors.transparent,
                    child: Icon(
                      FontAwesomeIcons.userFriends,
                      color: bgColor,
                      size: 25.0,
                    ),
                  ),
                  label: Text(
                    "Join A Group",
                    style: TextStyle(
                      color: bgColor,
                      fontSize: 20.0,
                    ),
                  ),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                  borderSide: BorderSide(
                    width: 3.0,
                    color: bgColor,
                  ),
                  splashColor: themeBlueGreen,
                ),
                SizedBox(
                  height: 25.0,
                ),
                FlatButton.icon(
                  onPressed: () {
                    Navigator.pushNamed(context, OurRoutes.createGroupId);
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
                      Navigator.pushNamedAndRemoveUntil(
                          context, OurRoutes.logInId, (route) => false);
                    }
                  },
                  child: Text(
                    "Sign Out",
                    style: TextStyle(color: bgColor),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
