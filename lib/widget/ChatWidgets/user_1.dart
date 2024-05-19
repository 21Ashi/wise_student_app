import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:wise_student_app/models/message_model.dart';
import 'package:wise_student_app/models/room_model.dart';
import 'package:wise_student_app/widget/ChatWidgets/Chat/chat_card.dart';

class UserListItem extends StatefulWidget {
  const UserListItem({super.key});

  @override
  State<UserListItem> createState() => _UserListItemState();
}

class _UserListItemState extends State<UserListItem> {
  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: FirebaseFirestore.instance
          .collection('ChatRooms')
          .where('members',
              arrayContains: FirebaseAuth.instance.currentUser!.uid)
          .snapshots(),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          List<ChatRoom> items = snapshot.data!.docs
              .map((e) => ChatRoom.fromJson(e.data()))
              .toList()
            ..sort(
              (a, b) => b.lastMessageTime!.compareTo(a.lastMessageTime!),
            );
          return ListView.builder(
            itemCount: items.length,
            itemBuilder: (context, index) {
              return ChatCard(
                messageItem: Message(
                  id: '',
                  toId: '',
                  fromId: '',
                  msg: '',
                  type: '',
                  createdAt: '',
                  read: '',
                  message: '',
                ),
                item: items[index],
              );
            },
          );
        } else {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }
      },
    );
  }
}
