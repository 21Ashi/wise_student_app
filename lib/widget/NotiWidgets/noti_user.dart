import 'package:flutter/material.dart';

class NotiUser extends StatelessWidget {
  final String imagePath;
  final String senderName;
  final String messageText;
  final String timestamp;

  const NotiUser({
    Key? key,
    required this.imagePath,
    required this.senderName,
    required this.messageText,
    required this.timestamp,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 12),
      child: Row(
        children: [
          Image.asset(imagePath),
          const SizedBox(width: 10),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                senderName,
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Theme.of(context).colorScheme.primary,
                    fontSize: 12),
              ),
              Row(
                children: [
                  Text(
                    messageText,
                    style: TextStyle(
                      color: Theme.of(context).colorScheme.primary,fontSize: 10
                    ),
                  ),
                  const SizedBox(width: 5),
                  Text(
                    timestamp,
                    style: TextStyle(
                      color: Theme.of(context).colorScheme.secondary,fontSize: 10
                    ),
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}
