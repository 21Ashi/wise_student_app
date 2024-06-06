import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:wise_student_app/Screens/Chat/chat_call.dart';
import 'package:wise_student_app/models/group_model.dart';
import 'package:wise_student_app/models/message_model.dart';
import 'package:wise_student_app/models/user_model.dart';

import 'package:wise_student_app/widget/ChatWidgets/Group/group_bar.dart';
import 'package:wise_student_app/widget/ChatWidgets/Group/message_card.dart';

class GroupPage extends StatelessWidget {
  final ChatGroup chatGroup;
  final String groupId;
  final Std student;
  final Message messageItem;
  const GroupPage(
      {super.key,
      Key? skey,
      required this.groupId,
      required this.student,
      required this.messageItem,
      required this.chatGroup});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: InkWell(
            onTap: () {
              Navigator.pop(context);
            },
            child: const Icon(Icons.arrow_back_ios_new)),
        actions: [
          Padding(
            padding: const EdgeInsets.only(left: 16, right: 16, top: 5),
            child: Row(
              children: [
                const CircleAvatar(
                  backgroundColor: Colors.green,
                  radius: 25,
                ),
                const SizedBox(width: 10),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      chatGroup.name! == "" ? "freinds" : chatGroup.name!,
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 16, // Adjust the font size
                      ),
                    ),
                    Text(
                      chatGroup.name! == ""
                          ? "Hala, nile, ali"
                          : chatGroup.name!,
                      style: const TextStyle(
                        fontSize: 16,
                      ),
                    ),
                  ],
                ),
                const SizedBox(width: 90),
                InkWell(
                  onTap: () {
                    Get.to(() => const ChatCall());
                  },
                  child: Icon(
                    Icons.call_outlined,
                    size: 32,
                    color: Theme.of(context).colorScheme.primary,
                  ),
                ),
                const SizedBox(width: 10),
                InkWell(
                  onTap: () {
                    Get.to(() => const ChatCall());
                  },
                  child: Icon(
                    Icons.videocam_outlined,
                    size: 32,
                    color: Theme.of(context).colorScheme.primary,
                  ),
                ),
              ],
            ),
          )
        ],
      ),
      body: Column(
        children: [
          GroupMessageCard(
            groupId: groupId,
            messageItem: messageItem,
          ),
          GroupBar(
            student: student,
            suffix: null,
            chatGroup: chatGroup,
            groupId: groupId,
          ),
        ],
      ),
    );
  }
}
