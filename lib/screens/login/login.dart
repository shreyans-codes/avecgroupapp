import 'package:avecgroupapp/screens/login/loginForm.dart';
import 'package:avecgroupapp/screens/signup/signup.dart';
import 'package:avecgroupapp/ui/colors.dart';
import 'package:avecgroupapp/ui/textStyles.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:avecgroupapp/widgets/clipper.dart';

class LogIn extends StatelessWidget {
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
                      backgroundColor: Colors.black,
                    ),
                  )),
              Expanded(
                flex: 3,
                child: ListView(
                  padding: EdgeInsets.all(20.0),
                  children: <Widget>[
                    OurLoginForm(),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(35.0, 8.0, 35.0, 8.0),
                      child: OutlineButton(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30.0),
                        ),
                        color: globalPurple,
                        splashColor: globalPurple,
                        onPressed: () {},
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: <Widget>[
                            Icon(
                              Icons.gif,
                              color: globalPurple,
                            ),
                            Padding(
                              padding: const EdgeInsets.only(left: 15.0),
                              child: Text(
                                "Login with Google",
                                style: buttonStyle2,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    Center(
                      child: RichText(
                          text: TextSpan(
                        style: signUpStyle1,
                        children: <TextSpan>[
                          TextSpan(text: "New User? "),
                          TextSpan(text: "Sign Up", style: signUpStyleLink,
                          recognizer: TapGestureRecognizer()
                          ..onTap = () {
                            Navigator.push(context, MaterialPageRoute(builder: (BuildContext context) => SignUp()));
                          }),
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
