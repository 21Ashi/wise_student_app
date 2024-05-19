import 'package:flutter/material.dart';
import 'package:wise_student_app/Screens/Chat/chat_call.dart';
import 'package:wise_student_app/models/message_model.dart';
import 'package:wise_student_app/models/user_model.dart';
import 'package:wise_student_app/widget/ChatWidgets/Chat/chat_bar.dart';
import 'package:wise_student_app/widget/ChatWidgets/Chat/message_card.dart';
import 'package:get/get.dart';

class ChatPage extends StatelessWidget {
  final String roomId;
  final Std student;
  final Message messageItem;
  const ChatPage(
      {super.key,
      Key? skey,
      required this.roomId,
      required this.student,
      required this.messageItem});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        unFocusKeyboard(context);
      },
      child: Scaffold(
        extendBodyBehindAppBar: true,
        appBar: AppBar(
          leading: InkWell(
              onTap: () {
                Navigator.pop(context);
              },
              child: const Icon(Icons.arrow_back_ios_new)),
          backgroundColor: Colors.transparent,
          actions: [
            Padding(
              padding: const EdgeInsets.only(left: 16, right: 16),
              child: Row(
                children: [
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
            ),
          ],
        ),
        body: Column(
          children: [
            Container(
              height: 120, // Adjust the height here
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                  color: Theme.of(context).colorScheme.background,
                  boxShadow: const [
                    BoxShadow(color: Colors.black12, offset: Offset(0, 2))
                  ]),
              child: Padding(
                padding: const EdgeInsets.only(right: 50, left: 50, top: 50),
                child: Row(
                  crossAxisAlignment:
                      CrossAxisAlignment.center, // Adjust the alignment here
                  children: [
                    Image.asset('assets/user1.png',
                        height: 60, width: 60), // Adjust the image size
                    const SizedBox(width: 20),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          student.fname!,
                          style: const TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 16, // Adjust the font size
                          ),
                        ),
                        const SizedBox(height: 4),
                        Text(
                          student.lastActivated!,
                          style: TextStyle(
                            fontSize: 12, // Adjust the font size
                            color: Theme.of(context).colorScheme.secondary,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            MessageCard(messageItem: messageItem, roomId: roomId),
            ChatBar(
              roomId: roomId,
              student: student,
              suffix: null,
            ),
          ],
        ),
      ),
    );
  }
}

void unFocusKeyboard(BuildContext context) {
  FocusScopeNode currentFocus = FocusScope.of(context);
  if (!currentFocus.hasPrimaryFocus) {
    currentFocus.unfocus();
  }
}