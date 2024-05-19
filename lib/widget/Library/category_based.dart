import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:wise_student_app/Screens/Library/book_details.dart';

Widget categoryBooks(
  BuildContext context,{
    required imagePath,
    required String category,
    required String title,
    required String author,
    required String pages, 
    required String language, 
    required String release, 
    required String description
  }) {
  return GestureDetector(
    onTap: () {
      Get.to(() => BookDetails(
          category: category,
          title: title,
          imageAssetPath: imagePath,
          author: author,
          pages: pages,
          language: language,
          release: release,
          description: description,
      ));
    },
    child: Padding(
      padding: const EdgeInsets.only(bottom:5),
      child: Row(
        children: [
          Container(
            decoration: BoxDecoration(
              gradient: const LinearGradient(
                  colors: [Color(0xff3A807E), Color(0xffA0D8D6)]),
              borderRadius: BorderRadius.circular(25),
            ),
            padding: const EdgeInsets.all(10),
            width: 120,
            height: 120,
            child: Image.asset(
              imagePath,
              fit: BoxFit.contain,
            ),
          ),
          const SizedBox(width: 10),
          Container(
            width: 220,
            padding: const EdgeInsets.all(10),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(category,
                    style: TextStyle(
                        color: Theme.of(context).colorScheme.primary,
                        fontSize: 10)),
                const SizedBox(height: 5),
                Text(title,
                    style:
                        const TextStyle(fontSize: 12, fontWeight: FontWeight.bold),
                    softWrap: true,
                    overflow: TextOverflow.clip),
                const SizedBox(height: 5),
                Text(author,
                    style: TextStyle(
                        color: Theme.of(context).colorScheme.secondary,
                        fontSize: 10)),
              ],
            ),
          ),
          const Icon(
            Icons.arrow_forward_ios,
            size: 14,
          )
        ],
      ),
    ),
  );
}
