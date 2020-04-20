import 'package:flutter/material.dart';
import 'package:avecgroupapp/widgets/clipper.dart';

class LogIn extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: <Widget>[
          
            ClipPath(
            clipper: MyClipper(),
            child: Container(
              width: double.infinity,
              height: MediaQuery.of(context).size.height / 2,
              decoration: BoxDecoration(
                  gradient: LinearGradient(
                colors: [
                  Color.fromARGB(255, 0, 191, 166),
                  Color.fromARGB(255, 171, 158, 239)
                ],
                begin: Alignment.topLeft,
                end: Alignment.topRight,
              )),
            ),
          ),
        ],
      ),
    );
  }
}
