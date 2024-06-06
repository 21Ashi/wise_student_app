import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:wise_student_app/widget/ChatWidgets/user_1.dart';
import 'package:wise_student_app/widget/Library/library_textfield.dart';

class SearchButton extends StatelessWidget {
  const SearchButton({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => const SearchChat()),
        );
      },
      child: Container(
        height: 40,
        width: 40,
        padding: const EdgeInsets.all(5),
        decoration: BoxDecoration(
            color: Colors.orange,
            borderRadius: BorderRadius.circular(25),
            border: Border.all(color: Colors.white)),
        child: const Icon(
          Icons.search,
          color: Colors.white,
        ),
      ),
    );
  }
}

class SearchChat extends StatefulWidget {
  const SearchChat({super.key});

  @override
  State<SearchChat> createState() => _SearchChatState();
}

class _SearchChatState extends State<SearchChat> {
  late List<QueryDocumentSnapshot> data = [];
  String searchText = '';

  @override
  void initState() {
    super.initState();
    getData();
  }

  void getData() async {
    QuerySnapshot querySnapshot =
        await FirebaseFirestore.instance.collection('students').get();
    setState(() {
      data.addAll(querySnapshot.docs);
    });
  }

  @override
  Widget build(BuildContext context) {
    bool isDarkMode = Theme.of(context).brightness == Brightness.dark;
    return Stack(
      children: [
        Scaffold(
          body: SingleChildScrollView(
            child: Container(
              height: MediaQuery.of(context).size.height,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage(isDarkMode
                      ? 'assets/LibraryDT.png'
                      : 'assets/Librarybg.png'),
                  fit: BoxFit.fill,
                ),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding:
                        const EdgeInsets.only(top: 50, left: 10, right: 10),
                    child: Row(
                      children: [
                        InkWell(
                            onTap: () {
                              Navigator.pop(context);
                            },
                            child: const Icon(Icons.arrow_back_ios_new))
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(
                        top: 20, left: 10, right: 10, bottom: 10),
                    child: LibraryTextField(
                      suffix: null,
                      onChanged: (value) {
                        setState(() {
                          searchText = value;
                        });
                      },
                    ),
                  ),
                  Container(
                    height: 672.9,
                    decoration: const BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.only(
                            topRight: Radius.circular(20),
                            topLeft: Radius.circular(20))),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
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
                                      var data = snapshots.data!.docs[index]
                                          .data() as Map<String, dynamic>;
                                      if (searchText.isEmpty ||
                                          data['fname']
                                              .toString()
                                              .toLowerCase()
                                              .contains(
                                                  searchText.toLowerCase()) ||
                                          data['std_email']
                                              .toString()
                                              .toLowerCase()
                                              .contains(
                                                  searchText.toLowerCase())) {
                                        return searchChatCard(
                                          context: context,
                                          fname: data['fname'],
                                          stdemail: data['std_email'],
                                        );
                                      }
                                      return const SizedBox.shrink();
                                    },
                                  );
                                }
                              }),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}

Widget searchChatCard(
    {required BuildContext context,
    required String fname,
    required String stdemail}) {
  return GestureDetector(
    onTap: () {
      Get.to(() => const UserListItem());
    },
    child: Card(
      child: ListTile(
        leading: Image.asset('assets/user1.png'),
        title: Text(fname),
        subtitle: Text(stdemail),
      ),
    ),
  );
}
