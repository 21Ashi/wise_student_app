import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:wise_student_app/Screens/Library/book_details.dart';


Widget bookCard({
  required BuildContext context,
  required String category,
  required String title,
  required List<Color> gradientColors,
  required String image,
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
          imageAssetPath: image,
          author: author,
          pages: pages,
          language: language,
          release: release,
          description: description,
      ));
    },
    child: Padding(
      padding: const EdgeInsets.only(left: 5, right: 5),
      child: Card(
        child: Container(
          width: 150,
          height: 182,
          decoration: BoxDecoration(
            boxShadow: const [BoxShadow(color: Colors.black38, offset: Offset(0, 3), blurRadius: 4)],
            gradient: LinearGradient(colors: gradientColors),
            borderRadius: BorderRadius.circular(10),
          ),
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 16),
                child: Image.asset(image),
              ),
              Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 6),
                    child: Container(
                      width: 150,
                      height: 55,
                      decoration: BoxDecoration(
                        color: Theme.of(context).colorScheme.background,
                        borderRadius: const BorderRadius.only(
                          bottomLeft: Radius.circular(10),
                          bottomRight: Radius.circular(10)
                        ),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.only(left: 16.0, right: 10),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              category,
                              style: TextStyle(
                                color: Theme.of(context).colorScheme.primary,
                                fontSize: 12
                              )),
                            Text(
                              title,
                              style: TextStyle(
                                fontSize: 8,
                                color: Theme.of(context).colorScheme.primary,
                                fontWeight: FontWeight.w500,
                                overflow: TextOverflow.ellipsis
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ]
          ),
        ),
      ),
    )
  );
}
