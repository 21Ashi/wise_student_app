import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:wise_student_app/generated/l10n.dart';

class ShoppingCart extends StatelessWidget {
  final String title;
  final String imageAssetPath;
  final String author;
  final String pages;
  final String language;
  final String release;
  final String description;

  const ShoppingCart({
    super.key,
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
    final shoppingCartController = Get.put(ShoppingCartController());
    return Scaffold(
      appBar: AppBar(),
      body: YourCartContent(
        title: title,
        imageAssetPath: imageAssetPath,
        author: author,
        pages: pages,
        language: language,
        release: release,
        description: description,
        onAddToCart: () {
          shoppingCartController.addToCart(title);
        },
      ),
    );
  }
}


class YourCartContent extends StatefulWidget {
  final String title;
  final String imageAssetPath;
  final String author;
  final String pages;
  final String language;
  final String description;
  final String release;
  final VoidCallback onAddToCart;
  const YourCartContent({super.key, required this.title, required this.imageAssetPath, required this.author, required this.pages, required this.language, required this.release, required this.description, required this.onAddToCart,});

  @override
  State<YourCartContent> createState() => _YourCartContentState();
}


class _YourCartContentState extends State<YourCartContent> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Column(
          children: [
            Row(
              children: [
                const SizedBox(width: 30),
                Text(
                  S.of(context).Shoppingcart,
                  style: GoogleFonts.hammersmithOne(
                    color: Theme.of(context).colorScheme.primary,
                    fontSize: 16,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 10,),
            SingleChildScrollView(
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Slidable(
                      endActionPane: ActionPane(
                        motion: const StretchMotion(),
                        children: [
                          SlidableAction(
                            onPressed: (context) => _onDeletePressed(),
                            backgroundColor: Colors.red,
                            icon: Icons.delete,
                          ),
                        ],
                      ),
                      child: Card(
                        child: ListTile(
                          leading: Image.asset(widget.imageAssetPath),
                          title: Text(
                            widget.title,
                            style: const TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 16,
                            ),
                          ),
                          subtitle: Text(
                            widget.author,
                            style: const TextStyle(
                              color: Colors.grey,
                              fontSize: 14,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
        const SizedBox(height: 50),
        Container(
          height: 50,
          width: 280,
          decoration: BoxDecoration(
            boxShadow: const [
              BoxShadow(
                  offset: Offset(0, 3), blurRadius: 4, color: Colors.black38)
            ],
            color: Colors.orange[700],
            gradient: const LinearGradient(
                colors: [Color(0xffF9AD70), Color(0xffFF5717)]),
            borderRadius: BorderRadius.circular(20),
          ),
          child: Center(
            child: Text(
              S.of(context).ConfirmButton,
              style: TextStyle(
                color: Theme.of(context).colorScheme.background, fontSize: 16),
            ),
          ),
        )
      ],
    );
  }
  bool isUserVisible = true;

  void _onDeletePressed() {
    setState(() {
      isUserVisible = false;
      _showUndoSnackbar();
    });
  }

  void _showUndoSnackbar() {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: const Text('Chat Deleted'),
        action: SnackBarAction(
          label: 'Undo',
          onPressed: () {
            setState(() {
              isUserVisible = true;
            });
          },
        ),
      ),
    );
  }
}


class ShoppingCartController extends GetxController {
  final RxList<String> books = <String>[].obs;

  void addToCart(String bookTitle) {
    books.add(bookTitle);
  }

  void removeFromCart(String bookTitle) {
    books.remove(bookTitle);
  }
}

