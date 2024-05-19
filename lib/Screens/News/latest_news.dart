import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:wise_student_app/Screens/News/post_card.dart';
import 'package:wise_student_app/generated/l10n.dart';
import 'package:google_fonts/google_fonts.dart';

class LatestNews extends StatefulWidget {
  const LatestNews({super.key});

  @override
  State<LatestNews> createState() => _NewsState();
}

class _NewsState extends State<LatestNews> {
  // ignore: unused_field
  final int _value = 1;
  List<QueryDocumentSnapshot> data = [];

  getData() async {
    QuerySnapshot querySnapshot =
        await FirebaseFirestore.instance.collection('news').get();

    setState(() {
      data.addAll(querySnapshot.docs);
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        surfaceTintColor: Colors.transparent,
        bottom: PreferredSize(
          preferredSize: const Size.fromHeight(4.0),
          child: Container(
            color: Colors.white,
            height: 1.0,
          ),
        ),
        title: Text(S.of(context).LatestNews,
            style: GoogleFonts.hammersmithOne(
              fontSize: 24,
              color: Theme.of(context).colorScheme.primary,
            )),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(top: 20, left: 16, right: 16),
          child: Column(
            children: data
                .map((doc) => postCard(
                      context,
                      title: doc['title'],
                      imagePath: doc['image'],
                      description: doc['description'],
                      createdAt: doc['created_at'],
                      whoCanSee: doc['who_can_see'],
                      author: doc['author'],
                    ))
                .toList(),
          ),
        ),
      ),
    );
  }
}
