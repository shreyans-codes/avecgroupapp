import 'package:avecgroupapp/models/userModel.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class OurDatabase {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<String> createUser(OurUser newUser) async {
    String retVal = "error";

    try {
      await _firestore.collection("users").doc(newUser.uid).set({
        'fullName': newUser.fullName,
        'email': newUser.email,
        'status': newUser.status,
        'accountCreated': Timestamp.now(),
//        'profilePic': newUser.profilePicUrl
      });
      retVal = "success";
    } catch (e) {
      retVal = e.message;
    }
    return retVal;
  }

  Future<OurUser> getUserInfo(String uid) async {
    OurUser retUser = OurUser();

    try {
      DocumentSnapshot<Map<String, dynamic>> _docSnapshot =
          await _firestore.collection('users').doc(uid).get();
      retUser.uid = uid;
      retUser.fullName = _docSnapshot.data()['fullName'];
      retUser.email = _docSnapshot.data()['email'];
      retUser.status = _docSnapshot.data()['status'];
      retUser.accountCreated = _docSnapshot.data()['accountCreated'];
      retUser.groupId = _docSnapshot.data()['groupId'];
      //retUser.groups = _docSnapshot.data()['groups'];
    } catch (e) {
      print(e);
    }
    return retUser;
  }

  static String groupId;
  Future<String> createGroup(
      {String groupName, String userId, String userName}) async {
    String retVal = "error";
    List<String> members = List();
    try {
      members.add(userId);
      DocumentReference _docReference =
          await _firestore.collection("group").add({
        'name': groupName,
        'leader': userId,
        'leaderName': userName,
        'members': members,
        'groupCreated': Timestamp.now(),
      });

      await _firestore.collection("users").doc(userId).update({
        'groups': FieldValue.arrayUnion([_docReference.id]),
      });
      groupId = _docReference.id.toString();
      retVal = "success";
    } catch (e) {
      retVal = e.message;
    }
    return retVal;
  }

  static String groupJoinId;
  Future<String> joinGroup({String groupId, String userId}) async {
    String retVal = "error";

    try {
      await _firestore.collection("group").doc(groupId).update({
        'members': FieldValue.arrayUnion([userId]),
      });
      await _firestore.collection("users").doc(userId).update({
        'groupId': groupId,
      });
      // await _firestore.collection("users").document(userId).updateData({
      //   'groups': FieldValue.arrayUnion([groupId]),
      // }); //* For later
      groupJoinId =
          groupId; // * This is so that we can add the Group's detail in the group home screen
      retVal = "success";
    } catch (e) {
      retVal = e.message;
    }
    return retVal;
  }
}
