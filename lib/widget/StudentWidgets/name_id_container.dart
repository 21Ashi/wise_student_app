import 'package:flutter/material.dart';
import 'package:wise_student_app/generated/l10n.dart';
import 'package:wise_student_app/provider/provider_theme.dart';
import 'package:provider/provider.dart';

class NameIdContainer extends StatelessWidget {
  const NameIdContainer({super.key});

  @override
  Widget build(BuildContext context) {
    final prov = Provider.of<ThemeProvider>(context);
    return Container(
      height: 70,
      width: MediaQuery.sizeOf(context).width - 16,
      decoration: BoxDecoration(
          color: Theme.of(context).colorScheme.background,
          boxShadow: [
            BoxShadow(
                offset: const Offset(0, 1),
                color: Theme.of(context).colorScheme.secondary)
          ],
          borderRadius: BorderRadius.circular(15),
          border: Border.all(color: Theme.of(context).colorScheme.primary)),
      child: Padding(
        padding: const EdgeInsets.only(left: 10, top: 10, right: 10),
        child: Column(
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  S.of(context).name,
                ),
                const Divider(
                  indent: 50,
                ),
                Text(
                  prov.me!.fname.toString(),
                ),
              ],
            ),
            const SizedBox(
              height: 5,
            ),
            Row(
              children: [
                Text(
                  S.of(context).id,
                ),
                const Divider(
                  indent: 75,
                ),
                Text(
                  prov.me!.stdId.toString(),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}