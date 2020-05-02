import 'package:flutter/material.dart';

class GroupPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisSize: MainAxisSize.max,
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              Text(
                "Groups",
                style: Theme.of(context).textTheme.display2,
              ),
              Text(
                "Updates",
                style: Theme.of(context).textTheme.display1,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
