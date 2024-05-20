import 'package:flutter/material.dart';
import 'package:wise_student_app/generated/l10n.dart';
import 'package:share_plus/share_plus.dart';

class ShareToButton extends StatelessWidget {
  const ShareToButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 10),
      child: ElevatedButton(
        onPressed: () {
          _shareContent('Copy link or share it from below');
        },
        style: ElevatedButton.styleFrom(
          fixedSize: const Size(168, 50),
          foregroundColor: Theme.of(context).colorScheme.background,
          backgroundColor: Theme.of(context).colorScheme.primary,
          side: BorderSide(color: Theme.of(context).colorScheme.secondary),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8),
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 16),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Icon(
                Icons.share,
                color: Theme.of(context).colorScheme.background,
                size: 14,
              ),
              Text(
                S.of(context).ShareTo,
                style: const TextStyle(fontSize: 12),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Future<void> _shareContent(String message) async {
    try {
      await Share.share(message);
      // ignore: empty_catches
    } catch (e) {}
  }
}

void main() {
  runApp(
    const MaterialApp(
      home: Scaffold(
        body: Center(
          child: ShareToButton(),
        ),
      ),
    ),
  );
}
