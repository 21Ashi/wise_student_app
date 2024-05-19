import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:wise_student_app/models/group_model.dart';
import 'package:wise_student_app/models/message_model.dart';
import 'package:wise_student_app/widget/ChatWidgets/Group/group_card.dart';

class GroupListItem extends StatefulWidget {
  const GroupListItem({
    super.key,
  });
  @override
  State<GroupListItem> createState() => _GroupListItemState();
}

class _GroupListItemState extends State<GroupListItem> {
  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: FirebaseFirestore.instance
          .collection('groups')
          .where('members',
              arrayContains: FirebaseAuth.instance.currentUser!.uid)
          .snapshots(),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          List<ChatGroup> items = snapshot.data!.docs
              .map((e) => ChatGroup.fromJson(e.data()))
              .toList()
            ..sort(
              (a, b) => b.lastMessageTime!.compareTo(a.lastMessageTime!),
            );
          return ListView.builder(
              itemCount: items.length,
              itemBuilder: (context, index) {
                return GroupCard(
                  messageItem: Message(
                      id: '',
                      toId: '',
                      fromId: '',
                      msg: '',
                      type: '',
                      createdAt: '',
                      read: '',
                      message: ''),
                  item: items[index],
                );
              });
        } else {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }
      },
    );
  }
}
