import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:wise_student_app/generated/l10n.dart';
import 'package:wise_student_app/widget/StudentWidgets/Table/AvaliableClasses/ele_major.dart';
import 'package:wise_student_app/widget/StudentWidgets/Table/AvaliableClasses/ele_uni.dart';
import 'package:wise_student_app/widget/StudentWidgets/Table/AvaliableClasses/man_coll.dart';
import 'package:wise_student_app/widget/StudentWidgets/Table/AvaliableClasses/man_major.dart';
import 'package:wise_student_app/widget/StudentWidgets/Table/AvaliableClasses/man_uni.dart';

class AvailableClasses extends StatefulWidget {
  const AvailableClasses({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _DirectRegistrationState createState() => _DirectRegistrationState();
}

class _DirectRegistrationState extends State<AvailableClasses> {

  List<QueryDocumentSnapshot> data = [];

  getData() async {
    QuerySnapshot querySnapshot =
        await FirebaseFirestore.instance.collection('Courses').get();

    setState(() {
      data.addAll(querySnapshot.docs);
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
          S.of(context).AvailableClasses,
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
            const MandatoryUniversity(),
            Text(
              S.of(context).MandatoryCollege,
              style: const TextStyle(fontSize: 16),
            ),
            const MandatoryCollege(),
            Text(
              S.of(context).MandatoryMajor,
              style: const TextStyle(fontSize: 16),
            ),
            const MandatoryMajor(),
            Text(
              S.of(context).ElectiveMajor,
              style: const TextStyle(fontSize: 16),
            ),
            const ElectiveMajor(),
            Text(
              S.of(context).ElectiveUni,
              style: const TextStyle(fontSize: 16),
            ),
            const ElectiveUniversity(),
            const SizedBox(
              height: 20,
            )
          ],
        ),
      ),
    );
  }
}
