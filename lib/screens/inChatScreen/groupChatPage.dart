import 'package:avecgroupapp/models/message.dart';
import 'package:avecgroupapp/services/messageDatabase.dart';
import 'package:avecgroupapp/states/currentUser.dart';
import 'package:avecgroupapp/ui/colors.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void sendMessage(String text, BuildContext context) async {
  CurrentUser _currentUser = Provider.of<CurrentUser>(context, listen: false);

  MessageModel messageModel = MessageModel();
  messageModel.text = text;
  messageModel.userId = _currentUser.getCurrentUser.uid;
  messageModel.userName = _currentUser.getCurrentUser.fullName;
  messageModel.toGroup = _currentUser.getCurrentUser.groupId;

  String result =
      await MessageDatabase().writeMessage(messageModel: messageModel);
  if (result == "success") {
    GroupChatPage.controller.clear();
  }
}

class GroupChatPage extends StatelessWidget {
  static TextEditingController controller = TextEditingController();

  Firestore _firestore = Firestore.instance;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          leading: IconButton(icon: Icon(Icons.arrow_back), onPressed: () {
            Navigator.pushNamedAndRemoveUntil(context, 'jocg', (route) => false);
          }),
          title: Text("College Buddies"),
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            StreamBuilder<QuerySnapshot>(
              stream: _firestore.collection("message").snapshots(),
              builder: (context, snapshot) {
                if (!snapshot.hasData) {
                  return CupertinoActivityIndicator();
                }
                final messageList = snapshot.data.documents;
                List<MessageType1> messageBubbleList = [];
                for (var message in messageList) {
                  final messageText = message.data['text'];
                  final messageSender = message.data['sender'];
                  final messageTime = message.data['timeStamp'];

                  final individualMessage = MessageType1(
                    message: messageText,
                    sender: messageSender,
                    timestamp: messageTime,
                  );

                  messageBubbleList.add(individualMessage);
                }
                return Expanded(
                  child: ListView(
                    children: messageBubbleList,
                  ),
                );
              },
            ),
            TypeBox(context, controller),
          ],
        ),
      ),
    );
  }
}

Widget TypeBox(BuildContext context, TextEditingController messageController) {
  return TextFormField(
    decoration: InputDecoration(
      border: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.black),
          borderRadius: BorderRadius.circular(25)),
      hintText: "Type Message...",
      suffixIcon: IconButton(
        icon: Icon(Icons.send),
        onPressed: () {
          sendMessage(messageController.text, context);
        },
        color: Colors.blue,
      ),
    ),
    controller: messageController,
  );
}

class MessageType1 extends StatelessWidget {
  String sender;
  String message;
  Timestamp timestamp;
  MessageType1({this.message, this.sender, this.timestamp});

  String convertTime(DateTime timestamp) {
    String inHourAndScecond = timestamp.hour.toString() + ":" + timestamp.minute.toString();
    return inHourAndScecond;
  }
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  sender,
                  style:
                      Theme.of(context).textTheme.body2.copyWith(fontSize: 20),
                ),
              ),
              MessageBox(message, context),
            ],
          ),
          Text(convertTime(timestamp.toDate()))
          // RoundedContainerWithBorder(
          //   child: Padding(
          //     padding: const EdgeInsets.all(8.0),
          //     child: Text(
          //       "Accepted: 4",
          //       style: TextStyle(color: Colors.black),
          //     ),
          //   ),
          // ),
        ],
      ),
    );
  }
}

Widget MessageBox(String text, BuildContext context) {
  return Container(
    decoration: BoxDecoration(
      color: subGrey,
      borderRadius: BorderRadius.circular(15.0),
    ),
    child: Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        children: <Widget>[
          Text(
            text,
            style: TextStyle(color: Colors.white, fontSize: 20),
          ),
          // Padding(
          //   padding: const EdgeInsets.all(8.0),
          //   child: CircleAvatar(
          //     backgroundColor: Colors.orange,
          //     radius: 10,
          //   ),
          // ),
        ],
      ),
    ),
  );
}

class RoundedContainerWithBorder extends StatelessWidget {
  Widget child;

  RoundedContainerWithBorder({this.child});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15.0),
        border: Border.all(color: Colors.black),
      ),
      child: child,
    );
  }
}
