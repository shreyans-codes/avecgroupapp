import 'package:avecgroupapp/screens/home/home.dart';
import 'package:avecgroupapp/states/currentUser.dart';
import 'package:avecgroupapp/ui/colors.dart';
import 'package:avecgroupapp/ui/textStyles.dart';
import 'package:avecgroupapp/widgets/ourContainer.dart';
import 'package:flutter/material.dart';
import 'package:gradient_widgets/gradient_widgets.dart';
import 'package:provider/provider.dart';

class OurLoginForm extends StatefulWidget {
  @override
  _OurLoginFormState createState() => _OurLoginFormState();
}

class _OurLoginFormState extends State<OurLoginForm> {
  TextEditingController _emailController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();

  void _logInUser(String email, String password, BuildContext context) async {
    CurrentUser _currentUser = Provider.of<CurrentUser>(context, listen: false);

    try {
      if (await _currentUser.logInUser(email, password)) {
        Navigator.push(context,
            MaterialPageRoute(builder: (BuildContext context) => HomeScreen()));
      }
    } catch (e) {
      print(e);
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
                      _emailController.text, _passwordController.text, context);
                } else {
                  Scaffold.of(context).showSnackBar(SnackBar(
                    content: Text("Please enter something in the fields"),
                    duration: Duration(seconds: 2),
                  ));
                }
              },
              child: Text(
                "Log In",
                style: buttonStyle1,
              ),
              elevation: 0.0,
              gradient: commonGradient,
            ),
          )
        ],
      ),
    );
  }
}
