import 'package:flutter/material.dart';

class TextTab extends StatefulWidget {
  final List<String> tabTitles;
  final Function(int) onTabSelected;

  const TextTab(
      {super.key, required this.tabTitles, required this.onTabSelected});

  @override
  // ignore: library_private_types_in_public_api
  _TextTabState createState() => _TextTabState();
}

class _TextTabState extends State<TextTab> {
  int _selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: List.generate(widget.tabTitles.length, (index) {
        return TabItem(
          text: widget.tabTitles[index],
          isSelected: index == _selectedIndex,
          onTap: () {
            setState(() {
              _selectedIndex = index;
            });
            widget.onTabSelected(index);
          },
        );
      }),
    );
  }
}

class TabItem extends StatelessWidget {
  final String text;
  final bool isSelected;
  final VoidCallback onTap;

  const TabItem(
      {super.key,
      required this.text,
      required this.isSelected,
      required this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Text(
              text,
              style: TextStyle(
                fontSize: 12.0,
                fontWeight: FontWeight.bold,
                color: isSelected
                    ? Theme.of(context).colorScheme.primary
                    : Theme.of(context).colorScheme.primary,
              ),
            ),
            AnimatedContainer(
                duration: const Duration(milliseconds: 300),
                height: isSelected ? 2.0 : 0.0,
                width: 23,
                color: Theme.of(context).colorScheme.primary),
          ],
        ),
      ),
    );
  }
}
