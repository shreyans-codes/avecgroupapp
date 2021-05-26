import 'package:avecgroupapp/models/message.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class MessageDatabase {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<String?> writeMessage({required MessageModel messageModel}) async {
    String? retVal = "error";
    try {
      await _firestore.collection("message").add({
        'senderId': messageModel.userId,
        'sender': messageModel.userName,
        'groupId': messageModel.toGroup,
        'text': messageModel.text,
        'timeStamp': Timestamp.now(),
      });
      retVal = "success";
    } catch (e) {
      retVal = e.toString();
    }
    return retVal;
  }
}
