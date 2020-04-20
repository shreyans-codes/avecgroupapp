import 'package:avecgroupapp/screens/login/loginForm.dart';
import 'package:avecgroupapp/ui/colors.dart';
import 'package:flutter/material.dart';
import 'package:avecgroupapp/widgets/clipper.dart';

class LogIn extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: <Widget>[
          CustomBackgroundDrop(),
          Padding(
            padding: const EdgeInsets.only(
              top: 200.0,
            ),
            child: ListView(
              padding: EdgeInsets.all(20.0),
              children: <Widget>[OurLoginForm()],
            ),
          ),
        ],
      ),
    );
  }
}

class CustomBackgroundDrop extends StatelessWidget {
  const CustomBackgroundDrop({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ClipPath(
      clipper: MyClipper(),
      child: Container(
        width: double.infinity,
        height: MediaQuery.of(context).size.height / 1.5,
        decoration: BoxDecoration(
          gradient: commonGradient,
        ),
      ),
    );
  }
}
