import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:wise_student_app/Screens/News/drawer_list.dart';
import 'package:wise_student_app/Screens/News/latest_news.dart';
import 'package:wise_student_app/Screens/News/post_card.dart';
import 'package:wise_student_app/Screens/Notifications/notifications.dart';
import 'package:wise_student_app/generated/l10n.dart';
import 'package:wise_student_app/widget/News/image_slider.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class News extends StatefulWidget {
  const News({super.key});

  @override
  State<News> createState() => _NewsState();
}

class _NewsState extends State<News> {
  List<QueryDocumentSnapshot> data = [];

  @override
  void initState() {
    super.initState();
    getData();
  }

  Future<void> getData() async {
    QuerySnapshot querySnapshot =
        await FirebaseFirestore.instance.collection('news').get();
    setState(() {
      data.addAll(querySnapshot.docs);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const Sidebar(),
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.background,
        surfaceTintColor: Theme.of(context).colorScheme.background,
        iconTheme: IconThemeData(
          color: Theme.of(context).colorScheme.primary,
        ),
        bottom: PreferredSize(
          preferredSize: const Size.fromHeight(4.0),
          child: Container(
            color: Theme.of(context).colorScheme.secondary,
            height: 1.0,
          ),
        ),
        title: Text(
          S.of(context).News,
          style: GoogleFonts.hammersmithOne(
            fontSize: 26,
            color: Theme.of(context).colorScheme.primary,
          ),
        ),
        centerTitle: true,
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 16, left: 16),
            child: InkWell(
              onTap: () {
                Get.to(() => const Noti());
              },
              child: Icon(
                Icons.notifications,
                size: 30,
                color: Theme.of(context).colorScheme.primary,
              ),
            ),
          ),
        ],
      ),
      body: Stack(
        children: [
          const ImageSlider(),
          Padding(
            padding: const EdgeInsets.only(top: 330, left: 16, right: 16),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      S.of(context).LatestNews,
                      style: TextStyle(
                        color: Theme.of(context).colorScheme.primary,
                        fontSize: 16,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 5),
                      child: InkWell(
                        onTap: () {
                          Get.to(() => const LatestNews());
                        },
                        child: Text(
                          S.of(context).SeeMore,
                          style: GoogleFonts.karma(
                            color: Theme.of(context).colorScheme.primary,
                            fontSize: 10,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                Expanded(
                  child: ListView.builder(
                    itemCount: data.length,
                    itemBuilder: (context, index) {
                      final doc = data[index];
                      return postCard(
                        context,
                        title: doc['title'],
                        imagePath: doc['image'],
                        description: doc['description'],
                        createdAt: doc['created_at'],
                        whoCanSee: doc['who_can_see'],
                        author: doc['author'],
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
