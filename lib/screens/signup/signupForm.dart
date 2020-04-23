import 'package:avecgroupapp/screens/JoinOrCreateGroup/jocg.dart';
import 'package:avecgroupapp/states/currentUser.dart';
import 'package:avecgroupapp/ui/colors.dart';
import 'package:avecgroupapp/ui/textStyles.dart';
import 'package:avecgroupapp/widgets/ourContainer.dart';
import 'package:flutter/material.dart';
import 'package:gradient_widgets/gradient_widgets.dart';
import 'package:provider/provider.dart';

class OurSignUpForm extends StatefulWidget {
  @override
  _OurSignUpFormState createState() => _OurSignUpFormState();
}

class _OurSignUpFormState extends State<OurSignUpForm> {
  TextEditingController _fullNameController = TextEditingController();
  TextEditingController _userNameController = TextEditingController();
  TextEditingController _emailController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();
  TextEditingController _confirmPasswordController = TextEditingController();

  void _signUpUser(String email, String password, BuildContext context) async {
    CurrentUser _currentUser = Provider.of<CurrentUser>(context, listen: false);

    String _returnString = await _currentUser.signUpUser(email, password);

    try {
      if (_returnString == "success") {
        Navigator.push(context,
            MaterialPageRoute(builder: (BuildContext context) => JOCG()));
      }
    } catch (e) {
      Scaffold.of(context).showSnackBar(SnackBar(
                  content: Text(_returnString),
                  duration: Duration(seconds: 2)));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        OurContainer(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              FieldHeading("Enter Fullname"),
              TextFormField(
                decoration: InputDecoration(hintText: "Enter your name"),
                controller: _fullNameController,
              ),
              FieldHeading("Email"),
              TextFormField(
                decoration: InputDecoration(hintText: "Enter Email"),
                keyboardType: TextInputType.emailAddress,
                controller: _emailController,
              ),
              FieldHeading("Password"),
              TextFormField(
                decoration: InputDecoration(hintText: "Create a Password"),
                obscureText: true,
                controller: _passwordController,
              ),
              FieldHeading("Confirm Password"),
              TextFormField(
                decoration: InputDecoration(hintText: "Re-enter Password"),
                obscureText: true,
                controller: _confirmPasswordController,
              ),
              FieldHeading("Create Username"),
              TextFormField(
                decoration: InputDecoration(hintText: "Select unique Username"),
                controller: _userNameController,
              ),
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(top: 14.0),
          child: GradientButton(
            increaseHeightBy: 8.0,
            increaseWidthBy: 108.0,
            callback: () {
              if (_passwordController.text == _confirmPasswordController.text) {
                _signUpUser(
                    _emailController.text, _passwordController.text, context);
              } else {
                Scaffold.of(context).showSnackBar(SnackBar(
                  content: Text("The passwords do not match"),
                  duration: Duration(seconds: 2),
                ));
              }
            },
            child: Text(
              "Create Account",
              style: buttonStyle1,
            ),
            elevation: 0.0,
            gradient: commonGradient,
          ),
        )
      ],
    );
  }
}

class FieldHeading extends StatefulWidget {
  String display;

  FieldHeading(this.display);

  @override
  _FieldHeadingState createState() => _FieldHeadingState();
}

class _FieldHeadingState extends State<FieldHeading> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
        vertical: 20.0,
        horizontal: 8.0,
      ),
      child: Text(
        widget.display,
        style: loginStyle1,
      ),
    );
  }
}
