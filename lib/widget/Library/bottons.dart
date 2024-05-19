import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:wise_student_app/Screens/Library/add_book.dart';
import 'package:wise_student_app/Screens/Library/shoppingcart.dart';
import 'package:wise_student_app/widget/Library/search_book.dart';

class ShoppingCartButton extends StatelessWidget {
  const ShoppingCartButton({super.key});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {
        Get.to(() => const ShoppingCart(
          title: '',
          imageAssetPath: '',
          author: '',
          pages: '',
          language: '',
          release: '',
          description: '',
        ));
      },
      style: ElevatedButton.styleFrom(
      shape: const CircleBorder(),
      backgroundColor: const Color.fromARGB(255, 21, 169, 255),
      side: BorderSide(color:Theme.of(context).colorScheme.background),),
      child: Icon(
        Icons.shopping_cart_outlined,
        color: Theme.of(context).colorScheme.background,
        size: 17,
      ),
    );
  }
}

class AddBookBotton extends StatelessWidget {
  const AddBookBotton({super.key});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {
        Get.to(() => const AddBook());
      },
      style: ElevatedButton.styleFrom(
      shape: const CircleBorder(),
      backgroundColor: const Color(0xffFF7315),
      side: BorderSide(color:Theme.of(context).colorScheme.background),),
      child: Icon(
        Icons.add,
        color: Theme.of(context).colorScheme.background,
        size: 17,
      ),
    );
  }
}

class SearchBookButton extends StatelessWidget {
  const SearchBookButton({super.key});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {
        Get.to(() => const SearchBook());
      },
      style: ElevatedButton.styleFrom(
      shape: const CircleBorder(),
      backgroundColor: const Color(0xffFF7315),
      side: BorderSide(color:Theme.of(context).colorScheme.background),),
      child: Icon(
        Icons.search,
        color: Theme.of(context).colorScheme.background,
        size: 17,
      ),
    );
  }
}