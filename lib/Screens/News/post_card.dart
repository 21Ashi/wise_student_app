import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:wise_student_app/Screens/News/news_Details.dart';

Widget postCard(
  BuildContext context, {
  required String title,
  required String imagePath,
  required String description,
  required String createdAt,
  required String whoCanSee,
  required String author,
}) {
  return GestureDetector(
    onTap: () {
      Get.to(() => NewsDetails(
            author: author,
            createdAt: createdAt,
            description: description,
            imagePath: imagePath,
            title: title,
            whoCanSee: whoCanSee,
          ));
    },
    child: Padding(
      padding: const EdgeInsets.only(bottom: 5),
      child: Row(
        children: [
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(25),
            ),
            width: 120,
            height: 100,
            child: Image.network(
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
                Text(title,
                    style: TextStyle(
                        color: Theme.of(context).colorScheme.primary,
                        fontSize: 12)),
                const SizedBox(height: 5),
                const SizedBox(height: 5),
                Row(
                  children: [
                    Icon(
                      Icons.timer_rounded,
                      color: Theme.of(context).colorScheme.primary,
                      size: 12,
                    ),
                    Text(
                      createdAt,
                      style: TextStyle(
                          color: Theme.of(context).colorScheme.primary,
                          fontSize: 10),
                    ),
                  ],
                ),
                Row(
                  children: [
                    Text(
                      "By",
                      style: TextStyle(
                          color: Theme.of(context).colorScheme.primary,
                          fontSize: 10),
                      overflow: TextOverflow.ellipsis,
                    ),
                    Text(
                      author,
                      style: TextStyle(
                          color: Theme.of(context).colorScheme.primary,
                          fontSize: 10),
                      overflow: TextOverflow.ellipsis,
                    ),
                  ],
                )
              ],
            ),
          ),
        ],
      ),
    ),
  );
}
