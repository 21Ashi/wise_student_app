import 'package:flutter/material.dart';
import 'package:wise_student_app/generated/l10n.dart';
import 'package:wise_student_app/widget/StudentWidgets/Table/DirectReg/ele_major.dart';
import 'package:wise_student_app/widget/StudentWidgets/Table/DirectReg/ele_uni.dart';
import 'package:wise_student_app/widget/StudentWidgets/Table/DirectReg/man_coll.dart';
import 'package:wise_student_app/widget/StudentWidgets/Table/DirectReg/man_major.dart';
import 'package:wise_student_app/widget/StudentWidgets/Table/DirectReg/man_uni.dart';

class DirectRegistration extends StatefulWidget {
  const DirectRegistration({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _DirectRegistrationState createState() => _DirectRegistrationState();
}

class _DirectRegistrationState extends State<DirectRegistration> {
  final List<List<bool>> _selectedRowsList =
      List.generate(5, (index) => List.generate(5, (index) => false));

  void _toggleRowSelection(int tableIndex, int rowIndex) {
    setState(() {
      _selectedRowsList[tableIndex][rowIndex] =
          !_selectedRowsList[tableIndex][rowIndex];
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        shadowColor: Theme.of(context).colorScheme.secondary,
        elevation: 2,
        surfaceTintColor: Colors.transparent,
        centerTitle: true,
        title: Text(
          S.of(context).DirectRegistration,
          style: const TextStyle(fontWeight: FontWeight.bold),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(
              height: 5,
            ),
            Text(
              S.of(context).MandatoryUniversity,
              style: const TextStyle(fontSize: 16),
            ),
            const MandatoryUniversityC(),
            Text(
              S.of(context).MandatoryCollege,
              style: const TextStyle(fontSize: 16),
            ),
            const MandatoryCollegeC(),
            Text(
              S.of(context).MandatoryMajor,
              style: const TextStyle(fontSize: 16),
            ),
            const MandatoryMajorC(),
            Text(
              S.of(context).ElectiveMajor,
              style: const TextStyle(fontSize: 16),
            ),
            const ElectiveMajorC(),
            Text(
              S.of(context).ElectiveUni,
              style: const TextStyle(fontSize: 16),
            ),
            const ElectiveUniversityC(),
            const SizedBox(
              height: 20,
            )
          ],
        ),
      ),
    );
  }
}
