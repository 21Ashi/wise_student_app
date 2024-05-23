import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:wise_student_app/Screens/Library/book_details.dart';
import 'package:wise_student_app/widget/Library/library_textfield.dart';

class SearchBook extends StatefulWidget {
  const SearchBook({super.key});

  @override
  State<SearchBook> createState() => _SearchBookState();
}

class _SearchBookState extends State<SearchBook> {
  late List<QueryDocumentSnapshot> data = [];
  String searchText = '';

  @override
  void initState() {
    super.initState();
    getData();
  }

  void getData() async {
    QuerySnapshot querySnapshot =
        await FirebaseFirestore.instance.collection('books').get();
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
                    child: SingleChildScrollView(
                      child: StreamBuilder<QuerySnapshot>(
                          stream: FirebaseFirestore.instance
                              .collection('books')
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
                                  if (searchText.isEmpty ||
                                      data['title']
                                          .toString()
                                          .toLowerCase()
                                          .contains(searchText.toLowerCase()) ||
                                      data['author']
                                          .toString()
                                          .toLowerCase()
                                          .contains(searchText.toLowerCase()) ||
                                      data['release']
                                          .toString()
                                          .toLowerCase()
                                          .contains(searchText.toLowerCase()) ||
                                      data['language']
                                          .toString()
                                          .toLowerCase()
                                          .contains(searchText.toLowerCase())) {
                                    return searchBookCard(
                                      context: context,
                                      category: data['category'],
                                      title: data['title'],
                                      imageAssetPath: 'assets/gestalt.jpg',
                                      author: data['author'],
                                      pages: data['pages'],
                                      language: data['language'],
                                      release: data['release'],
                                      description: data['description'],
                                    );
                                  }
                                  return const SizedBox.shrink();
                                },
                              );
                            }
                          }),
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}

Widget searchBookCard(
    {required BuildContext context,
    required String category,
    required String title,
    required String imageAssetPath,
    required String author,
    required String pages,
    required String language,
    required String release,
    required String description}) {
  return GestureDetector(
    onTap: () {
      Get.to(() => BookDetails(
            category: category,
            title: title,
            imageAssetPath: imageAssetPath,
            author: author,
            pages: pages,
            language: language,
            release: release,
            description: description,
          ));
    },
    child: Card(
      child: ListTile(
        leading: Image.asset('assets/gestalt.jpg'),
        title: Text(title),
        subtitle: Text(author),
      ),
    ),
  );
}
