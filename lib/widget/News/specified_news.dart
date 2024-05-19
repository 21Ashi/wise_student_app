import 'package:flutter/material.dart';
import 'package:wise_student_app/generated/l10n.dart';

class SpeciefiedNews extends StatelessWidget {
  const SpeciefiedNews({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Image.asset('assets/newspic1.png'),
        Expanded(
            child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 16, right: 16),
              child: Text(
                S.of(context).SpecifiedNews,
                style: TextStyle(
                    fontSize: 13, color: Theme.of(context).colorScheme.primary),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 16, right: 16),
              child: Row(
                children: [
                  Icon(
                    Icons.access_time_filled,
                    color: Theme.of(context).colorScheme.primary,
                    size: 12,
                  ),
                  Text(
                    S.of(context).SpecifiedNewsDate,
                    style: TextStyle(
                        color: Theme.of(context).colorScheme.primary,
                        fontSize: 8),
                  ),
                  const Text(' | '),
                  Text(
                    S.of(context).SpecifiedNewsAdmin,
                    style: TextStyle(
                        color: Theme.of(context).colorScheme.primary,
                        fontSize: 8),
                  )
                ],
              ),
            ),
          ],
        ))
      ],
    );
  }
}
