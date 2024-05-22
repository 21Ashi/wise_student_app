import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:wise_student_app/firebase/fire_database.dart';
import 'package:wise_student_app/generated/l10n.dart';
import 'package:wise_student_app/models/user_model.dart';
import 'package:wise_student_app/widget/ChatWidgets/Group/add_group.dart';

class GroupButton extends StatelessWidget {
  const GroupButton({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => const AddGroup()),
        );
      },
      child: Container(
        height: 40,
        width: 40,
        padding: const EdgeInsets.all(5),
        decoration: BoxDecoration(
            color: Colors.blue,
            borderRadius: BorderRadius.circular(25),
            border: Border.all(color: Colors.white)),
        child: const Icon(
          Icons.add,
          color: Colors.white,
        ),
      ),
    );
  }
}

// ignore: must_be_immutable
class GroupChat extends StatefulWidget {
  const GroupChat({super.key});

  @override
  State<GroupChat> createState() => _GroupChatState();
}

class _GroupChatState extends State<GroupChat> {
  TextEditingController gname = TextEditingController();

  List<String> members = [];

  List myContacts = [];

  @override
  Widget build(BuildContext context) {
    bool isDarkMode = Theme.of(context).brightness == Brightness.dark;
    return Scaffold(
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          FireData()
              .createGroup(gname.text, members)
              .then((value) => Navigator.pop(context));
          setState(() {
            members = [];
          });
        },
        label: const Text("Done"),
        icon: const Icon(
          Icons.check_circle,
          color: Colors.white,
        ),
      ),
      body: SingleChildScrollView(
        child: Container(
          height: MediaQuery.of(context).size.height,
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage(
                  isDarkMode ? 'assets/LibraryDT.png' : 'assets/Librarybg.png'),
              fit: BoxFit.fill,
            ),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 50, left: 10, right: 10),
                child: Row(
                  children: [
                    InkWell(
                        onTap: () {
                          Navigator.pop(context);
                        },
                        child: const Icon(Icons.arrow_back_ios_new)),
                    const SizedBox(
                      width: 10,
                    ),
                    Text(
                      S.of(context).CreateGroup,
                      style: const TextStyle(
                          fontSize: 22, fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
              ),
              Padding(
                  padding: const EdgeInsets.only(
                      top: 20, left: 10, right: 10, bottom: 10),
                  child: TextFormField(
                    controller: gname,
                    decoration: InputDecoration(
                        fillColor: Colors.blue,
                        filled: true,
                        hintText: 'Enter Group name',
                        hintStyle: const TextStyle(color: Colors.white),
                        prefixIcon: const Icon(
                          Icons.group_add,
                          color: Colors.white,
                        ),
                        enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(25),
                            borderSide: const BorderSide(color: Colors.white))),
                  )),
              Container(
                height: MediaQuery.sizeOf(context).height * 0.79,
                decoration: const BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                        topRight: Radius.circular(20),
                        topLeft: Radius.circular(20))),
                child: Column(
                  children: [
                    const Padding(
                      padding: EdgeInsets.only(
                          right: 8.0, left: 8, top: 20, bottom: 10),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "Members",
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Text(
                            "9",
                            style: TextStyle(
                                fontSize: 16, fontWeight: FontWeight.bold),
                          )
                        ],
                      ),
                    ),
                    SingleChildScrollView(
                      child: StreamBuilder<QuerySnapshot>(
                          stream: FirebaseFirestore.instance
                              .collection('students')
                              .snapshots(),
                          builder: (context, snapshots) {
                            if (snapshots.connectionState ==
                                ConnectionState.waiting) {
                              return const Center(
                                  child: CircularProgressIndicator());
                            } else {
                              return ListView.builder(
                                shrinkWrap: true,
                                itemCount: snapshots.data!.docs.length,
                                itemBuilder: (context, index) {
                                  var data = snapshots.data!.docs[index].data()
                                      as Map<String, dynamic>;
                                  return groupChatCard(
                                    context: context,
                                    fname: data['fname'],
                                    std_email: data['std_email'],
                                    admin: Std(
                                      id: data['id'],
                                      fname: data['fname'],
                                      phoneNumber: data['phone_number'],
                                      image: data['image'],
                                      lastActivated: data['last_activated'],
                                      pushToken: data['push_token'],
                                      online: data['online'],
                                      stdId: data['std_id'],
                                      degree: data['degree'],
                                      major: data['major'],
                                      academicAdvisor: data['academic_advisor'],
                                      stdEmail: data['std_email'],
                                      eLearningPass: data['eLearning_pass'],
                                      teamsPass: data['teams_pass'],
                                      myUsers: data['my_users'],
                                    ),
                                  );
                                },
                              );
                            }
                          }),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget groupChatCard({
    required BuildContext context,
    required String fname,
    required String std_email,
    required Std admin,
  }) {
    return CheckboxListTile(
      checkboxShape: const CircleBorder(),
      title: Text(fname),
      subtitle: Text(std_email),
      value: members.contains(admin.id),
      onChanged: (value) {
        if (value != null && value) {
          members.add(admin.id!);
        } else {
          members.remove(admin.id!);
        }
      },
    );
  }
}
