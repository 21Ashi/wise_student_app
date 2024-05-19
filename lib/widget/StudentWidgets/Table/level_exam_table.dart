import 'package:flutter/material.dart';
import 'package:wise_student_app/generated/l10n.dart';

class Levelexams extends StatelessWidget {
  final int numRows;

  const Levelexams({
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
                CustomTableCell(text: S.of(context).Marks),
              ],
            ),
            TableRow(
              children: [
                CustomTableCell(
                  text: S.of(context).CourseID,
                ),
                CustomTableCell(
                  text: S.of(context).Enlgish,
                ),
                CustomTableCell(text: S.of(context).pass),
              ],
            ),
            TableRow(
              children: [
                CustomTableCell(
                  text: S.of(context).CourseID,
                ),
                CustomTableCell(
                  text: S.of(context).Arabic,
                ),
                CustomTableCell(text: S.of(context).pass),
              ],
            ),
            TableRow(
              children: [
                CustomTableCell(
                  text: S.of(context).CourseID,
                ),
                CustomTableCell(
                  text: S.of(context).computer,
                ),
                CustomTableCell(text: S.of(context).fail),
              ],
            )
          ],
        ),
      ),
    );
  }
}

class CustomTableCell extends StatelessWidget {
  final String text;

  const CustomTableCell({Key? key, required this.text}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TableCell(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Text(
          text,
          style: const TextStyle(fontSize: 12), // Adjust font size as needed
        ),
      ),
    );
  }
}
