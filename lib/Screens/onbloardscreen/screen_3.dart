import 'package:flutter/material.dart';
import 'package:wise_student_app/generated/l10n.dart';
import 'package:google_fonts/google_fonts.dart';

class Screen3 extends StatelessWidget {
  const Screen3({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.only(top: 34),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset('assets/chat.png'),
                Text(
                  S.of(context).Chat,
                  style: GoogleFonts.hammersmithOne(
                      fontSize: 32,
                      color: Theme.of(context).colorScheme.primary),
                ),
                Padding(
                  padding: const EdgeInsets.only(bottom: 210),
                  child: Column(
                    children: [
                      Text(S.of(context).UnderChat1,
                          style: GoogleFonts.karma(
                              fontSize: 12, color: Colors.grey[700])),
                      Text(
                        S.of(context).UnderChat2,
                        style: GoogleFonts.karma(
                            fontSize: 12, color: Colors.grey[700]),
                      )
                    ],
                  ),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
