import 'package:flutter/material.dart';
import 'package:wise_student_app/generated/l10n.dart';

class CustomTableWidget extends StatelessWidget {
  final List<bool> selectedRows;
  final Function(int) toggleRowSelection;
  final int numRows;

  const CustomTableWidget({
    super.key,
    required this.selectedRows,
    required this.toggleRowSelection,
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
                offset: const Offset(0, 2),
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
                CustomTableCell(text: S.of(context).Coursename),
                CustomTableCell(text: S.of(context).CH),
                CustomTableCell(text: S.of(context).period),
                CustomTableCell(text: S.of(context).Days),
                CustomTableCell(text: S.of(context).Location),
                CustomTableCell(text: S.of(context).instructorName),
                CustomTableCell(text: S.of(context).SectionNumber),
                const TableCell(
                  child: Text(
                    '', // Text for the header of the checkbox column
                  ),
                ),
              ],
            ),
            for (int i = 0; i < numRows; i++)
              TableRow(
                children: [
                  const CustomTableCell(
                    text: '',
                  ),
                  const CustomTableCell(
                    text: '',
                  ),
                  const CustomTableCell(text: ''),
                  const CustomTableCell(text: ''),
                  const CustomTableCell(text: ''),
                  const CustomTableCell(text: ''),
                  const CustomTableCell(text: ''),
                  TableCell(
                    child: Checkbox(
                      value: selectedRows[i],
                      onChanged: (value) {
                        toggleRowSelection(i);
                      },
                    ),
                  ),
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
          style: const TextStyle(fontSize: 6.5), // Adjust font size as needed
        ),
      ),
    );
  }
}
