import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:wise_student_app/models/message_model.dart';
import 'package:wise_student_app/models/room_model.dart';
import 'package:wise_student_app/models/user_model.dart';

class RowChat extends StatefulWidget {
  const RowChat({super.key,});
  @override
  State<RowChat> createState() => _UserListItemState();
}

class _UserListItemState extends State<RowChat> {

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: FirebaseFirestore.instance
        .collection('ChatRooms')
        .where(
          'members',
          arrayContains: FirebaseAuth.instance.currentUser!.uid
        )
        .snapshots(),
      builder: (context, snapshot) {
        if(snapshot.hasData){
          List<ChatRoom> items = snapshot.data!.docs
            .map((e) => ChatRoom
            .fromJson(e.data()))
            .toList()
            ..sort((a, b) => b.lastMessageTime!.compareTo(a.lastMessageTime!),);
          return ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: items.length ,
            itemBuilder: (context, index){
              return UsedCard(
                messageItem: Message(id: '', toId: '', fromId: '', msg: '', type: '', createdAt: '', read: '', message: '') ,
                item: items[index],
              );
            }
          );
        }else{
          return const Center(
            child: CircularProgressIndicator(),
          );
        }
      },   
    );
  }
}



class UsedCard extends StatefulWidget {
  final ChatRoom item;
  final Message messageItem;
  
  const UsedCard({super.key, required this.item, required this.messageItem});

  @override
  State<UsedCard> createState() => _UsedCardState();
}

class _UsedCardState extends State<UsedCard> {

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
        if(snapshot.hasData){
          Std student = Std.fromJson(snapshot.data!.data()!);
          return Padding(
            padding: const EdgeInsets.only(left: 8, right: 8),
            child: Container(
              width: 113,
              height: 101,
              decoration: BoxDecoration(
                boxShadow: const [BoxShadow(
                  color: Colors.black38,
                  blurRadius: 4,
                  offset: Offset(0, 3),
                ),],
                color: Theme.of(context).colorScheme.background,
                borderRadius: BorderRadius.circular(40),
              ),
              child: Column(
              children: [
                const Padding(padding: EdgeInsets.only(top: 8),),
                Image.asset('assets/user1.png'),
                const SizedBox(height: 5,),
                Text(
                  student.fname!,
                  style: TextStyle(
                    color: Theme.of(context).colorScheme.primary,
                    fontSize: 12
                  )
                ),
                const SizedBox(height: 5,),
                Text(
                  student.stdEmail!,
                  style: TextStyle(
                    color: Theme.of(context).colorScheme.primary,
                    fontSize: 12
                  )
                ),
              ]
            ),
            ),
          );
        }else{
          return Container();
        }
      }
    );
  }
}