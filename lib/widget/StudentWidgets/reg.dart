import 'package:flutter/material.dart';
import 'package:get/get.dart';

class RegistrationWidget extends StatelessWidget {
  final IconData icon;
  final String text;
  final Widget navigateToClass;
  final IconData icon2;

  const RegistrationWidget({
    Key? key,
    required this.icon,
    required this.text,
    required this.navigateToClass,
    required this.icon2,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Get.to(() => navigateToClass);
      },
      child: Container(
        padding: const EdgeInsets.all(16.0),
        margin: const EdgeInsets.all(8.0),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8.0),
        ),
        child: Row(
          children: [
            Icon(icon),
            const SizedBox(width: 8.0),
            Text(text),
            const Spacer(),
            Icon(
              icon2,
              size: 14,
            )
          ],
        ),
      ),
    );
  }
}

class CustomRowPay extends StatelessWidget {
  final String title;
  final String value;

  const CustomRowPay({
    Key? key,
    required this.title,
    required this.value,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            title,
            style: const TextStyle(
              color: Color(0xff4B62A9),
              fontFamily: 'Bakbak one',
              fontWeight: FontWeight.bold,
            ),
          ),
          Text(
            value,
            style: TextStyle(
              color: Theme.of(context).colorScheme.primary,
              fontFamily: 'Bakbak one',
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }
}
