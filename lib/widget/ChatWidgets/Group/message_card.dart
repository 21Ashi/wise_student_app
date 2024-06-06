import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:wise_student_app/firebase/fire_database.dart';
import 'package:wise_student_app/models/message_model.dart';

class GroupMessageCard extends StatefulWidget {
  final String groupId;
  final Message messageItem;
  const GroupMessageCard(
      {super.key, required this.groupId, required this.messageItem});

  @override
  State<GroupMessageCard> createState() => _MessageCardState();
}

class _MessageCardState extends State<GroupMessageCard> {
  List<String> selectedMsg = [];

  void _showBottomSheet(BuildContext context) {
    showModalBottomSheet(
      context: context,
      backgroundColor: Colors.transparent,
      builder: (BuildContext context) {
        return Container(
          decoration: BoxDecoration(
            color: Theme.of(context).cardColor,
            borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(20),
              topRight: Radius.circular(20),
            ),
          ),
          child: Wrap(
            children: <Widget>[
              ListTile(
                leading: const Icon(Icons.copy),
                title: const Text('Copy'),
                onTap: () {
                  Navigator.of(context).pop();
                  _copySelectedMessages();
                },
              ),
              ListTile(
                leading: const Icon(Icons.delete_outline),
                title: const Text('Delete'),
                onTap: () {
                  Navigator.of(context).pop();
                  _deleteMessages();
                },
              ),
            ],
          ),
        );
      },
    );
  }

  void _copySelectedMessages() {
    String selectedMessages = selectedMsg.join("\n");
    Clipboard.setData(ClipboardData(text: selectedMessages));

    setState(() {
      selectedMsg.clear();
    });
  }

  void _deleteMessages() {
    FireData().deleteMsg(widget.groupId, selectedMsg);
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text('Selected messages deleted'),
      ),
    );

    setState(() {
      selectedMsg.clear();
    });
  }

  @override
  void initState() {
    if (widget.messageItem.toId == FirebaseAuth.instance.currentUser!.uid) {
      FireData().readMessage(widget.groupId, widget.messageItem.id!);
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: StreamBuilder(
          stream: FirebaseFirestore.instance
              .collection('groups')
              .doc(widget.groupId)
              .collection('messages')
              .snapshots(),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              List<Message> messageItems = snapshot.data!.docs
                  .map((e) => Message.fromJson(e.data()))
                  .toList()
                ..sort((a, b) => b.createdAt!.compareTo(a.createdAt!));
              return ListView.builder(
                reverse: true,
                itemCount: messageItems.length,
                itemBuilder: (context, index) {
                  return GestureDetector(
                    onTap: () {
                      setState(() {
                        selectedMsg.isNotEmpty
                            ? selectedMsg.contains(messageItems[index].id)
                                ? selectedMsg.remove(messageItems[index].id)
                                : selectedMsg.add(messageItems[index].id!)
                            : null;
                      });
                    },
                    onLongPress: () {
                      setState(() {
                        selectedMsg.contains(messageItems[index].id)
                            ? selectedMsg.remove(messageItems[index].id)
                            : selectedMsg.add(messageItems[index].id!);
                        _showBottomSheet(
                            context); // Show bottom sheet on long press
                      });
                    },
                    child: CardMessage(
                        selected: selectedMsg.contains(messageItems[index].id),
                        index: index,
                        messageItem: messageItems[index]),
                  );
                },
              );
            }
            return Container();
          }),
    );
  }
}

class CardMessage extends StatelessWidget {
  final Message messageItem;
  final int index;
  final bool selected;

  const CardMessage({
    super.key,
    required this.messageItem,
    required this.index,
    required this.selected,
  });

  @override
  Widget build(BuildContext context) {
    bool isMe = messageItem.fromId == FirebaseAuth.instance.currentUser!.uid;
    return Container(
      decoration: BoxDecoration(
        color: selected
            ? const Color.fromARGB(255, 196, 194, 194)
            : Colors.transparent,
        borderRadius: BorderRadius.circular(16),
      ),
      margin: const EdgeInsets.symmetric(vertical: 1),
      child: Row(
        mainAxisAlignment:
            isMe ? MainAxisAlignment.end : MainAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Card(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(isMe ? 16 : 0),
                  bottomRight: Radius.circular(isMe ? 0 : 16),
                  topLeft: const Radius.circular(16),
                  topRight: const Radius.circular(16),
                ),
              ),
              color: isMe ? const Color(0xFF387ADF) : const Color(0xFFFBA834),
              child: Padding(
                padding: const EdgeInsets.all(10),
                child: Hero(
                  tag: 'message_text_${messageItem.id}',
                  child: Container(
                    constraints: BoxConstraints(
                      maxWidth: MediaQuery.of(context).size.width / 2,
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        !isMe
                            ? StreamBuilder(
                                stream: FirebaseFirestore.instance
                                    .collection('students')
                                    .doc(messageItem.fromId)
                                    .snapshots(),
                                builder: (context, snapshot) {
                                  return snapshot.hasData
                                      ? Text(
                                          snapshot.data!.data()!['fname'],
                                          style: Theme.of(context)
                                              .textTheme
                                              .labelLarge,
                                        )
                                      : Container();
                                })
                            : Container(),
                        messageItem.type == 'image'
                            ? Image.network(messageItem.msg!)
                            : Text(
                                messageItem.msg!,
                                style: const TextStyle(
                                  fontSize: 16,
                                ),
                              ),
                        Text(
                          "11:11am",
                          style: Theme.of(context).textTheme.bodySmall,
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
