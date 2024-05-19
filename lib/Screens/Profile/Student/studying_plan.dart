import 'package:flutter/material.dart';
import 'package:wise_student_app/generated/l10n.dart';
import 'package:wise_student_app/widget/StudentWidgets/Table/AvaliableClasses/available_classes_table.dart';

class Studyingplan extends StatelessWidget {
  const Studyingplan({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 2,
        shadowColor: Theme.of(context).colorScheme.secondary,
        surfaceTintColor: Colors.transparent,
        title: Text(
          S.of(context).StudyingPlan,
          style: const TextStyle(fontWeight: FontWeight.bold),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(
              height: 5,
            ),
            Center(
              child: Text(
                S.of(context).MandatoryUniversity,
                style: const TextStyle(fontSize: 16),
              ),
            ),
            const CustomTableWidget2(numRows: 3),
            Text(
              S.of(context).MandatoryCollege,
              style: const TextStyle(fontSize: 16),
            ),
            const CustomTableWidget2(numRows: 3),
            Text(
              S.of(context).MandatoryMajor,
              style: const TextStyle(fontSize: 16),
            ),
            const CustomTableWidget2(numRows: 3),
            Text(
              S.of(context).ElectiveUni,
              style: const TextStyle(fontSize: 16),
            ),
            const CustomTableWidget2(numRows: 3),
            Text(
              S.of(context).ElectiveMajor,
              style: const TextStyle(fontSize: 16),
            ),
            const CustomTableWidget2(numRows: 3),
            Text(
              S.of(context).compulsory,
              style: const TextStyle(fontSize: 16),
            ),
            const CustomTableWidget2(numRows: 9),
            const SizedBox(
              height: 20,
            )
          ],
        ),
      ),
    );
  }
}
