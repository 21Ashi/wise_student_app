import 'package:flutter/material.dart';
import 'package:wise_student_app/generated/l10n.dart';
import 'package:wise_student_app/widget/StudentWidgets/Table/electronic_request_droplist.dart';

class ElectronicRequest extends StatelessWidget {
  const ElectronicRequest({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        shadowColor: Theme.of(context).colorScheme.secondary,
        surfaceTintColor: Colors.transparent,
        elevation: 2,
        title: Text(
          S.of(context).Electronicrequests,
          style: const TextStyle(fontWeight: FontWeight.bold),
        ),
      ),
      body: const Column(
        children: [SizedBox(height: 20), DroplistElectronicRequest()],
      ),
    );
  }
}
