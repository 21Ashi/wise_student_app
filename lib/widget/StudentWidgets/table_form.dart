import 'package:flutter/material.dart';

class CustomTableCell extends StatelessWidget {
  final String text;

  const CustomTableCell({super.key, required this.text});

  @override
  Widget build(BuildContext context) {
    return TableCell(
      child: Padding(
        padding: const EdgeInsets.all(8),
        child: Center(
          child: Text(
            text,
            style: TextStyle(
                fontFamily: 'Bakbak One',
                fontWeight: FontWeight.bold,
                fontSize: 6.5,
                color: Theme.of(context).colorScheme.primary),
          ),
        ),
      ),
    );
  }
}

class TableCellContent extends StatelessWidget {
  final String text;

  const TableCellContent(this.text, {super.key});

  @override
  Widget build(BuildContext context) {
    return TableCell(
      child: Padding(
        padding: const EdgeInsets.all(8),
        child: Center(
          child: Text(
            text,
            style: TextStyle(
                color: Theme.of(context).colorScheme.primary,
                fontFamily: 'Bakbak One',
                fontWeight: FontWeight.bold,
                fontSize: 10),
          ),
        ),
      ),
    );
  }
}
