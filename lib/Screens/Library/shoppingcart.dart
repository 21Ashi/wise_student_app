import 'package:flutter/material.dart';
import 'package:get/get.dart';
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
    final shoppingCartController = Get.find<ShoppingCartController>();
    return Scaffold(
      appBar: AppBar(
        title: Text(S.of(context).Shoppingcart),
        actions: [
          IconButton(
            icon: const Icon(Icons.delete_sweep_rounded),
            onPressed: () {
              final removedItems =
                  List<Map<String, dynamic>>.from(shoppingCartController.books);
              shoppingCartController.clearCart();
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: const Text('All items cleared'),
                  action: SnackBarAction(
                    label: 'Undo',
                    onPressed: () {
                      if (removedItems.isNotEmpty) {
                        shoppingCartController.addMultipleToCart(removedItems);
                      }
                    },
                  ),
                ),
              );
            },
          ),
        ],
      ),
      body: YourCartContent(
        title: title,
        imageAssetPath: imageAssetPath,
        author: author,
        pages: pages,
        language: language,
        release: release,
        description: description,
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

  const YourCartContent({
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
  State<YourCartContent> createState() => _YourCartContentState();
}

class _YourCartContentState extends State<YourCartContent> {
  // Temporary storage for the last removed item
  Map<String, dynamic>? _lastRemovedItem;

  @override
  Widget build(BuildContext context) {
    final shoppingCartController = Get.find<ShoppingCartController>();
    final cartItems = shoppingCartController.books;

    return Obx(
      () {
        // Check if the shopping cart is empty
        if (cartItems.isEmpty) {
          return const Center(
            child: Text('Your shopping cart is empty.'),
          );
        }

        // If the shopping cart is not empty, display the cart items
        return Column(
          children: [
            const SizedBox(height: 10),
            Expanded(
              child: ListView.builder(
                itemCount: cartItems.length,
                itemBuilder: (context, index) {
                  final book = cartItems[index];
                  return Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Card(
                      child: ListTile(
                        leading: Image.asset(book['imageAssetPath']),
                        title: Text(
                          book['title'],
                          style: const TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 16,
                          ),
                        ),
                        subtitle: Text(
                          book['author'],
                          style: const TextStyle(
                            color: Colors.grey,
                            fontSize: 14,
                          ),
                        ),
                        trailing: IconButton(
                          icon: const Icon(Icons.delete, color: Colors.red),
                          onPressed: () => _onDeletePressed(book),
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                height: 50,
                width: 280,
                decoration: BoxDecoration(
                  boxShadow: const [
                    BoxShadow(
                      offset: Offset(0, 3),
                      blurRadius: 4,
                      color: Colors.black38,
                    ),
                  ],
                  color: Colors.orange[700],
                  gradient: const LinearGradient(
                    colors: [Color(0xffF9AD70), Color(0xffFF5717)],
                  ),
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Center(
                  child: Text(
                    S.of(context).ConfirmButton,
                    style: TextStyle(
                      color: Theme.of(context).colorScheme.background,
                      fontSize: 16,
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(
              height: MediaQuery.sizeOf(context).height * 0.1,
            ), // Adding some bottom padding
          ],
        );
      },
    );
  }

  void _onDeletePressed(Map<String, dynamic> book) {
    // Remove the item from the shopping cart
    ShoppingCartController.instance.removeFromCart(book['title']);
    // Store the removed item temporarily
    _lastRemovedItem = book;

    // Show the undo snackbar
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text('Deleted ${book['title']}'),
        action: SnackBarAction(
          label: 'Undo',
          onPressed: () {
            if (_lastRemovedItem != null) {
              // Re-add the last removed item to the cart
              ShoppingCartController.instance.addToCart(_lastRemovedItem!);
              _lastRemovedItem = null; // Clear the last removed item
            }
          },
        ),
      ),
    );
  }
}

class ShoppingCartController extends GetxController {
  static final ShoppingCartController instance =
      ShoppingCartController._internal();
  factory ShoppingCartController() => instance;
  ShoppingCartController._internal();

  final RxList<Map<String, dynamic>> books = <Map<String, dynamic>>[].obs;

  void addToCart(Map<String, dynamic> bookDetails) {
    debugPrint('Adding ${bookDetails['title']} to cart');
    books.add(bookDetails);
    debugPrint('Cart items: $books');
  }

  void addMultipleToCart(List<Map<String, dynamic>> bookDetails) {
    books.addAll(bookDetails);
    debugPrint('Cart items: $books');
  }

  void clearCart() {
    books.clear();
  }

  void removeFromCart(String bookTitle) {
    books.removeWhere((book) => book['title'] == bookTitle);
  }
}
