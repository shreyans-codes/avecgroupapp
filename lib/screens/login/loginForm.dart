import 'package:avecgroupapp/screens/JoinOrCreateGroup/jocg.dart';
import 'package:avecgroupapp/states/currentUser.dart';
import 'package:avecgroupapp/ui/colors.dart';
import 'package:avecgroupapp/ui/textStyles.dart';
import 'package:avecgroupapp/widgets/ourContainer.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:gradient_widgets/gradient_widgets.dart';
import 'package:provider/provider.dart';

class OurLoginForm extends StatefulWidget {
  @override
  _OurLoginFormState createState() => _OurLoginFormState();
}

//* The two types log in we provide
enum LoginType {
  email,
  google,
}

class _OurLoginFormState extends State<OurLoginForm> {
  TextEditingController _emailController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();

  void _logInUser(
      {required LoginType type,
      String? email,
      String? password,
      required BuildContext context}) async {
    //* Instance of Current User
    CurrentUser _currentUser = Provider.of<CurrentUser>(context, listen: false);
    String? _returnString;

    //* Based on "type" we call different functions
    switch (type) {
      case LoginType.email:
        _returnString = await _currentUser.logInUser(email!, password!);
        break;
      case LoginType.google:
        _returnString = await _currentUser
            .logInUserWithGoogle(context)
            .catchError((onError) {
          Get.snackbar("Error encountered", onError.toString());
        });
        break;
      default:
    }

    try {
      if (_returnString == "success") {
        Navigator.of(context).push(MaterialPageRoute(
            builder: (BuildContext context) => JOCG(
                  shouldShowBackButton: false,
                )));
      }
    } catch (e) {
      final snackbar = SnackBar(content: Text(e.toString()));
      ScaffoldMessenger.of(context).showSnackBar(snackbar);
    }
  }

  @override
  Widget build(BuildContext context) {
    return OurContainer(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Padding(
            padding: EdgeInsets.symmetric(
              vertical: 20.0,
              horizontal: 8.0,
            ),
            child: Text(
              "Email",
              style: loginStyle1,
            ),
          ),
          TextFormField(
            decoration: InputDecoration(hintText: "Enter Email"),
            keyboardType: TextInputType.emailAddress,
            controller: _emailController,
          ),
          Padding(
            padding: EdgeInsets.symmetric(
              vertical: 20.0,
              horizontal: 8.0,
            ),
            child: Text(
              "Password",
              style: loginStyle1,
            ),
          ),
          TextFormField(
            decoration: InputDecoration(hintText: "Enter Password"),
            controller: _passwordController,
          ),
          Padding(
            padding: const EdgeInsets.only(top: 14.0),
            child: GradientButton(
              increaseHeightBy: 8.0,
              increaseWidthBy: 108.0,
              callback: () {
                if (_passwordController.text != null &&
                    _emailController.text != null) {
                  _logInUser(
                      type: LoginType.email,
                      email: _emailController.text,
                      password: _passwordController.text,
                      context: context);
                } else {
                  Get.snackbar("Error", "Please enter something in the fields",
                      duration: Duration(seconds: 2));
                }
              },
              child: Text(
                "Log In",
                style: buttonStyle1,
              ),
              elevation: 0.0,
              gradient: commonGradient,
            ),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(35.0, 8.0, 35.0, 8.0),
            child: OutlinedButton.icon(
              style: OutlinedButton.styleFrom(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30.0),
                ),
                backgroundColor: Colors.white,
                //splashColor: globalPurple,
              ),
              onPressed: () {
                _logInUser(type: LoginType.google, context: context);
              },
              icon: Icon(
                FontAwesomeIcons.google,
              ),
              label: Text(
                "Login with Google",
                style: buttonStyle2,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
