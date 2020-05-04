import 'package:avecgroupapp/ui/colors.dart';
import 'package:flutter/material.dart';

class GroupPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisSize: MainAxisSize.max,
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
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
          SizedBox(
            height: 15.0,
          ),
          GroupField(context),
        ],
      ),
    );
  }
}

Widget GroupField(BuildContext context) {
  return Container(
    child: Padding(
      padding: const EdgeInsets.all(12.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              CircleAvatar(
                child: CircleAvatar(
                  radius: 80.0,
                  backgroundImage: AssetImage("assets/images/jaipur.jpg"),
                ),
              ),
              SizedBox(
                width: 10.0,
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    "The Artists",
                    style: Theme.of(context).textTheme.headline,
                  ),
                  Text(
                    "Amit: Check my new painting",
                    style: Theme.of(context)
                        .textTheme
                        .subhead
                        .copyWith(fontSize: 12.0),
                  ),
                ],
              )
            ],
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: <Widget>[
              Text(
                "12:45",
                style: TextStyle(color: Colors.black),
              ),
              Container(
                decoration: BoxDecoration(
                    color: themeBlueGreen,
                    borderRadius: BorderRadius.circular(25.0)),
                child: Text(
                  "2 New",
                  style: Theme.of(context).textTheme.caption,
                ),
              )
            ],
          )
        ],
      ),
    ),
  );
}
