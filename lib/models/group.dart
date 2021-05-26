import 'package:cloud_firestore/cloud_firestore.dart';

class OurGroup {
  String? code;
  String? name;
  String? groupId;
  List<String>? members;
  Timestamp? groupCreated;
  String? leader;
  String? password;

  OurGroup(
      {this.code,
      this.name,
      this.groupId,
      this.members,
      this.groupCreated,
      this.leader,
      this.password});
}
