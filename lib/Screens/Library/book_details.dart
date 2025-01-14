import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';
import 'package:wise_student_app/Screens/Library/cart_provider.dart';
import 'package:wise_student_app/Screens/Library/shoppingcart.dart';
import 'package:wise_student_app/generated/l10n.dart';
import 'package:wise_student_app/widget/Library/bottons.dart';
import 'package:wise_student_app/widget/Library/custom_row.dart';

class BookDetails extends StatelessWidget {
  final String category;
  final String title;
  final String imageAssetPath;
  final String author;
  final String pages;
  final String language;
  final String release;
  final String description;

  const BookDetails({
    super.key,
    required this.category,
    required this.title,
    required this.imageAssetPath,
    required this.author,
    required this.pages,
    required this.language,
    required this.release,
    required this.description,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        title: Text(
          S.of(context).BookDetails,
          style: const TextStyle(fontWeight: FontWeight.bold),
        ),
        actions: const [
          Padding(
            padding: EdgeInsets.only(left: 16, right: 16),
            child: ShoppingCartButton(),
          )
        ],
      ),
      body: ChangeNotifierProvider(
        create: (_) => CartProvider(),
        child: Container(
          decoration: const BoxDecoration(
            image: DecorationImage(
              alignment: Alignment.topCenter,
              image: AssetImage('assets/BookDetails.png'),
            ),
          ),
          child: YourBookContent(
            category: category,
            title: title,
            imageAssetPath: imageAssetPath,
            author: author,
            pages: pages,
            language: language,
            release: release,
            description: description,
          ),
        ),
      ),
    );
  }
}

class YourBookContent extends StatelessWidget {
  final String category;
  final String title;
  final String imageAssetPath;
  final String author;
  final String pages;
  final String language;
  final String release;
  final String description;
  const YourBookContent({
    super.key,
    required this.category,
    required this.title,
    required this.imageAssetPath,
    required this.author,
    required this.pages,
    required this.language,
    required this.release,
    required this.description,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(
          height: 120,
        ),
        Container(
          decoration: BoxDecoration(
            color: Theme.of(context).colorScheme.background,
            borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(20),
              topRight: Radius.circular(20),
            ),
          ),
          padding: const EdgeInsets.all(20),
          child: Column(
            children: [
              Container(
                height: 224,
                width: 179,
                decoration: BoxDecoration(
                  gradient: const LinearGradient(
                    colors: [
                      Color.fromARGB(255, 14, 74, 163),
                      Color.fromARGB(255, 143, 200, 247),
                    ],
                  ),
                  borderRadius: BorderRadius.circular(25),
                ),
                padding: const EdgeInsets.all(20),
                child: Image.asset(
                  imageAssetPath,
                  fit: BoxFit.contain,
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Text(
                title,
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 12,
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              CustomRowWithLines(
                firstValue: pages,
                firstLabel: S.of(context).BookPage,
                secondValue: language,
                secondLabel: S.of(context).BookLanguage,
                thirdValue: release,
                thirdLabel: S.of(context).BookRelease,
              ),
              const SizedBox(
                height: 10,
              ),
              Text(
                description,
                style: TextStyle(
                  fontSize: 12,
                  color: Theme.of(context).colorScheme.primary,
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              GestureDetector(
                onTap: () {
                  final shoppingCartController =
                      Get.find<ShoppingCartController>();

                  // Check if the book is already in the cart
                  final alreadyInCart = shoppingCartController.books.any(
                      (book) =>
                          book['title'] == title &&
                          book['author'] == author &&
                          book['pages'] == pages &&
                          book['language'] == language &&
                          book['release'] == release &&
                          book['description'] == description);

                  if (!alreadyInCart) {
                    // If the book is not in the cart, add it
                    shoppingCartController.addToCart({
                      'title': title,
                      'imageAssetPath': imageAssetPath,
                      'author': author,
                      'pages': pages,
                      'language': language,
                      'release': release,
                      'description': description,
                    });

                    // Show SnackBar or any other action you want
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                        content: Text('Item added to cart'),
                        duration: Duration(seconds: 2),
                      ),
                    );
                  } else {
                    // If the book is already in the cart, show a message
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                        content: Text('You have already borrowed this book.'),
                        duration: Duration(seconds: 2),
                      ),
                    );
                  }
                },
                child: Container(
                  decoration: BoxDecoration(
                    boxShadow: const [
                      BoxShadow(
                        offset: Offset(0, 3),
                        blurRadius: 3,
                        color: Colors.black38,
                      ),
                    ],
                    color: Colors.orange[700],
                    borderRadius: BorderRadius.circular(20),
                  ),
                  padding: const EdgeInsets.all(9),
                  width: 280,
                  height: 50,
                  child: Center(
                    child: Text(
                      S.of(context).Borrow,
                      style: TextStyle(
                        color: Theme.of(context).colorScheme.background,
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ],
    );
  }
}
