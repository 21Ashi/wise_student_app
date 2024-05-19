import 'package:flutter/material.dart';
import 'package:wise_student_app/generated/l10n.dart';
import 'package:wise_student_app/widget/NotiWidgets/noti_user.dart';

class Noti extends StatelessWidget {
  const Noti({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 2,
        shadowColor: Colors.black38,
        backgroundColor: Theme.of(context).colorScheme.background,
        surfaceTintColor: Theme.of(context).colorScheme.background,
        title: Text(
          S.of(context).NotificationTitle,
          style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(top: 10, right: 16),
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            Padding(
              padding: const EdgeInsets.only(left: 16, top: 10),
              child: Text(
                S.of(context).Today,
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 12,
                    color: Theme.of(context).colorScheme.primary),
              ),
            ),
            const SizedBox(height: 15),
            NotiUser(
              imagePath: 'assets/user1.png',
              senderName: S.of(context).Sender,
              messageText: S.of(context).Message,
              timestamp: S.of(context).Time,
            ),
            const SizedBox(
              height: 10,
            ),
            Container(
              height: 0.5,
              width: MediaQuery.sizeOf(context).width,
              decoration: const BoxDecoration(color: Colors.black26),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 16, top: 10),
              child: Text(
                S.of(context).Yesterday,
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 12,
                  color: Theme.of(context).colorScheme.primary,
                ),
              ),
            ),
            const SizedBox(height: 15),
            NotiUser(
                imagePath: 'assets/user1.png',
                senderName: S.of(context).SenderName,
                messageText: S.of(context).MessageText,
                timestamp: S.of(context).Timestamp),
            const SizedBox(
              height: 10,
            ),
            Container(
              height: 0.5,
              width: MediaQuery.sizeOf(context).width,
              decoration: const BoxDecoration(color: Colors.black26),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 16, top: 10),
              child: Text(
                S.of(context).LastWeek,
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 12,
                  color: Theme.of(context).colorScheme.primary,
                ),
              ),
            ),
            const SizedBox(height: 15),
            NotiUser(
                imagePath: 'assets/user1.png',
                senderName: S.of(context).SenderName,
                messageText: S.of(context).MessageText,
                timestamp: S.of(context).Timestamp),
            const SizedBox(
              height: 20,
            ),
            NotiUser(
                imagePath: 'assets/user1.png',
                senderName: S.of(context).SenderName,
                messageText: S.of(context).MessageText,
                timestamp: S.of(context).Timestamp),
            const SizedBox(
              height: 20,
            ),
            NotiUser(
                imagePath: 'assets/user1.png',
                senderName: S.of(context).SenderName,
                messageText: S.of(context).MessageText,
                timestamp: S.of(context).Timestamp),
            const SizedBox(
              height: 20,
            ),
            NotiUser(
                imagePath: 'assets/user1.png',
                senderName: S.of(context).SenderName,
                messageText: S.of(context).MessageText,
                timestamp: S.of(context).Timestamp),
            const SizedBox(
              height: 20,
            ),
            NotiUser(
                imagePath: 'assets/user1.png',
                senderName: S.of(context).SenderName,
                messageText: S.of(context).MessageText,
                timestamp: S.of(context).Timestamp),
            const SizedBox(height: 10),
            Padding(
              padding: const EdgeInsets.only(left: 16, top: 10),
              child: Text(
                S.of(context).LastMonth,
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 12,
                  color: Theme.of(context).colorScheme.primary,
                ),
              ),
            ),
            const SizedBox(height: 15),
            NotiUser(
                imagePath: 'assets/user1.png',
                senderName: S.of(context).SenderName,
                messageText: S.of(context).MessageText,
                timestamp: S.of(context).Timestamp),
            const SizedBox(
              height: 20,
            ),
            NotiUser(
                imagePath: 'assets/user1.png',
                senderName: S.of(context).SenderName,
                messageText: S.of(context).MessageText,
                timestamp: S.of(context).Timestamp),
            const SizedBox(
              height: 20,
            ),
            NotiUser(
                imagePath: 'assets/user1.png',
                senderName: S.of(context).SenderName,
                messageText: S.of(context).MessageText,
                timestamp: S.of(context).Timestamp),
            const SizedBox(
              height: 20,
            ),
            NotiUser(
                imagePath: 'assets/user1.png',
                senderName: S.of(context).SenderName,
                messageText: S.of(context).MessageText,
                timestamp: S.of(context).Timestamp),
            const SizedBox(
              height: 20,
            ),
            NotiUser(
                imagePath: 'assets/user1.png',
                senderName: S.of(context).SenderName,
                messageText: S.of(context).MessageText,
                timestamp: S.of(context).Timestamp),
          ]),
        ),
      ),
    );
  }
}

class YourScrollableContent extends StatelessWidget {
  const YourScrollableContent({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: 20,
      itemBuilder: (context, index) {
        return ListTile(
          title: Text('Item $index'),
        );
      },
    );
  }
}
