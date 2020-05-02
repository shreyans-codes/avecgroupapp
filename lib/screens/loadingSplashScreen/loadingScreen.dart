import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class LoadingScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Text(
              "Loading",
              style: TextStyle(
                  color: Colors.black38,
                  fontSize: 25.0,
                  fontWeight: FontWeight.bold),
            ),
            CupertinoActivityIndicator()
          ],
        ),
      ),
    );
  }
}
