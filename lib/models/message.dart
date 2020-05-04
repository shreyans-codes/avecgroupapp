import 'package:cloud_firestore/cloud_firestore.dart';

class MessageModel {
  String text;
  String toGroup;
  String userId;
  String userName;
  //Timestamp timestamp;
  // bool isEvent;
  // num eventNo;

  MessageModel({
    this.text,
    this.toGroup,
    this.userId,
    this.userName,
    //this.timestamp,
    // this.isEvent,
    // this.eventNo,
  });
}
