import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:wise_student_app/generated/l10n.dart';
import 'package:wise_student_app/widget/Library/Contacts/art.dart';
import 'package:wise_student_app/widget/Library/Contacts/businees.dart';
import 'package:wise_student_app/widget/Library/Contacts/design.dart';
import 'package:wise_student_app/widget/Library/Contacts/it.dart';
import 'package:wise_student_app/widget/Library/Contacts/management.dart';
import 'package:wise_student_app/widget/Library/Contacts/popular.dart';
import 'package:wise_student_app/widget/Library/book_card.dart';
import 'package:wise_student_app/widget/Library/bottons.dart';
import 'package:wise_student_app/widget/StudentWidgets/text_tabs.dart';

class Library extends StatelessWidget {
  const Library({super.key, Key? skey});

  @override
  Widget build(BuildContext context) {
    bool isDarkMode = Theme.of(context).brightness == Brightness.dark;

    return Stack(children: [
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
            child: const YourContentWidget(),
          ),
        ),
      ),
    ]);
  }
}

class YourContentWidget extends StatefulWidget {
  const YourContentWidget({super.key, Key? skey});

  @override
  State<YourContentWidget> createState() => _YourContentWidgetState();
}

class _YourContentWidgetState extends State<YourContentWidget> {
  int _selectedIndex = 0;
  List<QueryDocumentSnapshot> data = [];
  bool _isLoading = true;

  getData() async {
    QuerySnapshot querySnapshot =
        await FirebaseFirestore.instance.collection('books').get();
    data.addAll(querySnapshot.docs);
    setState(() {
      _isLoading = false;
    });
  }

  @override
  void initState() {
    getData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          const SizedBox(height: 60),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: Padding(
                  padding: EdgeInsets.only(
                      left: MediaQuery.sizeOf(context).width * 0.405),
                  child: Text(
                    S.of(context).Library,
                    style: GoogleFonts.hammersmithOne(
                      color: Theme.of(context).colorScheme.primary,
                      fontSize: 24,
                    ),
                  ),
                ),
              ),
              const ShoppingCartButton(),
              const SearchBookButton(),
            ],
          ),
          Padding(
            padding: const EdgeInsets.only(top: 20.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    const SizedBox(width: 10),
                    Text(
                      S.of(context).NewCollection,
                      style: GoogleFonts.hammersmithOne(
                        color: Theme.of(context).colorScheme.primary,
                        fontSize: 14,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 10),
                _isLoading
                    ? const Center(child: CircularProgressIndicator())
                    : SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        child: Row(
                          children: data
                              .map(
                                (doc) => bookCard(
                                  context: context,
                                  category: doc['category'],
                                  title: doc['title'],
                                  gradientColors: const [
                                    Color(0xff653706),
                                    Color(0xffF9BD2C)
                                  ],
                                  image: 'assets/gestalt.jpg',
                                  author: doc['author'],
                                  pages: doc['pages'],
                                  language: doc['language'],
                                  release: doc['release'],
                                  description: doc['description'],
                                ),
                              )
                              .toList(),
                        ),
                      ),
              ],
            ),
          ),
          const SizedBox(height: 10),
          Column(
            children: [
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    mainAxisAlignment:
                        MainAxisAlignment.center, // Center the row horizontally
                    children: [
                      TextTab(
                        tabTitles: [
                          S.of(context).Popular,
                          '',
                          S.of(context).Art,
                          '',
                          S.of(context).business,
                          '',
                          S.of(context).IT,
                          '',
                          S.of(context).Management,
                          '',
                          S.of(context).Design,
                        ],
                        onTabSelected: (index) {
                          setState(() {
                            _selectedIndex = index;
                          });
                        },
                      ),
                    ],
                  ),
                ),
              ),
              getContentWidget(_selectedIndex),
            ],
          ),
        ],
      ),
    );
  }
}

Widget getContentWidget(int index) {
  switch (index) {
    case 0:
      return const PopularContent();
    case 2:
      return const ArtContent();
    case 4:
      return const BusinessContent();
    case 6:
      return const ITContent();
    case 8:
      return const ManagementContent();
    case 10:
      return const DesignContent();
    default:
      return Container();
  }
}
