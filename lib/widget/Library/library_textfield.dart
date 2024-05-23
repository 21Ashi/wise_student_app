import 'package:flutter/material.dart';
import 'package:wise_student_app/generated/l10n.dart';

class LibraryTextField extends StatefulWidget {
  final Widget? suffix;
  final ValueChanged<String>? onChanged;
  final void Function(String)? onSearch; // Add onSearch callback

  const LibraryTextField(
      {super.key, required this.suffix, this.onChanged, this.onSearch});

  @override
  State<LibraryTextField> createState() => _AnimatedTextFieldState2();
}

class _AnimatedTextFieldState2 extends State<LibraryTextField>
    with SingleTickerProviderStateMixin {
  AnimationController? controller;
  late Animation<double> alpha;
  final focusNode = FocusNode();
  final TextEditingController _textEditingController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: Colors.white),
        color: const Color(0x99FF7315),
      ),
      child: TextField(
        onChanged: (text) {
          if (widget.onChanged != null) {
            widget.onChanged!(text);
          }
          // Optionally, perform search after delay
          _performSearch(text);
        },
        onSubmitted: (text) {
          // Perform search when submitted
          _performSearch(text);
        },
        focusNode: focusNode,
        controller: _textEditingController,
        decoration: InputDecoration(
          prefixIcon:
              Icon(Icons.search, color: Theme.of(context).colorScheme.primary),
          hintText: S.of(context).Search,
          hintStyle: const TextStyle(fontSize: 15),
          contentPadding:
              const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
          border: InputBorder.none,
        ),
      ),
    );
  }

  void _performSearch(String searchText) {
    if (widget.onSearch != null) {
      widget.onSearch!(searchText);
    }
  }

  @override
  void dispose() {
    _textEditingController.dispose();
    super.dispose();
  }
}
