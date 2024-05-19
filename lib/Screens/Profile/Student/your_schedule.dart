import 'package:flutter/material.dart';
import 'package:wise_student_app/generated/l10n.dart';
import 'package:wise_student_app/widget/StudentWidgets/drop_list_semester.dart';

class Schedule extends StatelessWidget {
  const Schedule({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        surfaceTintColor: Colors.transparent,
        shadowColor: Theme.of(context).colorScheme.secondary,
        elevation: 2,
        title: Text(
          S.of(context).YourSchedule,
          style: const TextStyle(fontWeight: FontWeight.bold),
        ),
      ),
      body: const SingleChildScrollView(
        child: Column(children: [
          SizedBox(
            height: 20,
          ),
          DroplistSemester(),
          SizedBox(
            height: 20,
          ),
        ]),
      ),
    );
  }
}
