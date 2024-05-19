import 'package:flutter/material.dart';

class ProfileButton extends StatelessWidget {
  final VoidCallback onPressed;

  const ProfileButton({super.key, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        shape: const CircleBorder(),
        fixedSize: const Size(20, 20),
        backgroundColor: const Color(0xffFF7315),
        side: const BorderSide(color: Colors.white),
      ),
      child: const Icon(
        Icons.person,
        color: Colors.white,
        size: 16,
      ),
    );
  }
}
