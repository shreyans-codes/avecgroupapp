import 'package:cloud_firestore/cloud_firestore.dart';

class OurUser {
  String fullName;
  String email;
  String status;
  String uid;
  // String profilePicUrl;
  Timestamp accountCreated;
  String groupId;
  //List groups;

  OurUser(
      {this.fullName,
      this.email,
      this.status,
      this.uid,
      // this.profilePicUrl,
      this.accountCreated,
      this.groupId,
      //this.groups,
      });
}
