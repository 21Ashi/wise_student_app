import 'package:flutter/material.dart';

class SettingButton extends StatelessWidget {
  final VoidCallback onPressed;

  const SettingButton({super.key, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        shape: const CircleBorder(),
        fixedSize: const Size(20, 20),
        backgroundColor: const Color(0xff77B2E1),
        side: const BorderSide(color: Colors.white),
      ),
      child: const Icon(
        Icons.settings,
        color: Colors.white,
        size: 16,
      ),
    );
  }
}
