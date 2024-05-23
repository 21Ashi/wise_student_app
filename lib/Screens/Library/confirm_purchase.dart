import 'package:flutter/material.dart';
import 'package:wise_student_app/Screens/Library/shoppingcart.dart';

class PurchaseConfirmationPage extends StatelessWidget {
  final List<Map<String, dynamic>> purchasedItems;
  final String orderNumber;

  const PurchaseConfirmationPage({
    super.key,
    required this.purchasedItems,
    required this.orderNumber,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Borrow Confirmation'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Thank You For Borrowing',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 20),
            Text(
              '${'OrderNumber'}: $orderNumber',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
                color: Colors.grey[700],
              ),
            ),
            const SizedBox(height: 10),
            Expanded(
              child: ListView.builder(
                itemCount: purchasedItems.length,
                itemBuilder: (context, index) {
                  final book = purchasedItems[index];
                  return ListTile(
                    leading: Image.asset(book['imageAssetPath'], width: 50),
                    title: Text(
                      book['title'],
                      style: const TextStyle(fontWeight: FontWeight.bold),
                    ),
                    subtitle: Text(book['author']),
                  );
                },
              ),
            ),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.orange[700],
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
                padding: const EdgeInsets.symmetric(vertical: 16.0),
              ),
              onPressed: () {
                // Replace with navigation to your home page or any other desired page
                Navigator.pop(context);
                Navigator.pop(context);
                ShoppingCartController().clearCart();
              },
              child: const Center(
                child: Text(
                  'Return To Home',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 20,
            )
          ],
        ),
      ),
    );
  }
}
