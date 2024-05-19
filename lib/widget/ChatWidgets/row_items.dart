import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:wise_student_app/widget/ChatWidgets/user_1.dart';

Widget UserCard({
  required BuildContext context,
  required String fname,
  required String email,
}) {
  return GestureDetector(
      onTap: () {
        Get.to(() => const UserListItem());
      },
      child: Padding(
        padding: const EdgeInsets.only(left: 5, right: 5),
        child: Padding(
          padding: const EdgeInsets.all(3),
          child: Container(
            width: 113,
            height: 101,
            decoration: BoxDecoration(
              boxShadow: const [
                BoxShadow(
                  color: Colors.black38,
                  blurRadius: 4,
                  offset: Offset(0, 3),
                ),
              ],
              color: Theme.of(context).colorScheme.background,
              borderRadius: BorderRadius.circular(40),
            ),
            child: Column(children: [
              const Padding(
                padding: EdgeInsets.only(top: 8),
              ),
              Image.asset('assets/user1.png'),
              const SizedBox(
                height: 5,
              ),
              Text(fname,
                  style: TextStyle(
                      color: Theme.of(context).colorScheme.primary,
                      fontSize: 12)),
              const SizedBox(
                height: 5,
              ),
              Text(email,
                  style: TextStyle(
                      color: Theme.of(context).colorScheme.primary,
                      fontSize: 12)),
            ]),
          ),
        ),
      ));
}

class RowChat extends StatelessWidget {
  const RowChat({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: StreamBuilder<QuerySnapshot>(
          stream: FirebaseFirestore.instance.collection('students').snapshots(),
          builder: (context, snapshots) {
            if (snapshots.connectionState == ConnectionState.waiting) {
              return const Center(child: CircularProgressIndicator());
            } else {
              return ListView.builder(
                scrollDirection: Axis.horizontal,
                shrinkWrap: true,
                itemCount: snapshots.data!.docs.length,
                itemBuilder: (context, index) {
                  var data = snapshots.data!.docs[index].data()
                      as Map<String, dynamic>;
                  return UserCard(
                    context: context,
                    fname: data['fname'],
                    email: data['std_email'],
                  );
                },
              );
            }
          }),
    );
  }
}
