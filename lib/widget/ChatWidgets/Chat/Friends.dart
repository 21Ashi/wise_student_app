import 'package:flutter/material.dart';

class Freinds extends StatelessWidget {
  const Freinds({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 113,
      width: 101,
      decoration: BoxDecoration(
        boxShadow: const [
          BoxShadow(
            color: Colors.black38,
            blurRadius: 4,
            offset: Offset(0, 3), // Adjusted shadow position
          ),
        ],
        color: Theme.of(context).colorScheme.background,
        borderRadius: BorderRadius.circular(30),
      ),
    );
  }
}
