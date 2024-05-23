import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:wise_student_app/Screens/Chat/chat_page.dart';
import 'package:wise_student_app/models/message_model.dart';
import 'package:wise_student_app/models/room_model.dart';
import 'package:wise_student_app/models/user_model.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:get/get.dart';

class ChatCard extends StatefulWidget {
  final ChatRoom item;
  final Message messageItem;

  const ChatCard({super.key, required this.item, required this.messageItem});

  @override
  State<ChatCard> createState() => _ChatCardState();
}

class _ChatCardState extends State<ChatCard> {
  Stream<DocumentSnapshot>? _stream;

  @override
  void initState() {
    super.initState();
    String? userId = widget.item.members?.firstWhere(
      (element) => element != FirebaseAuth.instance.currentUser!.uid,
      orElse: () => null,
    );
    if (userId != null) {
      _stream = FirebaseFirestore.instance
          .collection('students')
          .doc(userId)
          .snapshots();
    }
  }

  @override
  Widget build(BuildContext context) {
    String? userId = widget.item.members?.firstWhere(
      (element) => element != FirebaseAuth.instance.currentUser!.uid,
      orElse: () => null,
    );
    return StreamBuilder(
        stream: _stream != null
            ? FirebaseFirestore.instance
                .collection('students')
                .doc(userId)
                .snapshots()
            : null,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            Std student = Std.fromJson(snapshot.data!.data()!);
            return Slidable(
              endActionPane: ActionPane(
                motion: const StretchMotion(),
                children: [
                  SlidableAction(
                    onPressed: (context) => _onDeletePressed(),
                    backgroundColor: Colors.red,
                    icon: Icons.delete,
                  ),
                ],
              ),
              child: Card(
                child: ListTile(
                  onTap: () {
                    Get.to(() => ChatPage(
                          student: student,
                          roomId: widget.item.id!,
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
                    backgroundColor: Colors.transparent,
                    radius: 25,
                    backgroundImage: AssetImage('assets/user1.png'),
                  ),
                  title: Text(
                    snapshot.data!['fname'],
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                    ),
                  ),
                  subtitle: Text(
                    widget.item.lastMessage! == ""
                        ? student.lastActivated!
                        : widget.item.lastMessage!,
                    style: const TextStyle(
                      color: Colors.grey,
                      fontSize: 14,
                    ),
                  ),
                  trailing: StreamBuilder(
                    stream: FirebaseFirestore.instance
                        .collection('ChatRooms')
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
                        return const CircularProgressIndicator(); // Handle loading state
                      }
                    },
                  ),
                ),
              ),
            );
          } else {
            return Container(); // Handle case where data doesn't exist or snapshot is null
          }
        });
  }

  void _onDeletePressed() {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: const Text('Chat Deleted'),
        action: SnackBarAction(
          label: 'Undo',
          onPressed: () {
            // Implement undo functionality here
          },
        ),
      ),
    );
  }
}
