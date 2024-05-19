import 'package:flutter/material.dart';
import 'package:wise_student_app/generated/l10n.dart';
import 'package:wise_student_app/widget/StudentWidgets/drop_list_exams.dart';

class Marks extends StatelessWidget {
  const Marks({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        surfaceTintColor: Colors.transparent,
        elevation: 2,
        shadowColor: Theme.of(context).colorScheme.secondary,
        title: Text(
          S.of(context).Marks,
          style: const TextStyle(fontWeight: FontWeight.bold),
        ),
      ),
      body: const Column(
        children: [
          SizedBox(
            height: 20,
          ),
          DroplistExams()
        ],
      ),
    );
  }
}
