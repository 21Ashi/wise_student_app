import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:wise_student_app/widget/Library/category_based.dart';

class ArtContent extends StatefulWidget {
  const ArtContent({super.key,});

  @override
  State<ArtContent> createState() => _ArtContentState();
}

class _ArtContentState extends State<ArtContent> {
  late List<DocumentSnapshot> data = [];

  @override
  void initState() {
    super.initState();
    getData();
  }

  void getData() async {
    QuerySnapshot querySnapshot =
        await FirebaseFirestore.instance.collection('books').get();
    setState(() {
      data = querySnapshot.docs;
    });
  }

  List<DocumentSnapshot> getArtCategoryData() {
    return data.where((doc) => doc['category'] == 'Art').toList();
  }

  @override
  Widget build(BuildContext context) {
    List<DocumentSnapshot> artCategoryData = getArtCategoryData();

    return Container(
      width: 400,
      height: 400,
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.background,
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(15),
          topRight: Radius.circular(15),
        ),
      ),
      padding: const EdgeInsets.only(top: 12, left: 16),
      child: Column(
        children: [
          Container(
            width: 50,
            height: 2,
            padding: const EdgeInsets.all(0.1),
            decoration: BoxDecoration(
              color: Theme.of(context).colorScheme.primary,
            ),
          ),
          const SizedBox(height: 20),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: artCategoryData.map((doc) {
              return categoryBooks(
                context,
                imagePath: 'assets/gestalt.jpg',
                category: doc['category'],
                title: doc['title'],
                author: doc['author'],
                pages: doc['pages'],
                language: doc['language'],
                release: doc['release'],
                description: doc['description'],
              );
            }).toList(),
          ),
        ],
      ),
    );
  }
}
