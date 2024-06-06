import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:wise_student_app/models/group_model.dart';
import 'package:wise_student_app/models/message_model.dart';
import 'package:wise_student_app/models/user_model.dart';
import 'package:wise_student_app/widget/ChatWidgets/Group/group_screen.dart';

class GroupCard extends StatefulWidget {
  final ChatGroup item;
  final Message messageItem;

  const GroupCard({super.key, required this.item, required this.messageItem});

  @override
  State<GroupCard> createState() => _GroupCardState();
}

class _GroupCardState extends State<GroupCard> {
  @override
  Widget build(BuildContext context) {
    String? userId = widget.item.members?.firstWhere(
      (element) => element != FirebaseAuth.instance.currentUser!.uid,
      orElse: () => null,
    );
    return StreamBuilder(
        stream: userId != null
            ? FirebaseFirestore.instance
                .collection('students')
                .doc(userId)
                .snapshots()
            : null,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            Std student = Std.fromJson(snapshot.data!.data()!);
            ChatGroup chatGroup = ChatGroup.fromJson(snapshot.data!.data()!);
            return Card(
              child: ListTile(
                onTap: () {
                  Get.to(() => GroupPage(
                        chatGroup: chatGroup,
                        student: student,
                        groupId: widget.item.id!,
                        messageItem: Message(
                            id: '',
                            toId: '',
                            fromId: '',
                            msg: '',
                            type: '',
                            createdAt: '',
                            read: '',
                            message: ''),
                      ));
                },
                leading: const CircleAvatar(
                  backgroundColor: Colors.green,
                  radius: 25,
                ),
                title: Text(
                  widget.item.name!,
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                  ),
                ),
                subtitle: Text(
                  widget.item.lastMessage! == ""
                      ? "send first message"
                      : widget.item.lastMessage!,
                  style: const TextStyle(
                    color: Colors.grey,
                    fontSize: 14,
                  ),
                ),
                trailing: StreamBuilder(
                  stream: FirebaseFirestore.instance
                      .collection('groups')
                      .doc(widget.item.id)
                      .collection('messages')
                      .snapshots(),
                  builder: (context, snapshot) {
                    if (snapshot.hasData) {
                      final unReadList = snapshot.data!.docs
                          .map((e) => Message.fromJson(e.data()))
                          .where((element) => element.read == "")
                          .where((element) =>
                              element.fromId !=
                              FirebaseAuth.instance.currentUser!.uid);
                      return unReadList.isNotEmpty
                          ? Badge(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 12),
                              largeSize: 30,
                              label: Text(unReadList.length.toString()),
                            )
                          : Text(widget.item.lastMessageTime.toString());
                    } else {
                      return const CircularProgressIndicator();
                    }
                  },
                ),
              ),
            );
          } else {
            return Container();
          }
        });
  }
}
