import 'package:avecgroupapp/screens/signup/signupForm.dart';
import 'package:flutter/material.dart';
import 'package:avecgroupapp/widgets/clipper.dart';

class SignUp extends StatelessWidget {
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
                child: ListView(
                  padding: EdgeInsets.all(20.0),
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Center(
                        child: CircleAvatar(
                          radius: 60.0,
                          backgroundImage:
                              AssetImage("assets/images/Avec/3.png"),
                        ),
                      ),
                    ),
                    OurSignUpForm(),
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
