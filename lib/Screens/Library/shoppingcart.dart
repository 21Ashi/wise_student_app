import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:wise_student_app/Screens/Library/confirm_purchase.dart';
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
  Map<String, dynamic>? _lastRemovedItem;

  @override
  Widget build(BuildContext context) {
    final shoppingCartController = Get.find<ShoppingCartController>();
    final cartItems = shoppingCartController.books;

    return Obx(
      () {
        if (cartItems.isEmpty) {
          return const Center(
            child: Text('Your shopping cart is empty.'),
          );
        }

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
            InkWell(
              onTap: () {
                Get.to(() => PurchaseConfirmationPage(
                      orderNumber: '123456', // Example order number
                      purchasedItems:
                          cartItems.toList(), // Convert RxList to List
                    ));
              },
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
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Center(
                  child: Text(
                    S.of(context).ConfirmButton,
                    style: TextStyle(
                        color: Theme.of(context).colorScheme.background,
                        fontSize: 16,
                        fontWeight: FontWeight.bold),
                  ),
                ),
              ),
            ),

            SizedBox(
              height: MediaQuery.of(context).size.height * 0.1,
            ), // Adding some bottom padding
          ],
        );
      },
    );
  }

  void _onDeletePressed(Map<String, dynamic> book) {
    ShoppingCartController.instance.removeFromCart(book['title']);
    _lastRemovedItem = book;

    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text('Deleted ${book['title']}'),
        action: SnackBarAction(
          label: 'Undo',
          onPressed: () {
            if (_lastRemovedItem != null) {
              ShoppingCartController.instance.addToCart(_lastRemovedItem!);
              _lastRemovedItem = null;
            }
          },
        ),
      ),
    );
  }
}

class ShoppingCartController extends GetxController {
  var itemCount = 0.obs;

  static final ShoppingCartController instance =
      ShoppingCartController._internal();
  factory ShoppingCartController() => instance;
  ShoppingCartController._internal();

  final RxList<Map<String, dynamic>> books = <Map<String, dynamic>>[].obs;
  RxList<Map<String, dynamic>> orderItems = <Map<String, dynamic>>[].obs;

  void addToCart(Map<String, dynamic> bookDetails) {
    books.add(bookDetails);
    itemCount.value++;
  }

  void addMultipleToCart(List<Map<String, dynamic>> bookDetails) {
    books.addAll(bookDetails);
    itemCount.value += bookDetails.length;
  }

  void addItemToOrder(Map<String, dynamic> item) {
    orderItems.add(item);
  }

  void clearCart() {
    books.clear();
    itemCount.value = 0;
  }

  void removeFromCart(String bookTitle) {
    books.removeWhere((book) => book['title'] == bookTitle);
    itemCount.value--;
  }
}

class OrderContent extends StatelessWidget {
  final List<Map<String, dynamic>> cartItems;

  const OrderContent({
    super.key,
    required this.cartItems,
  });

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Order Summary',
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 20),
          ListView.builder(
            shrinkWrap: true,
            itemCount: cartItems.length,
            itemBuilder: (context, index) {
              final book = cartItems[index];
              return ListTile(
                leading: Image.asset(book['imageAssetPath']),
                title: Text(
                  book['title'],
                  style: const TextStyle(
                      fontSize: 16, fontWeight: FontWeight.bold),
                ),
                subtitle: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Author: ${book['author']}',
                      style: const TextStyle(fontSize: 14, color: Colors.grey),
                    ),
                    Text(
                      'Pages: ${book['pages']}',
                      style: const TextStyle(fontSize: 14, color: Colors.grey),
                    ),
                    Text(
                      'Language: ${book['language']}',
                      style: const TextStyle(fontSize: 14, color: Colors.grey),
                    ),
                    Text(
                      'Release: ${book['release']}',
                      style: const TextStyle(fontSize: 14, color: Colors.grey),
                    ),
                    const SizedBox(height: 10),
                    const Text(
                      'Description:',
                      style:
                          TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
                    ),
                    Text(
                      book['description'],
                      style: const TextStyle(fontSize: 14, color: Colors.grey),
                    ),
                  ],
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
