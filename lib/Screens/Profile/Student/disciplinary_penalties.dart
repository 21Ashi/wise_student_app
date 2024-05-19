import 'package:flutter/material.dart';
import 'package:wise_student_app/generated/l10n.dart';
import 'package:wise_student_app/widget/StudentWidgets/name_id_major.dart';

class Disciplinary extends StatelessWidget {
  const Disciplinary({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        surfaceTintColor: Colors.transparent,
        elevation: 2,
        shadowColor: Theme.of(context).colorScheme.secondary,
        title: Text(
          S.of(context).Disciplinarypenalties,
          style: const TextStyle(fontWeight: FontWeight.bold),
        ),
      ),
      body: Center(
        child: Column(
          children: [
            const SizedBox(
              height: 20,
            ),
            const NameIDMajor(),
            const SizedBox(
              height: 20,
            ),
            Text(
              S.of(context).Thereisnodisciplinary,
              style: const TextStyle(
                  color: Color(
                    0xff4b62a9,
                  ),
                  fontWeight: FontWeight.bold,
                  fontSize: 16),
            )
          ],
        ),
      ),
    );
  }
}
