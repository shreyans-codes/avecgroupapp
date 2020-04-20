import 'package:avecgroupapp/ui/colors.dart';
import 'package:avecgroupapp/ui/textStyles.dart';
import 'package:avecgroupapp/widgets/ourContainer.dart';
import 'package:flutter/material.dart';
import 'package:gradient_widgets/gradient_widgets.dart';

class OurLoginForm extends StatelessWidget {
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
              "Username",
              style: loginStyle1,
            ),
          ),
          TextFormField(
            decoration: InputDecoration(hintText: "Enter Username"),
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
          ),
          Padding(
            padding: const EdgeInsets.only(
              top: 14.0
            ),
            child: GradientButton(
              increaseHeightBy: 8.0,
              increaseWidthBy: 108.0,
              callback: () {}, 
            child: Text(
              "Log In",
              style: buttonStyle1,
            ),
            elevation: 0.0,
            gradient: commonGradient,),
          )
        ],
      ),
    );
  }
}
