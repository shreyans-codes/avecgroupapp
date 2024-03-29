import 'package:avecgroupapp/screens/login/loginForm.dart';
import 'package:avecgroupapp/screens/signup/signup.dart';
import 'package:avecgroupapp/ui/textStyles.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:avecgroupapp/widgets/clipper.dart';

class LogIn extends StatelessWidget {
  //* UI aspect of the login screen
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //resizeToAvoidBottomPadding: false,
      body: Stack(
        children: <Widget>[
          CustomBackgroundDrop(),
          Column(
            mainAxisSize: MainAxisSize.max,
            children: <Widget>[
              Expanded(
                  flex: 1,
                  child: Center(
                    child: CircleAvatar(
                      radius: 60.0,
                      backgroundColor: Colors.transparent,
                      backgroundImage: AssetImage("assets/images/Avec/4.png"),
                    ),
                  )),
              Expanded(
                flex: 2,
                child: ListView(
                  padding: EdgeInsets.all(20.0),
                  children: <Widget>[
                    OurLoginForm(),
                    SizedBox(
                      height: 40.0,
                    ),
                    Center(
                      child: RichText(
                          text: TextSpan(
                        style: signUpStyle1,
                        children: <TextSpan>[
                          TextSpan(text: "New User? "),
                          TextSpan(
                            text: "Sign Up",
                            style: signUpStyleLink,
                            recognizer: TapGestureRecognizer()
                              ..onTap = () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (BuildContext context) =>
                                            SignUp()));
                              },
                          ),
                        ],
                      )),
                    )
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
