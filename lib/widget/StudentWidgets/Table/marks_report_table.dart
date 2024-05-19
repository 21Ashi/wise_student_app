import 'package:flutter/material.dart';
import 'package:wise_student_app/generated/l10n.dart';

class Markreport extends StatelessWidget {
  final int numRows;

  const Markreport({
    super.key,
    required this.numRows,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(12.0),
      child: Container(
        decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(
                offset: const Offset(0, 1),
                color: Theme.of(context).colorScheme.secondary)
          ],
          color: Theme.of(context).colorScheme.background,
          borderRadius: BorderRadius.circular(15),
        ),
        child: Table(
          border: TableBorder.all(
            borderRadius: BorderRadius.circular(15),
            color: Theme.of(context).colorScheme.primary,
          ),
          children: [
            TableRow(
              children: [
                CustomTableCell(
                  text: S.of(context).CourseID,
                ),
                CustomTableCell(
                  text: S.of(context).Coursename,
                ),
                CustomTableCell(text: S.of(context).CH),
                CustomTableCell(text: S.of(context).Marks),
                CustomTableCell(text: S.of(context).markinsymbols),
                CustomTableCell(text: S.of(context).notes),
              ],
            ),
            for (int i = 0; i < numRows; i++)
              const TableRow(
                children: [
                  CustomTableCell(text: '202020',),
                  CustomTableCell(text: '',),
                  CustomTableCell(text: ''),
                  CustomTableCell(text: ''),
                  CustomTableCell(text: ''),
                  CustomTableCell(text: ''),
                ],
              ),
          ],
        ),
      ),
    );
  }
}

class CustomTableCell extends StatelessWidget {
  final String text;

  const CustomTableCell({super.key, required this.text});

  @override
  Widget build(BuildContext context) {
    return TableCell(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Text(
          text,
          style: const TextStyle(fontSize: 9), // Adjust font size as needed
        ),
      ),
    );
  }
}
