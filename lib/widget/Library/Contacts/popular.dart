import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:wise_student_app/widget/Library/category_based.dart';

class PopularContent extends StatefulWidget {
  const PopularContent({super.key,});

  @override
  State<PopularContent> createState() => _PopularContentState();
}

class _PopularContentState extends State<PopularContent> {
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

  Map<String, DocumentSnapshot?> getRecentBooksByCategory() {
    // Grouping data by category
    Map<String, List<DocumentSnapshot>> groupedData = {};

    for (var doc in data) {
      String category = doc['category'];
      if (!groupedData.containsKey(category)) {
        groupedData[category] = [];
      }
      groupedData[category]!.add(doc);
    }

    // Finding the most recent book for each category
    Map<String, DocumentSnapshot?> recentBooks = {};
    groupedData.forEach((category, books) {
      books.sort((a, b) => b['pages'].compareTo(a['pages']));
      recentBooks[category] = books.isNotEmpty ? books.first : null;
    });

    return recentBooks;
  }

  @override
  Widget build(BuildContext context) {
    Map<String, DocumentSnapshot?> recentBooks = getRecentBooksByCategory();

    return Container(
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
          // Display recent books for each category
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: recentBooks.entries.map((entry) {
              String category = entry.key;
              DocumentSnapshot? book = entry.value;
              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 8.0),
                    child: Text(
                      category,
                      style: const TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  if (book != null)
                    categoryBooks(
                      context,
                      imagePath: 'assets/gestalt.jpg',
                      category: book['category'],
                      title: book['title'],
                      author: book['author'],
                      pages: book['pages'],
                      language: book['language'],
                      release: book['release'],
                      description: book['description'],
                    )
                  else
                    const SizedBox(
                      height: 100,
                      child: Center(
                        child: Text('No recent books for this category'),
                      ),
                    ),
                ],
              );
            }).toList(),
          ),
        ],
      ),
    );
  }
}
